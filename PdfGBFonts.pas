{*
 * << P o w e r P d f >> -- PdfGBFonts.pas
 *
 * << Japanese font set for Shift-JIS Charactors >>
 *
 * Copyright (c) 1999-1101 Takezou. <takeshi_kanno@est.hi-ho.ne.jp>
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Library General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or any
 * later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Library general Public License for more
 * details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library.
 *
 * Create 2001.04.14
 *
 *}

unit PdfGBFonts;

interface

uses
  SysUtils, Classes, PdfDoc, PdfTypes, PdfJpFonts;

const
  CIDTYPE2_GB_FONT_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'Font'),
                         (KEY: 'Subtype'; VAL: 'CIDFontType2'),
                         (KEY: 'WinCharSet'; VAL: '128')
                         );

  CIDTYPE2_GB_FONT_DEFAULT_WIDTH = 1000;
  CIDTYPE2_GB_FONT_WIDTH_ARRAY: array[0..2] of Integer = (231, 631, 500);

  CIDTYPE2_GB_FONT_BBOX: array[0..3] of Integer = (0,-141,1000,859);

  CIDTYPE2_GB_FONT_DISC_INT_TABLE: array[0..3] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 859),
                         (KEY: 'CapHeight'; VAL: 859),
                         (KEY: 'Descent'; VAL: -141),
                         (KEY: 'MissingWidth'; VAL: 500)
                         );

  TYPE0_GB_FONT_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'Font'),
                         (KEY: 'Subtype'; VAL: 'Type0'),
                         (KEY: 'Encoding'; VAL: 'GB-EUC-H')
                         );

type
  TCharToCMap = function(S: string; Index: integer): integer;

  TPdfGBFont = class(TPdfType0Font)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); virtual;
    procedure AddDescendantFontItem(ADescendantFont: TPdfDictionary); virtual;
    function GetFontName: string; virtual;
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfGBFixedFont = class(TPdfGBFont)
  protected
    procedure AddDescendantFontItem(ADescendantFont: TPdfDictionary); override;
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfChinese = class(TPdfGBFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

implementation

//uses
// PdfGBCMap;

{ CharToCMap_GB_EUC_H }
function CharToCMap_GB_EUC_H(S: string; Index: integer): integer;
begin
  case ByteType(S, Index) of
    mbSingleByte: result := 0;
    mbLeadByte: result := 0;
    mbTrailByte: result := -1;
  end;
end;

{ TPdfGBFont }

// AddDescriptorItem
procedure TPdfGBFont.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
begin
end;

// GetFontName
function TPdfGBFont.GetFontName: string;
begin
  result := '';
end;

// .AddDescendantFontItem
procedure TPdfGBFont.AddDescendantFontItem(ADescendantFont: TPdfDictionary);
begin
end;

// Create
constructor TPdfGBFont.Create(AXref: TPdfXref; AName: string);
var
  FFontDescriptor: TPdfDictionary;
  FFont: TPdfDictionary;
  FDescendantFont: TPdfDictionary;
  FDescendantFontArray: TPdfArray;
  FCIDSystemInfo: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  FFont.AddNameItem('BaseFont', GetFontName);

  // create descendant font.
  FDescendantFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FDescendantFont);

  FDescendantFontArray := TPdfArray.CreateArray(AXref);
  FDescendantFontArray.AddItem(FDescendantFont);
  FFont.AddItem('DescendantFonts', FDescendantFontArray);

  AddStrElements(FDescendantFont, CIDTYPE2_GB_FONT_STR_TABLE);
  FDescendantFont.AddNameItem('BaseFont', GetFontName);

  FCIDSystemInfo := TPdfDictionary.CreateDictionary(AXref);
  with FCIDSystemInfo do
  begin
    AddItem('Registry', TPdfText.CreateText('Adobe'));
    AddItem('Ordering', TPdfText.CreateText('GB1'));
    AddItem('Supplement', TPdfNumber.CreateNumber(2));
  end;

  with FDescendantFont do
  begin
    AddItem('CIDSystemInfo', FCIDSystemInfo);
    AddNumberItem('DW', CIDTYPE2_GB_FONT_DEFAULT_WIDTH);
  end;
  AddDescendantFontItem(FDescendantFont);

  // create font descriptor.
  FFontDescriptor := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFontDescriptor);

  FFontDescriptor.AddNameItem('Type', 'FontDescriptor');
  FFontDescriptor.AddNameItem('BaseFont', GetFontName);
  AddIntElements(FFontDescriptor, CIDTYPE2_GB_FONT_DISC_INT_TABLE);
  AddDescriptorItem(FFontDescriptor);
  FFontDescriptor.AddItem('FontBBox',
             TPdfArray.CreateNumArray(AXref, CIDTYPE2_GB_FONT_BBOX));
  FDescendantFont.AddItem('FontDescriptor', FFontDescriptor);

  SetData(FFont);
end;

// AddDescendantFontItem
procedure TPdfGBFixedFont.AddDescendantFontItem(ADescendantFont: TPdfDictionary);
var
  FWidths: TPdfArray;
begin
  FWidths := TPdfArray.CreateNumArray(nil, CIDTYPE2_GB_FONT_WIDTH_ARRAY);
  ADescendantFont.AddItem('W', FWidths);
end;

constructor TPdfGBFixedFont.Create(AXref: TPdfXref; AName: string);
begin
  inherited Create(AXref, AName);
  AddStrElements(Data, TYPE0_GB_FONT_STR_TABLE);
  SetCharToCMap(@CharToCMap_GB_EUC_H);
end;

{ TPdfGothic }
procedure TPdfChinese.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 78);
  end;
end;

function TPdfChinese.GetFontName: string;
begin
  result := 'Chinese';
end;

initialization

  RegisterClassAlias(TPdfChinese, 'Chinese');

  finalization

  UnRegisterClass(TPdfChinese);

end.
