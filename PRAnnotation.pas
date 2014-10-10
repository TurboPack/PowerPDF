{*
 * << P o w e r P d f >> -- PRAnnotation.pas
 *
 * Copyright (c) 1999-2001 Takezou. <takeshi_kanno@est.hi-ho.ne.jp>
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
 * 2001.07.07 Create
 * 2001.08.12 Changed the implementation of annotation.
 *
 *}
unit PRAnnotation;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PReport, PdfDoc, PdfFonts, PdfTypes;

type
  TPRAnnotation = class(TPRItem)
  private
    FLines: TStrings;
    FOpened: boolean;
    procedure SetLines(Value: TStrings);
    procedure SetText(Value: string);
    function GetText: string;
    function GetLines: TStrings;
  protected
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure Paint; override;
    procedure Print(ACanvas: TPRCanvas; ARect: TRect); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Text: string read GetText write SetText;
  published
    property Caption;
    property Lines: TStrings read GetLines write SetLines;
    property Opened: boolean read FOpened write FOpened;
  end;

implementation

{ TPRAnnotation }

// SetLines
procedure TPRAnnotation.SetLines(Value: TStrings);
begin
  FLines.Assign(Value);
  Invalidate;
end;

// GetLines
function TPRAnnotation.GetLines: TStrings;
begin
  result := FLines;
end;

// SetText
procedure TPRAnnotation.SetText(Value: string);
begin
  FLines.Text := Value;
end;

// GetText
function TPRAnnotation.GetText: string;
begin
  result := Trim(FLines.Text);
end;

// Create
constructor TPRAnnotation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLines := TStringList.Create;
end;

// Destroy
destructor TPRAnnotation.Destroy;
begin
  FLines.Free;
  inherited;
end;

// CMTextChanged
procedure TPRAnnotation.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TPRAnnotation.Paint;
var
  W: Integer;
  tmpRect: TRect;
const
  PDF_ANNOT_TITLE_HEIGHT = 15;
begin
  with Canvas do
  begin
    tmpRect := GetClientRect;
    tmpRect.Top := PDF_ANNOT_TITLE_HEIGHT;
    InflateRect(tmpRect, -5, -1);
    tmpRect.Right := tmpRect.Right - 24;
    Brush.Color := clWindow;
    Font.Size := 10;
    Font.Style := [];
    Rectangle(0, PDF_ANNOT_TITLE_HEIGHT, Width, Height);
    DrawText(Handle, PChar(Text), -1, TmpRect, DT_WORDBREAK);

    Brush.Color := clYellow;
    Rectangle(0, 0, Width, PDF_ANNOT_TITLE_HEIGHT + 1);
    Font.Size := 8;
    Font.Style := [fsBold];
    W := TextWidth(Caption);
    TextOut((Width - W) div 2, 4, Caption);
  end;
end;

procedure TPRAnnotation.Print(ACanvas: TPRCanvas; ARect: TRect);
var
  FAnnotation: TPdfDictionary;
  S: string;
  APos: integer;
  NewRect: TRect;
begin
  // omitting LF charactors from CRLF sequence.
  S := Text;
  APos := pos(#13#10, S);
  while APos > 0 do
  begin
    S := Copy(S, 1, APos) + Copy(S, APos+2, Length(S) - APos-2);
    APos := pos(#13#10, S);
  end;

  // creating annotation object and setting properties.
  with NewRect do
  begin
    Top := Page.ClientHeight - ARect.Bottom;
    Bottom := Page.ClientHeight - ARect.Top;
    Left := ARect.Left;
    Right := ARect.Right;
  end;
  with NewRect do
    FAnnotation := ACanvas.PdfCanvas.Doc.CreateAnnotation(asTextNotes,
                                            _PdfRect(Left, Top, Right, Bottom));
  FAnnotation.AddItem('Contents', TPdfText.CreateText(S));
  FAnnotation.AddItem('S', TPdfText.CreateText(Caption));
  if Opened then
    FAnnotation.AddItem('Open', TPdfBoolean.CreateBoolean(true));
end;

end.
