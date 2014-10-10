{*
 * << P o w e r P d f >> -- PdfJpFonts.pas
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
unit PdfJpFonts;

interface

uses
  SysUtils, Classes, PdfDoc, PdfTypes;

const
  CIDTYPE2_JP_FONT_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'Font'),
                         (KEY: 'Subtype'; VAL: 'CIDFontType2'),
                         (KEY: 'WinCharSet'; VAL: '128')
                         );

  CIDTYPE2_JP_FONT_DEFAULT_WIDTH = 1000;
  CIDTYPE2_JP_FONT_WIDTH_ARRAY: array[0..2] of Integer = (231, 631, 500);

  CIDTYPE2_JP_FONT_BBOX: array[0..3] of Integer = (0,-141,1000,859);

  CIDTYPE2_JP_FONT_DISC_INT_TABLE: array[0..3] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 859),
                         (KEY: 'CapHeight'; VAL: 859),
                         (KEY: 'Descent'; VAL: -141),
                         (KEY: 'MissingWidth'; VAL: 500)
                         );

  TYPE0_JP_FONT_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'Font'),
                         (KEY: 'Subtype'; VAL: 'Type0'),
                         (KEY: 'Encoding'; VAL: '90ms-RKSJ-H')
                         );

  TYPE0_JPP_FONT_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'Font'),
                         (KEY: 'Subtype'; VAL: 'Type0'),
                         (KEY: 'Encoding'; VAL: '90msp-RKSJ-H')
                         );

  // PGothic widths array from CID 1
  PGOTHIC_FONT_WIDTH_ARRAY1: array[0..94]of Integer = (
       305,219,500,500,500,500,594,203,305,305,500,500,203,500,203,500,
       500,500,500,500,500,500,500,500,500,500,203,203,500,500,500,453,
       668,633,637,664,648,566,551,680,641,246,543,598,539,742,641,707,
       617,707,625,602,590,641,633,742,602,590,566,336,504,336,414,305,
       414,477,496,500,496,500,305,461,500,211,219,461,211,734,500,508,
       496,496,348,461,352,500,477,648,461,477,457,234,234,234,414
       );

  // PGothic widths array from CID 326
  PGOTHIC_FONT_WIDTH_ARRAY2: array[0..63] of Integer = (
       500,441,441,441,441,441,547,523,445,480,469,516,523,504,438,500,
       641,617,566,625,598,637,563,652,539,621,523,664,590,637,645,555,
       527,602,602,602,461,645,598,578,648,492,637,516,547,613,641,605,
       453,660,508,609,664,641,520,559,512,656,566,559,590,563,250,230
       );

  // PGothic widths array from CID 633
  PGOTHIC_FONT_WIDTH_ARRAY3: array[0..62]of Integer = (
       664,664,664,664,664,500,500,500,1000,1000,500,500,500,500,500,500,
       1000,1000,746,746,734,699,1000,1000,1000,1000,1000,961,1000,500,1000,1000,
       1000,1000,1000,1000,1000,500,500,500,500,500,500,500,500,500,500,500,
       500,500,500,500,500,500,500,500,500,500,500,1000,1000,1000,1000
       );

  // PGothic widths array from CID 771
  PGOTHIC_FONT_WIDTH_ARRAY4: array[0..7]of Integer = (
       1000,1000,1000,1000,1000,500,500,500
       );

  // PGothic widths array from CID 780
  PGOTHIC_FONT_WIDTH_ARRAY5: array[0..9]of Integer = (
       684,684,684,684,684,684,684,684,684,684
       );

  // PGothic widths array from CID 790
  PGOTHIC_FONT_WIDTH_ARRAY6: array[0..25]of Integer = (
       715,777,742,758,711,633,773,770,273,605,754,629,934,770,805,711,
       805,758,742,617,770,715,980,652,648,648
       );

  // PGothic widths array from CID 816
  PGOTHIC_FONT_WIDTH_ARRAY7: array[0..25]of Integer = (
       574,602,563,602,563,297,578,621,250,250,594,250,938,621,605,605,
       602,379,570,336,621,512,777,520,496,508
       );

  // PGothic widths array from CID 842
  PGOTHIC_FONT_WIDTH_ARRAY8: array[0..82]of Integer = (
       746,941,805,945,602,707,750,902,805,945,1000,1000,844,902,590,816,
       945,980,797,895,766,883,766,766,961,980,1000,1000,922,961,922,922,
       863,902,805,953,957,902,902,766,883,902,941,1000,1000,1000,1000,1000,
       1000,961,961,961,1000,1000,1000,1000,1000,1000,1000,1000,1000,891,1000,980,
       980,805,844,1000,844,980,727,863,805,746,863,1000,844,863,1000,1000,
       1000,855,961
       );

  // PGothic widths array from CID 925
  PGOTHIC_FONT_WIDTH_ARRAY9: array[0..62]of Integer = (
       758,898,652,824,754,941,742,895,809,934,824,922,961,965,805,941,
       930,961,797,891,1000,1000,898,898,902,965,914,980,805,883,766,922,
       910,961,734,863,922,887,961,648,707,941,910,824,930,707,1000,1000,
       1000,766,863,863,805,883,883,945,945,945,922,953,953,902,668
       );

  // PGothic widths array from CID 988
  PGOTHIC_FONT_WIDTH_ARRAY10: array[0..22]of Integer = (
       977,719,898,805,980,813,961,629,727,809,746,1000,852,863,766,941,
       1000,1000,805,863,961,727,777
       );

  // PMincyo widths array from CID 1
  PMINCYO_FONT_WIDTH_ARRAY1: array[0..94]of Integer = (
       305,305,461,500,500,500,613,305,305,305,500,500,305,500,305,500,
       500,500,500,500,500,500,500,500,500,500,305,305,500,500,500,500,
       727,664,621,699,691,598,598,711,723,289,387,668,586,801,664,766,
       563,766,602,504,625,691,664,871,656,625,563,332,500,332,305,305,
       305,453,500,465,500,473,254,473,500,242,242,492,242,703,500,500,
       500,500,367,414,352,500,477,602,469,477,453,242,219,242,500
       );

  // PMincyo widths array from CID 326
  PMINCYO_FONT_WIDTH_ARRAY2: array[0..63] of Integer = (
       500,441,441,441,441,441,547,523,445,480,469,516,523,504,438,500,
       641,617,566,625,598,637,563,652,539,621,523,664,590,637,645,555,
       527,602,602,602,461,645,598,578,648,492,637,516,547,613,641,605,
       453,660,508,609,664,641,520,559,512,656,566,559,590,563,250,230
       );

  // PMincyo widths array from CID 633
  PMINCYO_FONT_WIDTH_ARRAY3: array[0..62]of Integer = (
       664,664,664,664,664,500,500,500,1000,1000,500,500,500,500,500,500,
       1000,1000,648,801,652,703,1000,1000,1000,1000,1000,1000,1000,500,1000,1000,
       1000,1000,1000,1000,1000,500,500,500,500,500,500,500,500,500,500,500,
       500,500,500,500,500,500,500,500,500,500,500,1000,1000,1000,1000
       );

  // PMincyo widths array from CID 771
  PMINCYO_FONT_WIDTH_ARRAY4: array[0..7]of Integer = (
       1000,1000,1000,1000,1000,500,500,500
       );

  // PMincyo widths array from CID 780
  PMINCYO_FONT_WIDTH_ARRAY5: array[0..9]of Integer = (
       621,621,621,621,621,621,621,621,621,621
       );

  // PMincyo widths array from CID 790
  PMINCYO_FONT_WIDTH_ARRAY6: array[0..25]of Integer = (
       805,715,762,813,719,688,801,859,359,359,805,676,1000,836,832,680,
       832,727,688,719,855,770,977,730,777,656
       );

  // PMincyo widths array from CID 816
  PMINCYO_FONT_WIDTH_ARRAY7: array[0..25]of Integer = (
       531,574,531,574,543,387,559,613,293,293,570,293,875,613,574,574,
       574,414,469,422,613,543,781,574,563,500
       );

  // PMincyo widths array from CID 842
  PMINCYO_FONT_WIDTH_ARRAY8: array[0..82]of Integer = (
       754,883,750,953,508,617,703,898,801,1000,945,949,793,895,645,805,
       914,980,754,867,754,883,777,777,1000,1000,1000,1000,922,961,906,949,
       902,902,855,1000,1000,902,941,703,844,902,949,1000,1000,949,969,1000,
       1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,945,980,980,824,1000,1000,
       953,758,875,1000,836,934,688,785,766,641,793,984,863,801,953,945,
       984,855,945
       );

  // PMincyo widths array from CID 925
  PMINCYO_FONT_WIDTH_ARRAY9: array[0..62]of Integer = (
       750,891,668,777,707,801,805,941,809,941,879,926,887,902,746,883,
       883,934,793,863,953,961,902,902,820,902,930,949,754,855,785,910,
       965,945,734,848,922,902,1000,590,707,973,910,805,922,699,977,977,
       977,656,852,844,844,945,945,1000,1000,1000,883,922,922,930,609
       );

  // PMincyo widths array from CID 988
  PMINCYO_FONT_WIDTH_ARRAY10: array[0..22]of Integer = (
       863,676,941,789,926,793,941,598,703,766,609,980,832,785,699,805,
       965,961,785,863,883,695,766
       );

type
  TCharToCMap = function(S: string; Index: integer): integer;

  TPdfCIDWidthItem = class(TObject)
  private
    FStrCID: integer;
    FEndCID: integer;
    FWidth: Word;
  protected
    property StrCID: integer read FStrCID write FStrCID;
    property EndCID: integer read FEndCID write FEndCID;
    property Width: Word read FWidth write FWidth;
  end;

  TPdfType0Font = class(TPdfFont)
  private
    FCharToCMap: TCharToCMap;
    FArray: TList;
    FDW: Word;
    FMissingWidth: Word;
  protected
    function CidWidth(CID: integer): Word;
  public
    destructor Destroy; override;
    procedure SetData(AData: TPdfDictionary); override;
    procedure SetCharToCMap(AFunc: TCharToCMap); virtual;
    function GetCharWidth(AText: string; APos: integer): integer; override;
  end;

  TPdfJpFont = class(TPdfType0Font)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); virtual;
    procedure AddDescendantFontItem(ADescendantFont: TPdfDictionary); virtual;
    function GetFontName: string; virtual;
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfJpFixedFont = class(TPdfJpFont)
  protected
    procedure AddDescendantFontItem(ADescendantFont: TPdfDictionary); override;
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfGothic = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfGothicBold = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfGothicItalic = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfGothicBoldItalic = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfMincyo = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfMincyoBold = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfMincyoItalic = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfMincyoBoldItalic = class(TPdfJpFixedFont)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfJpProportionalFont = class(TPdfJpFont)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfPGothic = class(TPdfJpProportionalFont)
  protected
    procedure AddDescendantFontItem(ADescendantFont: TPdfDictionary); override;
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPGothicBold = class(TPdfPGothic)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPGothicItalic = class(TPdfPGothic)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPGothicBoldItalic = class(TPdfPGothic)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPMincyo = class(TPdfJpProportionalFont)
  protected
    procedure AddDescendantFontItem(ADescendantFont: TPdfDictionary); override;
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPMincyoBold = class(TPdfPMincyo)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPMincyoItalic = class(TPdfPMincyo)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

  TPdfPMincyoBoldItalic = class(TPdfPMincyo)
  protected
    procedure AddDescriptorItem(AFontDescriptor: TPdfDictionary); override;
    function GetFontName: string; override;
  end;

implementation

uses
  PdfJpCMap;

{ TPdfType0Font }

// SetData
procedure TPdfType0Font.SetData(AData: TPdfDictionary);
var
  DescendantFonts: TPdfArray;
  DescendantFont: TPdfDictionary;
  Discriptor: TPdfDictionary;
  CIDWidthItem: TPdfCIDWidthItem;
  i, j: integer;
  WidthsRoot, Widths: TPdfArray;
  TmpCID: integer;
begin
  inherited SetData(AData);

  // set font attributes from specified font data.
  DescendantFonts := Data.PdfArrayByName('DescendantFonts');
  DescendantFont := TPdfDictionary(DescendantFonts.Items[0]);
  FDW := DescendantFont.PdfNumberByName('DW').Value;
  Discriptor := DescendantFont.PdfDictionaryByName('FontDescriptor');
  FMissingWidth := Discriptor.PdfNumberByName('MissingWidth').Value;
  FArray := TList.Create;
  WidthsRoot := DescendantFont.PdfArrayByName('W');

  // create widths array from "W"attribute.
  i := 0;
  while i < WidthsRoot.ItemCount do
  begin
    // "W"attribute constst of forrowing data format.
    // type1. <CID of first char> <CID if last char> <char width>
    // type2. <CID od first char> "["<array of char widths>"]"

    if not (WidthsRoot.Items[i] is TPdfNumber) then
     raise EPdfInvalidValue.Create('invalid W array start pos..');

    TmpCID := TPdfNumber(WidthsRoot.Items[i]).Value;
    inc(i);
    if i >= WidthsRoot.ItemCount then Break;

    if (WidthsRoot.Items[i] is TPdfNumber) then
    begin
      // type1 data format.
      CIDWidthItem := TPdfCIDWidthItem.Create;
      CIDWidthItem.StrCID := TmpCID;
      inc(i);
      if not (WidthsRoot.Items[i] is TPdfNumber) then
        raise EPdfInvalidValue.Create('invalid W array end pos..')
      else
        CIDWidthItem.EndCID := TPdfNumber(WidthsRoot.Items[i]).Value;
    end
    else
    begin
      if not (WidthsRoot.Items[i] is TPdfArray) then
        raise EPdfInvalidValue.Create('invalid W array value..');
      // type2 data format.
      Widths := TPdfArray(WidthsRoot.Items[i]);
      for j := 0 to Widths.ItemCount - 1 do
      begin
        CIDWidthItem := TPdfCIDWidthItem.Create;
        CIDWidthItem.StrCID := TmpCID;
        CIDWidthItem.EndCID := TmpCID;
        CIDWidthItem.Width := TPdfNumber(Widths.Items[j]).Value;
        FArray.Add(CIDWidthItem);
        inc(TmpCID);
      end;
    end;
    inc(i);
  end;
end;

// CidWidth
function TPdfType0Font.CidWidth(CID: integer): Word;
var
  i: integer;
  CIDWidthItem: TPdfCIDWidthItem;
begin
  result := 0;
  for i := 0 to FArray.Count - 1 do
  begin
    CIDWidthItem := TPdfCIDWidthItem(FArray.Items[i]);
    if CIDWidthItem.EndCID >= CID then
      if CIDWidthItem.StrCID <= CID then
      begin
        result := CIDWidthItem.Width;
        Break;
      end
      else
        Break;
  end;
end;

// GetCharWidth
function TPdfType0Font.GetCharWidth(AText: string; APos: integer): integer;
var
  CID: integer;
begin
  result := 0;
  CID := FCharToCMap(AText, APos);
  if CID = -1 then Exit;

  result := CidWidth(CID);
  if result = 0 then
    if ByteType(AText, APos) = mbSingleByte then
      result := FMissingWidth
    else
      result := FDW;
end;

// Destroy
destructor TPdfType0Font.Destroy;
var
  i: integer;
begin
  if FArray <> nil then
  begin
    for i := FArray.Count - 1 downto 0 do
      TObject(FArray.Items[i]).Free;
    FArray.Free;
  end;
  inherited;
end;

// SetCharToCMap
procedure TPdfType0Font.SetCharToCMap(AFunc: TCharToCMap);
begin
  FCharToCMap := AFunc;
end;

{ TPdfJpFont }

// AddDescriptorItem
procedure TPdfJpFont.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
begin
end;

// GetFontName
function TPdfJpFont.GetFontName: string;
begin
  result := '';
end;

// .AddDescendantFontItem
procedure TPdfJpFont.AddDescendantFontItem(ADescendantFont: TPdfDictionary);
begin
end;

// Create
constructor TPdfJpFont.Create(AXref: TPdfXref; AName: string);
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

  AddStrElements(FDescendantFont, CIDTYPE2_JP_FONT_STR_TABLE);
  FDescendantFont.AddNameItem('BaseFont', GetFontName);

  FCIDSystemInfo := TPdfDictionary.CreateDictionary(AXref);
  with FCIDSystemInfo do
  begin
    AddItem('Registry', TPdfText.CreateText('Adobe'));
    AddItem('Ordering', TPdfText.CreateText('Japan1'));
    AddItem('Supplement', TPdfNumber.CreateNumber(2));
  end;

  with FDescendantFont do
  begin
    AddItem('CIDSystemInfo', FCIDSystemInfo);
    AddNumberItem('DW', CIDTYPE2_JP_FONT_DEFAULT_WIDTH);
  end;
  AddDescendantFontItem(FDescendantFont);

  // create font descriptor.
  FFontDescriptor := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFontDescriptor);

  FFontDescriptor.AddNameItem('Type', 'FontDescriptor');
  FFontDescriptor.AddNameItem('BaseFont', GetFontName);
  AddIntElements(FFontDescriptor, CIDTYPE2_JP_FONT_DISC_INT_TABLE);
  AddDescriptorItem(FFontDescriptor);
  FFontDescriptor.AddItem('FontBBox',
             TPdfArray.CreateNumArray(AXref, CIDTYPE2_JP_FONT_BBOX));
  FDescendantFont.AddItem('FontDescriptor', FFontDescriptor);

  SetData(FFont);
end;

// AddDescendantFontItem
procedure TPdfJpFixedFont.AddDescendantFontItem(ADescendantFont: TPdfDictionary);
var
  FWidths: TPdfArray;
begin
  FWidths := TPdfArray.CreateNumArray(nil, CIDTYPE2_JP_FONT_WIDTH_ARRAY);
  ADescendantFont.AddItem('W', FWidths);
end;

constructor TPdfJpFixedFont.Create(AXref: TPdfXref; AName: string);
begin
  inherited Create(AXref, AName);
  AddStrElements(Data, TYPE0_JP_FONT_STR_TABLE);
  SetCharToCMap(@CharToCMap_90MS_RKSJ_H);
end;

{ TPdfGothic }
procedure TPdfGothic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
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

function TPdfGothic.GetFontName: string;
begin
  result := 'Gothic';
end;

{ TPdfGothicBold }
procedure TPdfGothicBold.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH +
             PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 156);
  end;
end;

function TPdfGothicBold.GetFontName: string;
begin
  result := 'Gothic,Bold';
end;

{ TPdfGothicItalic }

// AddDescriptorItem
procedure TPdfGothicItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 78);
  end;
end;

// GetFontName
function TPdfGothicItalic.GetFontName: string;
begin
  result := 'Gothic,Italic';
end;

{ TPdfGothicBoldItalic }

// AddDescriptorItem
procedure TPdfGothicBoldItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH +
             PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfGothicBoldItalic.GetFontName: string;
begin
  result := 'Gothic,BoldItalic';
end;

{ TPdfMincyo }

// AddDescriptorItem
procedure TPdfMincyo.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH +
             PDF_FONT_SERIF;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 78);
  end;
end;

function TPdfMincyo.GetFontName: string;
begin
  result := 'Mincyo';
end;

{ TPdfMincyoBold }

// AddDescriptorItem
procedure TPdfMincyoBold.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH +
             PDF_FONT_FOURCE_BOLD +
             PDF_FONT_SERIF;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfMincyoBold.GetFontName: string;
begin
  result := 'Mincyo,Bold';
end;

{ TPdfMincyoItalic }

// AddDescriptorItem
procedure TPdfMincyoItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH +
             PDF_FONT_SERIF;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 78);
  end;
end;

// GetFontName
function TPdfMincyoItalic.GetFontName: string;
begin
  result := 'Mincyo,Italic';
end;

{ TPdfMincyoBoldItalic }

// AddDescriptorItem
procedure TPdfMincyoBoldItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC +
             PDF_FONT_FIXED_WIDTH +
             PDF_FONT_SERIF +
             PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfMincyoBoldItalic.GetFontName: string;
begin
  result := 'Mincyo,BoldItalic';
end;

{ TPdfJpProportionalFont }

// Create
constructor TPdfJpProportionalFont.Create(AXref: TPdfXref; AName: string);
begin
  inherited Create(AXref, AName);
  AddStrElements(Data, TYPE0_JPP_FONT_STR_TABLE);
  SetCharToCMap(@CharToCMap_90MSP_RKSJ_H);
end;

{ TPdfPGothic }

// AddDescendantFontItem
procedure TPdfPGothic.AddDescendantFontItem(ADescendantFont: TPdfDictionary);
var
  FWidthsRoot: TPdfArray;
  FWidths: TPdfArray;
begin
  FWidthsRoot := TPdfArray.CreateArray(nil);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(1));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY1);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(326));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY2);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(633));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY3);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(771));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY4);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(780));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY5);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(790));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY6);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(816));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY7);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(842));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY8);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(925));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY9);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(988));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY10);
  FWidthsRoot.AddItem(FWidths);
  ADescendantFont.AddItem('W', FWidthsRoot);
end;

// AddDescriptorItem
procedure TPdfPGothic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 78);
  end;
end;

// GetFontName
function TPdfPGothic.GetFontName: string;
begin
  result := 'PGothic'
end;

{ TPdfPGothicBold }

// AddDescriptorItem
procedure TPdfPGothicBold.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC + PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfPGothicBold.GetFontName: string;
begin
  result := 'PGothic,Bold'
end;

{ TPdfPGothicItalic }

// AddDescriptorItem
procedure TPdfPGothicItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 78);
  end;
end;

// GetFontName
function TPdfPGothicItalic.GetFontName: string;
begin
  result := 'PGothic,Italic'
end;

{ TPdfPGothicBoldItalic }

// AddDescriptorItem
procedure TPdfPGothicBoldItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC + PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfPGothicBoldItalic.GetFontName: string;
begin
  result := 'PGothic,BoldItalic'
end;

{ TPdfPMincyo }

// AddDescendantFontItem
procedure TPdfPMincyo.AddDescendantFontItem(ADescendantFont: TPdfDictionary);
var
  FWidthsRoot: TPdfArray;
  FWidths: TPdfArray;
begin
  FWidthsRoot := TPdfArray.CreateArray(nil);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(1));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY1);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(326));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY2);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(633));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY3);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(771));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY4);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(780));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY5);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(790));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY6);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(816));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY7);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(842));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY8);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(925));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY9);
  FWidthsRoot.AddItem(FWidths);
  FWidthsRoot.AddItem(TPdfNumber.CreateNumber(988));
  FWidths := TPdfArray.CreateNumArray(nil, PGOTHIC_FONT_WIDTH_ARRAY10);
  FWidthsRoot.AddItem(FWidths);
  ADescendantFont.AddItem('W', FWidthsRoot);
end;

// AddDescriptorItem
procedure TPdfPMincyo.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC + PDF_FONT_SERIF;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 78);
  end;
end;

// GetFontName
function TPdfPMincyo.GetFontName: string;
begin
  result := 'PMincyo'
end;

{ TPdfPMincyoBold }

// AddDescriptorItem
procedure TPdfPMincyoBold.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC + PDF_FONT_SERIF + PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', 0);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfPMincyoBold.GetFontName: string;
begin
  result := 'PMincyo,Bold'
end;

{ TPdfPMincyoItalic }

// AddDescriptorItem
procedure TPdfPMincyoItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC + PDF_FONT_SERIF;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 78);
  end;
end;

// GetFontName
function TPdfPMincyoItalic.GetFontName: string;
begin
  result := 'PMincyo,Italic'
end;

{ TPdfPMincyoBoldItalic }

// AddDescriptorItem
procedure TPdfPMincyoBoldItalic.AddDescriptorItem(AFontDescriptor: TPdfDictionary);
var
  Flags: integer;
begin
  with AFontDescriptor do
  begin
    Flags := PDF_FONT_SYMBOLIC + PDF_FONT_SERIF + PDF_FONT_FOURCE_BOLD;
    AddNumberItem('Flags', Flags);
    AddNumberItem('ItalicAngle', -11);
    AddNumberItem('StemV', 156);
  end;
end;

// GetFontName
function TPdfPMincyoBoldItalic.GetFontName: string;
begin
  result := 'PMincyo,BoldItalic'
end;

initialization

  RegisterClassAlias(TPdfGothic, 'Gothic');
  RegisterClassAlias(TPdfGothicBold, 'Gothic,Bold');
  RegisterClassAlias(TPdfGothicItalic, 'Gothic,Italic');
  RegisterClassAlias(TPdfGothicBoldItalic, 'Gothic,BoldItalic');
  RegisterClassAlias(TPdfMincyo, 'Mincyo');
  RegisterClassAlias(TPdfMincyoBold, 'Mincyo,Bold');
  RegisterClassAlias(TPdfMincyoItalic, 'Mincyo,Italic');
  RegisterClassAlias(TPdfMincyoBoldItalic, 'Mincyo,BoldItalic');
  RegisterClassAlias(TPdfPGothic, 'PGothic');
  RegisterClassAlias(TPdfPGothicBold, 'PGothic,Bold');
  RegisterClassAlias(TPdfPGothicItalic, 'PGothic,Italic');
  RegisterClassAlias(TPdfPGothicBoldItalic, 'PGothic,BoldItalic');
  RegisterClassAlias(TPdfPMincyo, 'PMincyo');
  RegisterClassAlias(TPdfPMincyoBold, 'PMincyo,Bold');
  RegisterClassAlias(TPdfPMincyoItalic, 'PMincyo,Italic');
  RegisterClassAlias(TPdfPMincyoBoldItalic, 'PMincyo,BoldItalic');

finalization

  UnRegisterClass(TPdfGothic);
  UnRegisterClass(TPdfGothicBold);
  UnRegisterClass(TPdfGothicItalic);
  UnRegisterClass(TPdfGothicBoldItalic);
  UnRegisterClass(TPdfMincyo);
  UnRegisterClass(TPdfMincyoBold);
  UnRegisterClass(TPdfMincyoItalic);
  UnRegisterClass(TPdfMincyoBoldItalic);
  UnRegisterClass(TPdfPGothic);
  UnRegisterClass(TPdfPGothicBold);
  UnRegisterClass(TPdfPGothicItalic);
  UnRegisterClass(TPdfPGothicBoldItalic);
  UnRegisterClass(TPdfPMincyo);
  UnRegisterClass(TPdfPMincyoBold);
  UnRegisterClass(TPdfPMincyoItalic);
  UnRegisterClass(TPdfPMincyoBoldItalic);

end.
