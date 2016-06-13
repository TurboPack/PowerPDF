{*
 * << P o w e r P d f >> -- PdfDoc.pas
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
 * 2000.09.10 create.
 * 2001.06.30 move FloatToStrR method to PdfTypes.pas.
 * 2001.07.01 implemented text annotation.
 * 2001.07.10 move TPDF_STR_TBL and TPDF_INT_TBL defination to top (for BCB).
 * 2001.07.21 changed TPdfDictionaryWrapper's properties(Data and HasData) to
 *            public.
 * 2001.07.28 fixed bug of TPdfCanvas.SetPage.
 * 2001.08.01 added TPdfCatalog.PageLayout
 * 2001.08.09 moved some constans from PdfTypes.pas.
 * 2001.08.12 changed the implementation of outlines.
 * 2001.08.12 changed the implementation of annotation.
 * 2001.08.18 added GetNextWord routine.
 * 2001.08.18 changed the parameter of MoveToTextPoint routine.
 * 2001.08.20 added Text utility routines.
 * 2001.08.20 added Leading property to TPdfCanvasAttribute.
 * 2001.08.22 change the method name MesureText to MeasureText(Spelling mistake :-)
 * 2001.08.26 changed some definations and methods to work with kylix.
 * 2001.09.01 changed the implementation of the image.
 * 2001.09.08 added OpenAction function.
 *            change AddAnnotation method to CreateAnnotation.
 * 2001.09.13 added ViewerPreference functions.
 *}
unit PdfDoc;

interface

// if use "FlateDecode" compression, comment out the next line.
// (this unit and PdfTypes.pas)
{$DEFINE NOZLIB}

uses
  SysUtils, Classes, PdfTypes, Windows;

const
  POWER_PDF_VERSION_TEXT = 'PowerPdf version 0.9';

  {*
   * PreDefined page size
   *}
  PDF_PAGE_WIDTH_A4 = 596;
  PDF_PAGE_HEIGHT_A4 = 842;

  {*
   * Dafault page size.
   *}
  PDF_DEFAULT_PAGE_WIDTH = PDF_PAGE_WIDTH_A4;
  PDF_DEFAULT_PAGE_HEIGHT = PDF_PAGE_HEIGHT_A4;

  {*
   * collection of flags defining various characteristics of the font.
   *}
  PDF_FONT_FIXED_WIDTH = 1;
  PDF_FONT_SERIF       = 2;
  PDF_FONT_SYMBOLIC    = 4;
  PDF_FONT_SCRIPT      = 8;
  // Reserved          = 16
  PDF_FONT_STD_CHARSET = 32;
  PDF_FONT_ITALIC      = 64;
  // Reserved          = 128
  // Reserved          = 256
  // Reserved          = 512
  // Reserved          = 1024
  // Reserved          = 2048
  // Reserved          = 4096
  // Reserved          = 8192
  // Reserved          = 16384
  // Reserved          = 32768
  PDF_FONT_ALL_CAP     = 65536;
  PDF_FONT_SMALL_CAP   = 131072;
  PDF_FONT_FOURCE_BOLD = 262144;

  PDF_DEFAULT_FONT = 'Arial';
  PDF_DEFAULT_FONT_SIZE = 10;

  PDF_MIN_HORIZONTALSCALING = 10;
  PDF_MAX_HORIZONTALSCALING = 300;
  PDF_MAX_WORDSPACE = 300;
  PDF_MIN_CHARSPACE = -30;
  PDF_MAX_CHARSPACE = 300;
  PDF_MAX_FONTSIZE = 300;
  PDF_MAX_ZOOMSIZE = 10;
  PDF_MAX_LEADING = 300;

  PDF_PAGE_LAYOUT_NAMES: array[0..3] of string = ('SinglePage',
                                                  'OneColumn',
                                                  'TwoColumnLeft',
                                                  'TwoColumnRight');

  PDF_PAGE_MODE_NAMES: array[0..3] of string = ('UseNone',
                                                'UseOutlines',
                                                'UseThumbs',
                                                'FullScreen');

  PDF_ANNOTATION_TYPE_NAMES: array[0..12] of string = ('Text',
                                                      'Link',
                                                      'Sound',
                                                      'FreeText',
                                                      'Stamp',
                                                      'Square',
                                                      'Circle',
                                                      'StrikeOut',
                                                      'Highlight',
                                                      'Underline',
                                                      'Ink',
                                                      'FileAttachment',
                                                      'Popup');

  PDF_DESTINATION_TYPE_NAMES: array[0..7] of string = ('XYZ',
                                                       'Fit',
                                                       'FitH',
                                                       'FitV',
                                                       'FitR',
                                                       'FitB',
                                                       'FitBH',
                                                       'FitBV');

type
  {*
   * The pagemode determines how the document should appear when opened.
   *}
  TPdfPageMode = (pmUseNone,
                  pmUseOutlines,
                  pmUseThumbs,
                  pmFullScreen);

  {*
   * The line cap style specifies the shape to be used at the ends of open
   * subpaths when they are stroked.
   *}
  TLineCapStyle = (lcButt_End,
                   lcRound_End,
                   lcProjectingSquareEnd);

  {*
   * The line join style specifies the shape to be used at the corners of paths
   * that are stroked.
   *}
  TLineJoinStyle = (ljMiterJoin,
                    ljRoundJoin,
                    ljBevelJoin);

  {*
   * The text rendering mode determines whether text is stroked, filled, or used
   * as a clipping path.
   *}
  TTextRenderingMode = (trFill,
                        trStroke,
                        trFillThenStroke,
                        trInvisible,
                        trFillClipping,
                        trStrokeClipping,
                        trFillStrokeClipping,
                        trClipping);

  {*
   * The annotation types determines the valid annotation subtype of TPdfDoc.
   *}
  TPdfAnnotationSubType = (asTextNotes,
                           asLink);

  {*
   * The TPdfDestinationType determines default user space coordinate system of
   * Explicit destinations.
   *}
  TPdfDestinationType = (dtXYZ,
                        dtFit,
                        dtFitH,
                        dtFitV,
                        dtFitR,
                        dtFitB,
                        dtFitBH,
                        dtFitBV);

  {*
   * TPdfPageLayout specifying the page layout to be used when the document is
   * opened:
   *}
  TPdfPageLayout = (plSinglePage,
                    plOneColumn,
                    plTwoColumnLeft,
                    plTwoColumnRight);


  TPdfViewerPreference = (vpHideToolbar,
                          vpHideMenubar,
                          vpHideWindowUI,
                          vpFitWindow,
                          vpCenterWindow);
  TPdfViewerPreferences = set of TPdfViewerPreference;

  {$IFDEF NOZLIB}
  TPdfCompressionMethod = (cmNone);
  {$ELSE}
  TPdfCompressionMethod = (cmNone, cmFlateDecode);
  {$ENDIF}

  TPdfColor = -$7FFFFFFF-1..$7FFFFFFF;
  TXObjectID = integer;

  TPDF_STR_TBL = record
    KEY: string;
    VAL: string;
  end;
  TPDF_INT_TBL = record
    KEY: string;
    VAL: integer;
  end;

  TPdfHeader = class(TObject)
  protected
    procedure WriteToStream(const AStream: TStream);
  end;

  TPdfTrailer = class(TObject)
  private
    FAttributes: TPdfDictionary;
    FXrefAddress: integer;
  protected
    procedure WriteToStream(const AStream: TStream);
  public
    constructor Create(AObjectMgr: TPdfObjectMgr);
    destructor Destroy; override;
    property XrefAddress: integer read FXrefAddress write FXrefAddress;
    property Attributes: TPdfDictionary read FAttributes;
  end;

  TPdfXrefEntry = class(TObject)
  private
    FEntryType: string;
    FByteOffset: integer;
    FGenerationNumber: integer;
    FValue: TPdfObject;
    function GetAsString: string;
  public
    constructor Create(AValue: TPdfObject);
    destructor Destroy; override;
    property EntryType: string read FEntryType write FEntryType;
    property ByteOffset: integer read FByteOffSet write FByteOffset;
    property GenerationNumber: integer
                          read FGenerationNumber write FGenerationNumber;
    property AsString: string read GetAsString;
    property Value: TPdfObject read FValue;
  end;

  TPdfXref = class(TPdfObjectMgr)
  private
    FXrefEntries: TList;
    function GetItem(ObjectID: integer): TPdfXrefEntry;
    function GetItemCount: integer;
  protected
    procedure WriteToStream(const AStream: TStream);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddObject(AObject: TPdfObject); override;
    function GetObject(ObjectID: integer): TPdfObject; override;
    property Items[ObjectID: integer]: TPdfXrefEntry read GetItem;
    property ItemCount: integer read GetItemCount;
  end;

  TPdfCanvas = class;
  TPdfInfo = class;
  TPdfCatalog = class;
  TPdfFont = class;
  TPdfDestination = class;
//  TPdfLink = class;
  TPdfOutlineEntry = class;
  TPdfOutlineRoot = class;
  TAbstractPReport = class(TComponent);

  TPdfDoc = class(TObject)
  private
    FRoot: TPdfCatalog;
    FCurrentPages: TPdfDictionary;
    FCanvas: TPdfCanvas;
    FHeader: TPdfHeader;
    FTrailer: TPdfTrailer;
    FXref: TPdfXref;
    FInfo: TPdfInfo;
    FHasDoc: boolean;
    FFontList: TList;
    FObjectList: TList;
    FOutlineRoot: TPdfOutlineRoot;
    FXObjectList: TPdfArray;
    FDefaultPageWidth: Word;
    FDefaultPageHeight: Word;
    FCompressionMethod: TPdfCompressionMethod;
    FUseOutlines: boolean;
    function GetCanvas: TPdfCanvas;
    function GetInfo: TPdfInfo;
    function GetRoot: TPdfCatalog;
    function GetOutlineRoot: TPdfOutlineRoot;
  protected
    procedure CreateInfo;
    procedure CreateOutlines;
    function CreateCatalog: TPdfDictionary;
    function CreateFont(FontName: string): TPdfFont;
    function CreatePages(Parent: TPdfDictionary): TPdfDictionary;
  public
    procedure RegisterXObject(AObject: TPdfXObject; AName: string);
    constructor Create;
    destructor Destroy; override;
    procedure NewDoc;
    procedure FreeDoc;
    procedure AddPage;
    procedure AddXObject(AName: string; AXObject: TPdfXObject);
    procedure SaveToStream(AStream: TStream);
    procedure SetVirtualMode;
    function GetFont(FontName: string): TPdfFont;
    function GetXObject(AName: string): TPdfXObject;
    function CreateAnnotation(AType: TPdfAnnotationSubType; ARect: TPdfRect): TPdfDictionary;
    function CreateDestination: TPdfDestination;
    property HasDoc: boolean read FHasDoc;
    property Canvas: TPdfCanvas read GetCanvas;
    property Info: TPdfInfo read GetInfo;
    property Root: TPdfCatalog read GetRoot;
    property OutlineRoot: TPdfOutlineRoot read GetOutlineRoot;
    property DefaultPageWidth: word read FDefaultPageWidth write FDefaultPageWidth;
    property DefaultPageHeight: word read FDefaultPageHeight write FDefaultPageHeight;
    property CompressionMethod: TPdfCompressionMethod
       read FCompressionMethod write FCompressionMethod;
    property UseOutlines: boolean read FUseoutlines write FUseoutlines;
  end;

  TPdfCanvasAttribute = class(TObject)
  private
    FWordSpace: Single;
    FCharSpace: Single;
    FFontSize: Single;
    FFont: TPdfFont;
    FLeading: Single;
    FHorizontalScaling: Word;
    procedure SetWordSpace(Value: Single);
    procedure SetCharSpace(Value: Single);
    procedure SetFontSize(Value: Single);
    procedure SetHorizontalScaling(Value: Word);
    procedure SetLeading(Value: Single);
  public
    function TextWidth(Text: string): Single;
    function MeasureText(Text: string; Width: Single): integer;
    property WordSpace: Single read FWordSpace write SetWordSpace;
    property CharSpace: Single read FCharSpace write SetCharSpace;
    property HorizontalScaling: Word read FHorizontalScaling
      write SetHorizontalScaling;
    property Leading: Single read FLeading write SetLeading;
    property FontSize: Single read FFontSize write SetFontSize;
    property Font: TPdfFont read FFont write FFont;
  end;

  TPdfCanvas = class(TObject)
  private
    FContents: TPdfStream;
    FPage: TPdfDictionary;
    FPdfDoc: TPdfDoc;
    FAttr: TPdfCanvasAttribute;
    FIsVirtual: boolean;
    procedure SetPageWidth(AValue: integer);
    procedure SetPageHeight(AValue: integer);
    procedure WriteString(S: string);
    function GetDoc: TPdfDoc;
    function GetPage: TPdfDictionary;
    function GetPageWidth: Integer;
    function GetPageHeight: Integer;
    function GetColorStr(Color: TPdfColor): string;
  protected
  public
    constructor Create(APdfDoc: TPdfDoc);
    destructor Destroy; override;

    {* Special Graphics State *}
    procedure GSave;                                             {  q   }
    procedure GRestore;                                          {  Q   }
    procedure Concat(a, b, c, d, e, f: Single);                  {  cm  }

    {* General Graphics State *}
    procedure SetFlat(flatness: Byte);                           {  i   }
    procedure SetLineCap(linecap: TLineCapStyle);                {  J   }
    procedure SetDash(aarray: array of Byte; phase: Byte);       {  d   }
    procedure SetLineJoin(linejoin: TLineJoinStyle);             {  j   }
    procedure SetLineWidth(linewidth: Single);                   {  w   }
    procedure SetMiterLimit(miterlimit: Byte);                   {  M   }

    {* Paths *}
    procedure MoveTo(x, y: Single);                              {  m   }
    procedure LineTo(x, y: Single);                              {  l   }
    procedure CurveToC(x1, y1, x2, y2, x3, y3: Single);          {  c   }
    procedure CurveToV(x2, y2, x3, y3: Single);                  {  v   }
    procedure CurveToY(x1, y1, x3, y3: Single);                  {  y   }
    procedure Rectangle(x, y, width, height: Single);            {  re  }
    procedure Closepath;                                         {  h   }
    procedure NewPath;                                           {  n   }
    procedure Stroke;                                            {  S   }
    procedure ClosePathStroke;                                   {  s   }
    procedure Fill;                                              {  f   }
    procedure Eofill;                                            {  f*  }
    procedure FillStroke;                                        {  B   }
    procedure ClosepathFillStroke;                               {  b   }
    procedure EofillStroke;                                      {  B*  }
    procedure ClosepathEofillStroke;                             {  b*  }
    procedure Clip;                                              {  W   }
    procedure Eoclip;                                            {  W*  }

    {* Test state *}
    procedure SetCharSpace(charSpace: Single);                   {  Tc  }
    procedure SetWordSpace(wordSpace: Single);                   {  Tw  }
    procedure SetHorizontalScaling(hScaling: Word);              {  Tz  }
    procedure SetLeading(leading: Single);                       {  TL  }
    procedure SetFontAndSize(fontname: string; size: Single);    {  Tf  }
    procedure SetTextRenderingMode(mode: TTextRenderingMode);    {  Tr  }
    procedure SetTextRise(rise: Word);                           {  Ts  }
    procedure BeginText;                                         {  BT  }
    procedure EndText;                                           {  ET  }
    procedure MoveTextPoint(tx, ty: Single);                     {  Td  }
    procedure SetTextMatrix(a, b, c, d, x, y: Word);             {  Tm  }
    procedure MoveToNextLine;                                    {  T*  }
    procedure ShowText(s: string);                               {  Tj  }
    procedure ShowTextNextLine(s: string);                       {  '   }

    {* external objects *}
    procedure ExecuteXObject(xObject: string);                   {  Do  }

    {* Device-dependent color space operators *}
    procedure SetRGBFillColor(Value: TPdfColor);                 {  rg  }
    procedure SetRGBStrokeColor(Value: TPdfColor);               {  RG  }

    {* utility routines *}
    procedure SetPage(APage: TPdfDictionary);
    procedure SetFont(AName: string; ASize: Single);
    procedure TextOut(X, Y: Single; Text: string);
    procedure TextRect(ARect: TPdfRect; Text: string;
        Alignment: TPdfAlignment; Clipping: boolean);
    procedure MultilineTextRect(ARect: TPdfRect;
        Text: string; WordWrap: boolean);
    procedure DrawXObject(X, Y, AWidth, AHeight: Single;
        AXObjectName: string);
    procedure DrawXObjectEx(X, Y, AWidth, AHeight: Single;
        ClipX, ClipY, ClipWidth, ClipHeight: Single; AXObjectName: string);
    procedure Ellipse(x, y, width, height: Single);
    function TextWidth(Text: string): Single;
    function MeasureText(Text: string; AWidth: Single): integer;
    function GetNextWord(const S: string; var Index: integer): string;

    property Attribute: TPdfCanvasAttribute read FAttr;
    property Contents: TPdfStream read FContents;
    property Page: TPdfDictionary read GetPage;
    property Doc: TPdfDoc read GetDoc;
    property PageWidth: integer read GetPageWidth write SetPageWidth;
    property PageHeight: integer read GetPageHeight write SetPageHeight;
  end;

  TPdfDictionaryWrapper = class(TPersistent)
  private
    FData: TPdfDictionary;
    function GetHasData: boolean;
  protected
    procedure SetData(AData: TPdfDictionary); virtual;
  public
    property Data: TPdfDictionary read FData write SetData;
    property HasData: boolean read GetHasData;
  end;

  TPdfInfo = class(TPdfDictionaryWrapper)
  private
    function GetAuthor: string;
    procedure SetAuthor(Value: string);
    function GetCreationDate: TDateTime;
    procedure SetCreationDate(Value: TDateTime);
    function GetCreator: string;
    procedure SetCreator(Value: string);
    function GetKeywords: string;
    procedure SetKeywords(Value: string);
    function GetSubject: string;
    procedure SetSubject(Value: string);
    function GetTitle: string;
    procedure SetTitle(Value: string);
    function GetModDate: TDateTime;
    procedure SetModDate(Value: TDateTime);
  public
    property Author: string read GetAuthor write SetAuthor;
    property CreationDate: TDateTime read GetCreationDate write SetCreationDate;
    property Creator: string read GetCreator write SetCreator;
    property Keywords: string read GetKeywords write SetKeywords;
    property ModDate: TDateTime read GetModDate write SetModDate;
    property Subject: string read GetSubject write SetSubject;
    property Title: string read GetTitle write SetTitle;
  end;

  TPdfCatalog = class(TPdfDictionaryWrapper)
  private
    FOpenAction: TPdfDestination;
    procedure SetPageLayout(Value: TPdfPageLayout);
    procedure SetPageMode(Value: TPdfPageMode);
    procedure SetNonFullScreenPageMode(Value: TPdfPageMode);
    procedure SetViewerPreference(Value: TPdfViewerPreferences);
    procedure SetPages(APage: TPdfDictionary);
    function GetPageLayout: TPdfPageLayout;
    function GetPageMode: TPdfPageMode;
    function GetNonFullScreenPageMode: TPdfPageMode;
    function GetViewerPreference: TPdfViewerPreferences;
    function GetPages: TPdfDictionary;
  protected
    procedure SaveOpenAction;
  public
    property OpenAction: TPdfDestination read FOpenAction write FOpenAction;
    property PageLayout: TPdfPageLayout read GetPageLayout write SetPageLayout;
    property NonFullScreenPageMode: TPdfPageMode
                  read GetNonFullScreenPageMode write SetNonFullScreenPageMode;
    property PageMode: TPdfPageMode read GetPageMode write SetPageMode;
    property ViewerPreference: TPdfViewerPreferences
                         read GetViewerPreference write SetViewerPreference;
    property Pages: TPdfDictionary read GetPages write SetPages;
  end;

  TPdfFont = class(TPdfDictionaryWrapper)
  private
    FName: string;
  protected
    procedure AddStrElements(ADic: TPdfDictionary; ATable: array of TPDF_STR_TBL);
    procedure AddIntElements(ADic: TPdfDictionary; ATable: array of TPDF_INT_TBL);
  public
    constructor Create(AXref: TPdfXref; AName: string); virtual;
    function GetCharWidth(AText: string; APos: integer): integer; virtual;
    property Name: string read FName;
  end;

  TPdfDestination = class(TObject)
  private
    FDoc: TPdfDoc;
    FPage: TPdfDictionary;
    FType: TPdfDestinationType;
    FValues: array[0..3] of Integer;
    FZoom: Single;
    FReference: TObject;
    procedure SetElement(Index: integer; Value: Integer);
    procedure SetZoom(Value: Single);
    function GetElement(Index: integer): Integer;
    function GetPageWidth: Integer;
    function GetPageHeight: Integer;
  public
    constructor Create(APdfDoc: TPdfDoc);
    destructor Destroy; override;
    function GetValue: TPdfArray;
    property DestinationType: TPdfDestinationType read FType write FType;
    property Doc: TPdfDoc read FDoc;
    property Left: Integer index 0 read GetElement write SetElement;
    property Top: Integer index 1 read GetElement write SetElement;
    property Right: Integer index 2 read GetElement write SetElement;
    property Bottom: Integer index 3 read GetElement write SetElement;
    property PageHeight: Integer read GetPageHeight;
    property PageWidth: Integer read GetPageWidth;
    property Zoom: Single read FZoom write SetZoom;
    property Reference: TObject read FReference write FReference;
  end;

  TPdfOutlineEntry = class(TPdfDictionaryWrapper)
  private
    FParent: TPdfOutlineEntry;
    FNext: TPdfOutlineEntry;
    FPrev: TPdfOutlineEntry;
    FFirst: TPdfOutlineEntry;
    FLast: TPdfOutlineEntry;
    FDest: TPdfDestination;
    FDoc: TPdfDoc;
    FTitle: string;
    FOpened: boolean;
    FCount: integer;
    FReference: TObject;
  protected
    constructor CreateEntry(AParent: TPdfOutlineEntry); virtual;
    procedure Save; virtual;
  public
    destructor Destroy; override;
    function AddChild: TPdfOutlineEntry;
    property Doc: TPdfDoc read FDoc;
    property Parent: TPdfOutlineEntry read FParent;
    property Next: TPdfOutlineEntry read FNext;
    property Prev: TPdfOutlineEntry read FPrev;
    property First: TPdfOutlineEntry read FFirst;
    property Last: TPdfOutlineEntry read FLast;
    property Dest: TPdfDestination read FDest write FDest;
    property Title: string read FTitle write FTitle;
    property Opened: boolean read FOpened write FOpened;
    property Reference: TObject read FReference write FReference;
  end;

  TPdfOutlineRoot = class(TPdfOutlineEntry)
  protected
    constructor CreateRoot(ADoc: TPdfDoc); virtual;
  public
    procedure Save; override;
  end;

implementation

{ Utility functions }

// _Pages_AddKids
procedure _Pages_AddKids(AParent: TPdfDictionary; AKid: TPdfDictionary);
var
  FKids: TPdfArray;
begin
  // adding page object to the parent pages object.
  FKids := AParent.PdfArrayByName('Kids');
  FKids.AddItem(AKid);
  AParent.PdfNumberByName('Count').Value := FKids.ItemCount;
end;

// _Page_GetResources
function _Page_GetResources(APage: TPdfDictionary; AName: string): TPdfDictionary;
var
  FResources: TPdfDictionary;
begin
  FResources := APage.PdfDictionaryByName('Resources');
  Result := FResources.PdfDictionaryByName(AName);
end;

{ TPdfHeader }

// WriteToStream
procedure TPdfHeader.WriteToStream(const AStream: TStream);
begin
  _WriteString('%PDF-1.2 '#13#10, AStream);
end;

{ TPdfTrailer }

// WriteToStream
procedure TPdfTrailer.WriteToStream(const AStream: TStream);
begin
  _WriteString('trailer' + CRLF, AStream);
  FAttributes.WriteToStream(AStream);
  _WriteString(CRLF + 'startxref' + CRLF, AStream);
  _WriteString(IntToStr(FXrefAddress) + CRLF, AStream);
  _WriteString('%%EOF' + CRLF, AStream);
end;

// Create
constructor TPdfTrailer.Create(AObjectMgr: TPdfObjectMgr);
begin
  inherited Create;
  FAttributes := TPdfDictionary.CreateDictionary(AObjectMgr);
  FAttributes.AddItem('Size', TPdfNumber.CreateNumber(0));
end;

// Destroy
destructor TPdfTrailer.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

{ TPdfXrefEntry }

// Create
constructor TPdfXrefEntry.Create(AValue: TPdfObject);
begin
  FByteOffset := -1;
  if AValue <> nil then
  begin
    FEntryType := PDF_IN_USE_ENTRY;
    FGenerationNumber := AValue.GenerationNumber;
    FValue := AValue;
  end
  else
  begin
    FEntryType := PDF_FREE_ENTRY;
    FGenerationNumber := 0;
  end;
end;

// Destroy
destructor TPdfXrefEntry.Destroy;
begin
  if FEntryType = PDF_IN_USE_ENTRY then
    FValue.Free;
  inherited;
end;

// GetAsString
function TPdfXrefEntry.GetAsString: string;
  function FormatIntToString(Value: integer; Len: integer): string;
  var
    S: string;
    i, j: integer;
  begin
    Result := '';
    if Value < 0 then
      S := '0'
    else
      S := IntToStr(Value);
    i := Len - Length(S);
    for j := 0 to i - 1 do
      Result := Result + '0';
    Result := Result + S;
  end;
begin
  Result := FormatIntToString(FByteOffset, 10) +
            ' ' +
            FormatIntToString(FGenerationNumber, 5) +
            ' ' +
            FEntryType;
end;

{ TPdfXref }

// Create
constructor TPdfXref.Create;
var
  RootEntry: TPdfXrefEntry;
begin
  FXrefEntries := TList.Create;
  RootEntry := TPdfXrefEntry.Create(nil);
  RootEntry.GenerationNumber := PDF_MAX_GENERATION_NUM;
  FXrefEntries.Add(RootEntry);
end;

// Destroy
destructor TPdfXref.Destroy;
var
  i: integer;
begin
  for i := 0 to FXrefEntries.Count - 1 do
    GetItem(i).Free;
  FXrefEntries.Free;
  inherited;
end;

// AddObject
procedure TPdfXref.AddObject(AObject: TPdfObject);
var
  ObjectNumber: integer;
  XrefEntry: TPdfXrefEntry;
begin
  // register object to xref table, and set objectnumber.
  if AObject.ObjectType <> otDirectObject then
    raise EPdfInvalidOperation.Create('AddObject --wrong object type.');
  XrefEntry := TPdfXrefEntry.Create(AObject);
  ObjectNumber := FXrefEntries.Add(XrefEntry);
  AObject.SetObjectNumber(ObjectNumber);
end;

// GetItem
function TPdfXref.GetItem(ObjectID: integer): TPdfXrefEntry;
begin
  Result := TPdfXrefEntry(FXrefEntries.Items[ObjectID]);
end;

// GetItemCount
function TPdfXref.GetItemCount: integer;
begin
  Result := FXrefEntries.Count;
end;

// GetObject
function TPdfXref.GetObject(ObjectID: integer): TPdfObject;
begin
  Result := GetItem(ObjectID).Value;
end;

// WriteToStream
procedure TPdfXref.WriteToStream(const AStream: TStream);
var
  i: integer;
  S: string;
  Count: integer;
begin
  Count := FXrefEntries.Count;
  S := 'xref' +
       CRLF +
       '0 ' +
       IntToStr(Count) +
       CRLF;
  for i := 0 to Count - 1 do
    S := S + Items[i].AsString + CRLF;
  _WriteString(S, AStream);
end;

{ TPdfDoc }

// Create
constructor TPdfDoc.Create;
begin
  inherited Create;
  FHasDoc := false;
  FCanvas := TPdfCanvas.Create(Self);
  FDefaultPageWidth := PDF_DEFAULT_PAGE_WIDTH;
  FDefaultPageHeight := PDF_DEFAULT_PAGE_HEIGHT;
  FInfo := nil;
  FRoot := nil;
end;

// GetCanvas
function TPdfDoc.GetCanvas: TPdfCanvas;
begin
  if not HasDoc then
    raise EPdfInvalidOperation.Create('GetCanvas --Document is null');
  Result := FCanvas;
end;

// GetInfo
function TPdfDoc.GetInfo: TPdfInfo;
begin
  if not HasDoc then
    raise EPdfInvalidOperation.Create('GetInfo --this method can not use this state..');
  if FInfo = nil then
    CreateInfo;
  Result := FInfo;
end;

// GetRoot
function TPdfDoc.GetRoot: TPdfCatalog;
begin
  if not HasDoc then
    raise EPdfInvalidOperation.Create('GetRoot --this method can not use this state..');
  Result := FRoot;
end;

// GetOutlineRoot
function TPdfDoc.GetOutlineRoot: TPdfOutlineRoot;
begin
  if not HasDoc then
    raise EPdfInvalidOperation.Create('GetOutlineRoot --document is null..');
  if not UseOutlines then
    raise EPdfInvalidOperation.Create('GetOutlineRoot --not use outline mode..');
  Result := FOutlineRoot;
end;

// Destroy
destructor TPdfDoc.Destroy;
begin
  FreeDoc;
  FCanvas.Free;
  inherited;
end;

// CreateCatalog
function TPdfDoc.CreateCatalog: TPdfDictionary;
begin
  // create catalog object and register to xref.
  Result := TPdfDictionary.CreateDictionary(FXref);
  FXref.AddObject(Result);
  Result.AddItem('Type', TPdfName.CreateName('Catalog'));
  FTrailer.Attributes.AddItem('Root', Result);
end;

// CreateFont
function TPdfDoc.CreateFont(FontName: string): TPdfFont;
var
  PdfFont: TPdfFont;
begin
  // create new font (not regist to xref -- because font object registed by
  // TPdfFont).
  PdfFont := TPdfFont(FindClass(FontName).Create);
  if PdfFont = nil then
    raise Exception.Create('CreateFont --InvalidFontName:' + FontName);
  Result := PdfFont.Create(FXref, FontName);
  Result.Data.AddItem('Name',
    TPdfName.CreateName('F' + IntToStr(FFontList.Count)));
  FFontList.Add(Result);
end;

// RegisterXObject
procedure TPdfDoc.RegisterXObject(AObject: TPdfXObject; AName: string);
begin
   // check object and register it.
   if AObject = nil then
     raise EPdfInvalidValue.Create('RegisterXObject --AObject is null');
   if _GetTypeOf(AObject.Attributes) <> 'XObject' then
     raise EPdfInvalidValue.Create('RegisterXObject --not XObject');
   if AObject.ObjectType <> otIndirectObject then
     FXref.AddObject(AObject);
   if AObject.Attributes.ValueByName('Name') = nil then
   begin
     if GetXObject(AName) <> nil then
       raise EPdfInvalidValue.Createfmt('RegisterXObject --dupulicate name: %s', [AName]);
     FXObjectList.AddItem(AObject);
     AObject.Attributes.AddItem('Name', TPdfName.CreateName(AName));
   end;
end;

// CreateInfo
procedure TPdfDoc.CreateInfo;
var
  FInfoDictionary: TPdfDictionary;
begin
  FInfoDictionary := TPdfDictionary.CreateDictionary(FXref);
  FXref.AddObject(FInfoDictionary);
  FInfoDictionary.AddItem('Producer', TPdfText.CreateText(POWER_PDF_VERSION_TEXT));
  FTrailer.Attributes.AddItem('Info', FInfoDictionary);
  FInfo := TPdfInfo.Create;
  FInfo.SetData(FInfoDictionary);
  FObjectList.Add(FInfo);
end;

// CreatePages
function TPdfDoc.CreatePages(Parent: TPdfDictionary): TPdfDictionary;
begin
  // create pages object and register to xref.
  result := TPdfDictionary.CreateDictionary(FXref);
  FXref.AddObject(Result);
  with Result do
  begin
    AddItem('Type', TPdfName.CreateName('Pages'));
    AddItem('Kids', TPdfArray.CreateArray(FXref));
    AddItem('Count', TPdfNumber.CreateNumber(0));
  end;

  if (Parent <> nil) and (_GetTypeOf(Parent) = 'Pages') then
    _Pages_AddKids(Parent, Result)
  else
    FRoot.Pages := Result;
end;

// CreateOutlines
procedure TPdfDoc.CreateOutlines;
begin
  FOutlineRoot := TPdfOutlineRoot.CreateRoot(Self);
  FRoot.Data.AddItem('Outlines', FOutlineRoot.Data);
end;

// GetFont
function TPdfDoc.GetFont(FontName: string): TPdfFont;
var
  FFont: TPdfFont;
  i :integer;
begin
  if not HasDoc then
    raise EPdfInvalidOperation.Create('GetFont --document is null.');

  // if specified font exists in fontlist, return it. otherwise, create the font.
  Result := nil;
  for i := 0 to FFontList.Count - 1 do
  begin
    FFont := TPdfFont(FFontList.Items[i]);
    if FFont.Name = FontName then
    begin
      Result := FFont;
      Break;
    end;
  end;
  if Result = nil then
    Result := CreateFont(FontName);
end;

// GetXObject
function TPdfDoc.GetXObject(AName: string): TPdfXObject;
var
  FXObject: TPdfXObject;
  i :integer;
begin
  // return the XObject which name is muched with specified name.
  Result := nil;
  for i := 0 to FXObjectList.ItemCount - 1 do
  begin
    FXObject := TPdfXObject(FXObjectList.Items[i]);
    if TPdfName(FXObject.Attributes.ValueByName('Name')).Value = AName then
    begin
      Result := FXObject;
      Break;
    end;
  end;
end;

// CreateAnnotation
function TPdfDoc.CreateAnnotation(AType: TPdfAnnotationSubType; ARect: TPdfRect): TPdfDictionary;
var
  FAnnotation: TPdfDictionary;
  FArray: TPdfArray;
  FPage: TPdfDictionary;
begin
  if not HasDoc then
    raise EPdfInvalidOperation.Create('AddAnotation --document is null.');

  // create new annotation and set the properties.
  FAnnotation := TPdfDictionary.CreateDictionary(FXref);
  FXref.AddObject(FAnnotation);
  with FAnnotation do
  begin
    AddItem('Type', TPdfName.CreateName('Annot'));
    AddItem('Subtype', TPdfName.CreateName(PDF_ANNOTATION_TYPE_NAMES[ord(AType)]));
    FArray := TPdfArray.CreateArray(nil);
    with FArray, ARect do
    begin
      AddItem(TPdfReal.CreateReal(Left));
      AddItem(TPdfReal.CreateReal(Top));
      AddItem(TPdfReal.CreateReal(Right));
      AddItem(TPdfReal.CreateReal(Bottom));
    end;
    AddItem('Rect', FArray);
  end;

  // adding annotation to the current page
  FPage := FCanvas.Page;
  FArray := FPage.PdfArrayByName('Annots');
  if FArray = nil then
  begin
    FArray := TPdfArray.CreateArray(nil);
    FPage.AddItem('Annots', FArray);
  end;
  FArray.AddItem(FAnnotation);

  Result := FAnnotation;
end;

// CreateDestination
function TPdfDoc.CreateDestination: TPdfDestination;
begin
  Result := TPdfDestination.Create(Self);
  FObjectList.Add(Result);
end;

// NewDoc
procedure TPdfDoc.NewDoc;
begin
  {*
   * create new document.
   *}
  FreeDoc;
  FXref := TPdfXref.Create;
  FHeader := TPdfHeader.Create;
  FTrailer := TPdfTrailer.Create(FXref);
  FFontList := TList.Create;
  FXObjectList := TPdfArray.CreateArray(FXref);
  FObjectList := TList.Create;

  FRoot := TPdfCatalog.Create;
  FRoot.SetData(CreateCatalog);
  FObjectList.Add(FRoot);

  if UseOutlines then
    CreateOutlines;

  CreateInfo;
  FInfo.CreationDate := now;

  FCurrentPages := CreatePages(nil);
  FRoot.SetPages(FCurrentPages);

  FHasDoc := true;
end;

// AddXObject
procedure TPdfDoc.AddXObject(AName: string; AXObject: TPdfXObject);
begin
  if GetXObject(AName) <> nil then
    raise Exception.CreateFmt('AddImage --the image named %s is already exists..', [AName]);

  // check whether AImage is valid PdfImage or not.
  if (AXObject = nil) or (AXObject.Attributes = nil) or
    (_GetTypeOf(AXObject.Attributes) <> 'XObject') or
    (AXObject.Attributes.PdfNameByName('Subtype').Value <> 'Image') then
    raise Exception.Create('AddImage --the image is not valid TPdfImage..');

  FXref.AddObject(AXObject);
  RegisterXObject(AXObject, AName);
end;

// AddPage
procedure TPdfDoc.AddPage;
var
  FPage: TPdfDictionary;
  FMediaBox: TPdfArray;
  FContents: TPdfStream;
  FResources: TPdfDictionary;
  FProcSet: TPdfArray;
  FFontArray: TPdfDictionary;
  FXObjectArray: TPdfDictionary;
  {$IFNDEF NOZLIB}
  FFilter: TPdfArray;
  {$ENDIF}
begin
  if FCurrentPages = nil then
    raise EPdfInvalidOperation.Create('AddPage --current pages null.');

  // create new page object and add it to the current pages object.
  FPage := TPdfDictionary.CreateDictionary(FXref);
  FXref.AddObject(FPage);

  _Pages_AddKids(FCurrentPages, FPage);

  FPage.AddItem('Type', TPdfName.CreateName('Page'));
  FPage.AddItem('Parent', FCurrentPages);

  FMediaBox := TPdfArray.CreateArray(FXref);
  with FMediabox do
  begin
    AddItem(TPdfNumber.CreateNumber(0));
    AddItem(TPdfNumber.CreateNumber(0));
    AddItem(TPdfNumber.CreateNumber(DefaultPageWidth));
    AddItem(TPdfNumber.CreateNumber(DefaultPageHeight));
  end;
  FPage.AddItem('MediaBox', FMediaBox);

  FResources := TPdfDictionary.CreateDictionary(FXref);
  FPage.AddItem('Resources', FResources);

  FFontArray := TPdfDictionary.CreateDictionary(FXref);
  FResources.AddItem('Font', FFontArray);

  FXObjectArray := TPdfDictionary.CreateDictionary(FXref);
  FResources.AddItem('XObject', FXObjectArray);

  FProcSet := TPdfArray.CreateArray(FXref);
  with FProcSet do
  begin
    AddItem(TPdfName.CreateName('PDF'));
    AddItem(TPdfName.CreateName('Text'));
    AddItem(TPdfName.CreateName('ImageC'));
  end;
  FResources.AddItem('ProcSet', FProcSet);

  FContents := TPdfStream.CreateStream(FXref);
  FXref.AddObject(FContents);
  {$IFNDEF NOZLIB}
  FFilter := FContents.Attributes.PdfArrayByName('Filter');
  if FCompressionMethod = cmFlateDecode then
    FFilter.AddItem(TPdfName.CreateName('FlateDecode'));
  {$ENDIF}
  FPage.AddItem('Contents', FContents);

  FCanvas.SetPage(FPage);
end;

// FreeDoc
procedure TPdfDoc.FreeDoc;
var
  i: integer;
begin
  if FHasDoc then
  begin
    FXObjectList.Free;

    for i := FFontList.Count - 1 downto 0 do
      TObject(FFontList.Items[i]).Free;
    FFontList.Free;

    for i := FObjectList.Count - 1 downto 0 do
      TObject(FObjectList.Items[i]).Free;
    FObjectList.Free;

    FXref.Free;
    FHeader.Free;
    FTrailer.Free;

    FInfo := nil;
    FRoot := nil;
    FOutlineRoot := nil;

    FHasDoc := false;
  end;
end;

// SaveToStream
procedure TPdfDoc.SaveToStream(AStream: TStream);
var
  i: integer;
  Pos: integer;
  PdfNumber: TPdfNumber;
begin
  if not HasDoc or (FCanvas.Page = nil) then
    raise EPdfInvalidOperation.Create('SaveToStream --there is no document to save.');
  // write all objects to specified stream.

  FInfo.ModDate := Now;
  FRoot.SaveOpenAction;

  // saving outline tree.
  if UseOutlines then
    FOutlineRoot.Save;

  AStream.Position := 0;
  FHeader.WriteToStream(AStream);
  for i := 1 to FXref.ItemCount - 1 do
  begin
    Pos := AStream.Position;
    FXref.Items[i].Value.WriteValueToStream(AStream);
    //Cause I ansified _WriteString there are only AnsiChars in the Stream
    FXref.Items[i].ByteOffset := Pos;
//    FXref.Items[i].ByteOffset := Pos div SizeOf(Char);
  end;
  FTrailer.XrefAddress := AStream.Position;
  FXref.WriteToStream(AStream);
  PdfNumber := FTrailer.Attributes.PdfNumberByName('Size');
  PdfNumber.Value := FXref.ItemCount;
  FTrailer.WriteToStream(AStream);
end;

// SetVirtualMode
procedure TPdfDoc.SetVirtualMode;
begin
  NewDoc;
  AddPage;
  FCanvas.FIsVirtual := true;
end;


{ TPdfCanvasAttribute }

// SetWordSpace
procedure TPdfCanvasAttribute.SetWordSpace(Value: Single);
begin
  if Value < 0 then
    raise EPdfInvalidValue.Create('SetWordSpace --invalid word space');
  if Value <> FWordSpace then
    FWordSpace := Value;
end;

// SetCharSpace
procedure TPdfCanvasAttribute.SetCharSpace(Value: Single);
begin
  if (Value < PDF_MIN_CHARSPACE) or (VALUE > PDF_MAX_CHARSPACE) then
    raise EPdfInvalidValue.Create('SetCharSpace --invalid char space');
  if Value <> FCharSpace then
    FCharSpace := Value;
end;

// SetFontSize
procedure TPdfCanvasAttribute.SetFontSize(Value: Single);
begin
  if (Value < 0) or (Value > PDF_MAX_FONTSIZE) then
    raise EPdfInvalidValue.Create('SetCharSpace --invalid font size');
  if Value <> FFontSize then
    FFontSize := Value;
end;

// SetHorizontalScaling
procedure TPdfCanvasAttribute.SetHorizontalScaling(Value: Word);
begin
  if (Value < PDF_MIN_HORIZONTALSCALING) or
    (Value > PDF_MAX_HORIZONTALSCALING) then
    raise EPdfInvalidValue.Create('SetHorizontalScaling --invalid font size');
  if Value <> FHorizontalScaling then
    FHorizontalScaling := Value;
end;

// SetLeading
procedure TPdfCanvasAttribute.SetLeading(Value: Single);
begin
  if (Value < 0) or (Value > PDF_MAX_LEADING) then
    raise EPdfInvalidValue.Create('SetLeading --invalid font size');
  if Value <> FLeading then
    FLeading := Value;
end;

// TextWidth
function TPdfCanvasAttribute.TextWidth(Text: string): Single;
var
  i: integer;
  ch: char;
  tmpWidth: Single;
begin
  Result := 0;

  // calculate width of specified text from current attributes
  for i := 1 to Length(Text) do
  begin
    ch := Text[i];
    tmpWidth := FFont.GetCharWidth(Text, i) * FFontSize / 1000;
    if FHorizontalScaling <> 100 then
      tmpWidth := tmpWidth * FHorizontalScaling / 100;
    if tmpWidth > 0 then
      tmpWidth := tmpWidth + FCharSpace
    else
      tmpWidth := 0;
    if (ch = ' ') and (FWordSpace > 0) and (i <> Length(Text)) then
      tmpWidth := tmpWidth + FWordSpace;

    Result := Result + tmpWidth;
  end;
  Result := Result - FCharSpace;
end;

// MeasureText
function TPdfCanvasAttribute.MeasureText(Text: string; Width: Single): integer;
var
  i: integer;
  ch: char;
  tmpWidth: Single;
  tmpTotalWidth: Single;
begin
  Result := 0;
  tmpTotalWidth := 0;

  // calculate number of character contain in the specified width.
  for i := 1 to Length(Text) do
  begin
    ch := Text[i];
    tmpWidth := FFont.GetCharWidth(Text, i) * FFontSize / 1000;
    if FHorizontalScaling <> 100 then
      tmpWidth := tmpWidth * FHorizontalScaling / 100;
    if tmpWidth > 0 then
      tmpWidth := tmpWidth + FCharSpace
    else
      tmpWidth := 0;
    if (ch = ' ') and (FWordSpace > 0) and (i <> Length(Text)) then
      tmpWidth := tmpWidth + FWordSpace;

    tmpTotalWidth := tmpTotalWidth + tmpWidth;
    if tmpTotalWidth > Width then
      Break;
    inc(Result);
  end;
end;

{ TPdfCanvas }

// Create
constructor TPdfCanvas.Create(APdfDoc: TPdfDoc);
begin
  FPdfDoc := APdfDoc;
  FPage := nil;
  FContents := nil;
  FAttr := TPdfCanvasAttribute.Create;
  FIsVirtual := false;
end;

// Destroy
destructor TPdfCanvas.Destroy;
begin
  FAttr.Free;
  inherited;
end;

// SetPageWidth
procedure TPdfCanvas.SetPageWidth(AValue: integer);
var
  FMediaBox: TPdfArray;
begin
  FMediaBox := TPdfArray(Page.ValueByName('MediaBox'));
  if FMediaBox <> nil then
    TPdfNumber(FMediaBox.Items[2]).Value := AValue
  else
    EPdfInvalidOperation.Create('Can not chenge width of this page..');
end;

// SetPageHeight
procedure TPdfCanvas.SetPageHeight(AValue: integer);
var
  FMediaBox: TPdfArray;
begin
  FMediaBox := TPdfArray(Page.ValueByName('MediaBox'));
  if FMediaBox <> nil then
    TPdfNumber(FMediaBox.Items[3]).Value := AValue
  else
    EPdfInvalidOperation.Create('Can not chenge width of this page..');
end;

// WriteString
procedure TPdfCanvas.WriteString(S: string);
begin
  if (not FIsVirtual) and (FContents <> nil) then
    _WriteString(S, FContents.Stream);
end;

// GetPage
function TPdfCanvas.GetPage: TPdfDictionary;
begin
  if FPage <> nil then
    result := FPage
  else
    raise EPdfInvalidOperation.Create('GetPage --the Page is nil');
end;

// GetPageWidth
function TPdfCanvas.GetPageWidth: Integer;
var
  FMediaBox: TPdfArray;
begin
  FMediaBox := TPdfArray(Page.ValueByName('MediaBox'));
  if FMediaBox <> nil then
    result := TPdfNumber(FMediaBox.Items[2]).Value
  else
    result := FPdfDoc.DefaultPageWidth;
end;

// GetPageHeight
function TPdfCanvas.GetPageHeight: Integer;
var
  FMediaBox: TPdfArray;
begin
  FMediaBox := TPdfArray(Page.ValueByName('MediaBox'));
  if FMediaBox <> nil then
    result := TPdfNumber(FMediaBox.Items[3]).Value
  else
    result := FPdfDoc.DefaultPageHeight;
end;

// GetColorStr
function TPDFCanvas.GetColorStr(Color: TPdfColor): string;
var
  X: array[0..3] of Byte;
  rgb: integer;
begin
  if Color > 0 then
    rgb := integer(Color)
  else
    rgb := 0;
  Move(rgb, x[0], 4);
  result := _FloatToStrR(X[0] / 255) + ' ' +
            _FloatToStrR(X[1] / 255) + ' ' +
            _FloatToStrR(X[2] / 255);
end;

// SetPage
procedure TPdfCanvas.SetPage(APage: TPdfDictionary);
  procedure GetCurrentFont;
  var
    AFont: TPdfName;
  begin
    AFont := Page.PdfNameByName('_Font');
    with FAttr do
      if AFont <> nil then
      begin
        Font := FPdfDoc.GetFont(AFont.Value);
        FontSize := FPage.PdfNumberByName('_Font_Size').Value;
        WordSpace := FPage.PdfRealByName('_Word_Space').Value;
        CharSpace := FPage.PdfRealByName('_Char_Space').Value;
        HorizontalScaling := FPage.PdfNumberByName('_HScalling').Value;
        Leading := FPage.PdfNumberByName('_Leading').Value;
      end
      else
      begin
        Font := nil;
        SetFont(PDF_DEFAULT_FONT, PDF_DEFAULT_FONT_SIZE);
        CharSpace := 0;
        WordSpace := 0;
        HorizontalScaling := 100;
        Leading := 0;
      end;
  end;
begin
  // save current canvas attributes to internal objects.
  if FPage <> nil then
  with FPage do
    begin
      AddInternalItem('_Font', TPdfName.CreateName(FAttr.Font.Name));
      AddInternalItem('_Font_Size', TPdfReal.CreateReal(FAttr.FontSize));
      AddInternalItem('_Word_Space', TPdfReal.CreateReal(FAttr.WordSpace));
      AddInternalItem('_Char_Space', TPdfReal.CreateReal(FAttr.CharSpace));
      AddInternalItem('_HScalling', TPdfNumber.CreateNumber(FAttr.HorizontalScaling));
      AddInternalItem('_Leading', TPdfReal.CreateReal(FAttr.Leading));
    end;
  FPage := APage;
  FContents := TPdfStream(FPage.ValueByName('Contents'));
  GetCurrentFont;
end;

// SetFont
procedure TPdfCanvas.SetFont(AName: string; ASize: Single);
var
  FFont: TPdfFont;
  FFontList: TPdfDictionary;
  FFontName: string;
begin
  // get font object from pdfdoc object, then find fontlist from page object
  // by internal name. if font is not registered, register it to page object.
  FFont := FPdfDoc.GetFont(AName);
  if (FAttr.Font = FFont) and (FAttr.FontSize = ASize) then Exit;
  FFontList := _Page_GetResources(FPage, 'Font');
  FFontName := FFont.Data.PdfNameByName('Name').Value;
  if FFontList.ValueByName(FFontName) = nil then
    FFontList.AddItem(FFontName, FFont.Data);
  if FContents <> nil then
    SetFontAndSize('/' + FFontName, ASize);
  FAttr.Font := FFont;
  FAttr.FontSize := ASize;
end;

// TextOut
procedure TPdfCanvas.TextOut(X, Y: Single; Text: string);
begin
  BeginText;
  MoveTextPoint(X, Y);
  ShowText(Text);
  EndText;
end;

// TextRect
procedure TPdfCanvas.TextRect(ARect: TPdfRect; Text: string;
                            Alignment: TPdfAlignment; Clipping: boolean);
var
  tmpWidth: Single;
  XPos: Single;
begin
  // calculate text width.
  tmpWidth := TextWidth(Text);

  case Alignment of
    paCenter: XPos := Round((ARect.Right - ARect.Left - tmpWidth) / 2);
    paRightJustify: XPos := ARect.Right - ARect.Left - Round(tmpWidth);
  else
    XPos := 0;
  end;

  // clipping client rect if needed.
  if Clipping then
  begin
    GSave;
    with ARect do
      begin
        MoveTo(Left, Top);
        LineTo(Left, Bottom);
        LineTo(Right, Bottom);
        LineTo(Right, Top);
      end;
    ClosePath;
    Clip;
    NewPath;
  end;

  BeginText;
  MoveTextPoint(ARect.Left + XPos, ARect.Top - FAttr.FontSize * 0.85);
  ShowText(Text);
  EndText;

  if Clipping then
    GRestore;
end;

// MultilineTextRect
procedure TPdfCanvas.MultilineTextRect(ARect: TPdfRect;
            Text: string; WordWrap: boolean);
var
  i: integer;
  S1, S2: string;
  XPos, YPos: Single;
  tmpXPos: Single;
  tmpWidth: Single;
  ln: integer;
  FourceReturn: boolean;
  FText: string;

  procedure InternalShowText(S: string; AWidth: Single);
  var
    i: Integer;
  begin
    i := MeasureText(S, AWidth);
    S := Copy(S, 1, i);
    ShowText(S);
  end;

begin
  YPos := ARect.Top - FAttr.FontSize*0.85;
  XPos := ARect.Left;
  FText := Text;

  BeginText;

  MoveTextPoint(XPos, YPos);
  i := 1;
  S2 := GetNextWord(FText, i);
  XPos := XPos +  TextWidth(S2);
  if (Length(S2) > 0) and (S2[Length(S2)] = ' ') then
    XPos := XPos + FAttr.WordSpace;

  while i <= Length(FText) do
  begin
    ln := Length(S2);
    if (ln >= 2) and (S2[ln] = #10) and (S2[ln-1] = #13) then
    begin
      S2 := Copy(S2, 1, ln - 2);
      FourceReturn := true;
    end
    else
      FourceReturn := false;

    S1 := GetNextWord(FText, i);
    tmpWidth := TextWidth(S1);
    TmpXPos := XPos + tmpWidth;

    if (WordWrap and (TmpXPos > ARect.Right)) or
      FourceReturn then
    begin
      if S2 <> '' then
        InternalShowText(S2, ARect.Right - ARect.Left);
      S2 := '';
      MoveToNextLine;
      ARect.Top := ARect.Top - FAttr.Leading;
      if ARect.Top < ARect.Bottom + FAttr.FontSize then
        Break;
      XPos := ARect.Left;
    end;
    XPos := XPos + tmpWidth;
    if (Length(S1) > 0) and (S1[Length(S1)] = ' ') then
      XPos := XPos + FAttr.WordSpace;
    S2 := S2 + S1;
  end;

  if S2 <> '' then
    InternalShowText(S2, ARect.Right - ARect.Left);
  EndText;
end;

// DrawXObject
procedure TPdfCanvas.DrawXObject(X, Y, AWidth, AHeight: Single;
    AXObjectName: string);
var
  XObject: TPdfXObject;
  FXObjectList: TPdfDictionary;
begin
  // drawing object must be registered. check object name.
  XObject := FPdfDoc.GetXObject(AXObjectName);
  if XObject = nil then
    raise EPdfInvalidValue.CreateFmt('DrawXObject --XObject not found: %s', [AXObjectName]);

  FXObjectList := _Page_GetResources(FPage, 'XObject');
  if FXObjectList.ValueByName(AXObjectName) = nil then
    FXObjectList.AddItem(AXObjectName, XObject);

  GSave;
  Concat(AWidth, 0, 0, AHeight, X, Y);
  ExecuteXObject(XObject.Attributes.PdfNameByName('Name').Value);
  GRestore;
end;

// DrawXObjectEx
procedure TPdfCanvas.DrawXObjectEx(X, Y, AWidth, AHeight: Single;
      ClipX, ClipY, ClipWidth, ClipHeight: Single; AXObjectName: string);
var
  XObject: TPdfXObject;
  FXObjectList: TPdfDictionary;
begin
  // drawing object must be registered. check object name.
  XObject := FPdfDoc.GetXObject(AXObjectName);
  if XObject = nil then
    raise EPdfInvalidValue.CreateFmt('DrawXObjectEx --XObject not found: %s', [AXObjectName]);

  FXObjectList := _Page_GetResources(FPage, 'XObject');
  if FXObjectList.ValueByName(AXObjectName) = nil then
    FXObjectList.AddItem(AXObjectName, XObject);

  GSave;
  Rectangle(ClipX, ClipY, ClipWidth, ClipHeight);
  Clip;
  NewPath;
  Concat(AWidth, 0, 0, AHeight, X, Y);
  ExecuteXObject(XObject.Attributes.PdfNameByName('Name').Value);
  GRestore;
end;

  {* Special Graphics State *}

// GSave
procedure TPdfCanvas.GSave;
begin
  WriteString('q'#10);
end;

// GRestore
procedure TPdfCanvas.GRestore;
begin
  WriteString('Q'#10);
end;

// Concat
procedure TPdfCanvas.Concat(a, b, c, d, e, f: Single);
var
  S: string;
begin
  S := _FloatToStrR(a) + ' ' +
       _FloatToStrR(b) + ' ' +
       _FloatToStrR(c) + ' ' +
       _FloatToStrR(d) + ' ' +
       _FloatToStrR(e) + ' ' +
       _FloatToStrR(f) + ' cm'#10;
  WriteString(S);
end;

  {* General Graphics State *}

// SetFlat
procedure TPdfCanvas.SetFlat(flatness: Byte);
var
  S: string;
begin
  S := IntToStr(flatness) + ' i'#10;
  WriteString(S);
end;

// SetLineCap
procedure TPdfCanvas.SetLineCap(linecap: TLineCapStyle);
var
  S: string;
begin
  S := IntToStr(ord(linecap)) + ' J'#10;
  WriteString(S);
end;

// SetDash
procedure TPdfCanvas.SetDash(aarray: array of Byte; phase: Byte);
var
  S: string;
  i: integer;
begin
  S := '[';
  if (High(aarray) >= 0) and (aarray[0] <> 0) then
    for i := 0 to High(aarray) do
      S := S + IntToStr(aarray[i]) + ' ';
  S := S + '] ' + IntToStr(phase) + ' d'#10;
  WriteString(S);
end;

// SetLineJoin
procedure TPdfCanvas.SetLineJoin(linejoin: TLineJoinStyle);
var
  S: string;
begin
  S := IntToStr(ord(linejoin)) + ' j'#10;
  WriteString(S);
end;

// SetLineWidth
procedure TPdfCanvas.SetLineWidth(linewidth: Single);
var
  S: string;
begin
  S := _FloatToStrR(linewidth) + ' w'#10;
  WriteString(S);
end;

// SetMiterLimit
procedure TPdfCanvas.SetMiterLimit(miterlimit: Byte);
var
  S: string;
begin
  S := IntToStr(miterlimit) + ' M'#10;
  WriteString(S);
end;

  {* Paths *}

// MoveTo
procedure TPdfCanvas.MoveTo(x, y: Single);
var
  S: string;
begin
  S := _FloatToStrR(x) + ' ' + _FloatToStrR(y) + ' m'#10;
  WriteString(S);
end;

// LineTo
procedure TPdfCanvas.LineTo(x, y: Single);
var
  S: string;
begin
  S := _FloatToStrR(x) + ' ' + _FloatToStrR(y) + ' l'#10;
  WriteString(S);
end;

// CurveToC
procedure TPdfCanvas.CurveToC(x1, y1, x2, y2, x3, y3: Single);
var
  S: string;
begin
  S := _FloatToStrR(x1) + ' ' +
       _FloatToStrR(y1) + ' ' +
       _FloatToStrR(x2) + ' ' +
       _FloatToStrR(y2) + ' ' +
       _FloatToStrR(x3) + ' ' +
       _FloatToStrR(y3) + ' c'#10;
  WriteString(S);
end;

// CurveToV
procedure TPdfCanvas.CurveToV(x2, y2, x3, y3: Single);
var
  S: string;
begin
  S := _FloatToStrR(x2) + ' ' +
       _FloatToStrR(y2) + ' ' +
       _FloatToStrR(x3) + ' ' +
       _FloatToStrR(y3) + ' v'#10;
  WriteString(S);
end;

// CurveToY
procedure TPdfCanvas.CurveToY(x1, y1, x3, y3: Single);
var
  S: string;
begin
  S := _FloatToStrR(x1) + ' ' +
       _FloatToStrR(y1) + ' ' +
       _FloatToStrR(x3) + ' ' +
       _FloatToStrR(y3) + ' y'#10;
  WriteString(S);
end;

// Rectangle
procedure TPdfCanvas.Rectangle(x, y, width, height: Single);
var
  S: string;
begin
  S := _FloatToStrR(x) + ' ' +
       _FloatToStrR(y) + ' ' +
       _FloatToStrR(width) + ' ' +
       _FloatToStrR(height) + ' re'#10;
  WriteString(S);
end;

// Closepath
procedure TPdfCanvas.Closepath;
begin
  WriteString('h'#10);
end;

// NewPath
procedure TPdfCanvas.NewPath;
begin
  WriteString('n'#10);
end;

// Stroke
procedure TPdfCanvas.Stroke;
begin
  WriteString('S'#10);
end;

// ClosePathStroke
procedure TPdfCanvas.ClosePathStroke;
begin
  WriteString('s'#10);
end;

// Fill
procedure TPdfCanvas.Fill;
begin
  WriteString('f'#10);
end;

// Eofill
procedure TPdfCanvas.Eofill;
begin
  WriteString('f*'#10);
end;

// FillStroke
procedure TPdfCanvas.FillStroke;
begin
  WriteString('B'#10);
end;

// ClosepathFillStroke
procedure TPdfCanvas.ClosepathFillStroke;
begin
  WriteString('b'#10);
end;

// EofillStroke
procedure TPdfCanvas.EofillStroke;
begin
  WriteString('B*'#10);
end;

// ClosepathEofillStroke
procedure TPdfCanvas.ClosepathEofillStroke;
begin
  WriteString('b*'#10);
end;

// Clip
procedure TPdfCanvas.Clip;
begin
  WriteString('W'#10);
end;

// Eoclip
procedure TPdfCanvas.Eoclip;
begin
  WriteString('W*'#10);
end;

{* Test state *}

// SetCharSpace
procedure TPdfCanvas.SetCharSpace(charSpace: Single);
begin
  if FAttr.CharSpace = charSpace then Exit;
  FAttr.SetCharSpace(charSpace);
  if Contents <> nil then
    WriteString(_FloatToStrR(charSpace) + ' Tc'#10);
end;

// SetWordSpace
procedure TPdfCanvas.SetWordSpace(wordSpace: Single);
begin
  if FAttr.WordSpace = wordSpace then Exit;
  FAttr.SetWordSpace(wordSpace);
  if Contents <> nil then
    WriteString(_FloatToStrR(wordSpace) + ' Tw'#10);
end;

// SetHorizontalScaling
procedure TPdfCanvas.SetHorizontalScaling(hScaling: Word);
begin
  if FAttr.HorizontalScaling = hScaling then Exit;
  FAttr.SetHorizontalScaling(hScaling);
  WriteString(IntToStr(hScaling) + ' Tz'#10);
end;

// SetLeading
procedure TPdfCanvas.SetLeading(leading: Single);
begin
  if FAttr.Leading = leading then Exit;
  FAttr.SetLeading(leading);
  WriteString(_FloatToStrR(leading) + ' TL'#10);
end;

// SetFontAndSize
procedure TPdfCanvas.SetFontAndSize(fontname: string; size: Single);
var
  S: string;
begin
  S := fontname + ' ' +
       _FloatToStrR(size) + ' Tf'#10;
  WriteString(S);
end;

// SetTextRenderingMode
procedure TPdfCanvas.SetTextRenderingMode(mode: TTextRenderingMode);
begin
  WriteString(IntToStr(ord(mode)) + ' Tr'#10);
end;

// SetTextRise
procedure TPdfCanvas.SetTextRise(rise: Word);
begin
  WriteString(IntToStr(rise) + ' Ts'#10);
end;

// BeginText
procedure TPdfCanvas.BeginText;
begin
  WriteString('BT'#10);
end;

// EndText
procedure TPdfCanvas.EndText;
begin
  WriteString('ET'#10);
end;

// MoveTextPoint
procedure TPdfCanvas.MoveTextPoint(tx, ty: Single);
var
  S: string;
begin
  S := _FloatToStrR(tx) + ' ' +
       _FloatToStrR(ty) + ' Td'#10;
  WriteString(S);
end;

// SetTextMatrix
procedure TPdfCanvas.SetTextMatrix(a, b, c, d, x, y: Word);
var
  S: string;
begin
  S := IntToStr(a) + ' ' +
       IntToStr(b) + ' ' +
       IntToStr(c) + ' ' +
       IntToStr(d) + ' ' +
       IntToStr(x) + ' ' +
       IntToStr(y) + ' Tm'#10;
  WriteString(S);
end;

// MoveToNextLine
procedure TPdfCanvas.MoveToNextLine;
begin
  WriteString('T*'#10);
end;

// ShowText
procedure TPdfCanvas.ShowText(s: string);
var
  FString: string;
begin
  if _HasMultiByteString(s) then
    FString := '<' + _StrToHex(s) + '>'
  else
    FString := '(' + _EscapeText(s) + ')';
  WriteString(FString + ' Tj'#10);
end;

// ShowTextNextLine
procedure TPdfCanvas.ShowTextNextLine(s: string);
var
  FString: string;
begin
  if _HasMultiByteString(s) then
    FString := '<' + _StrToHex(s) + '>'
  else
    FString := '(' + _EscapeText(s) + ')';
  WriteString(FString + ' '''#10);
end;

{* external objects *}

// ExecuteXObject
procedure TPdfCanvas.ExecuteXObject(xObject: string);
var
  S: string;
begin
  S := '/' + xObject + ' Do'#10;
  WriteString(S);
end;

{* Device-dependent color space operators *}

// SetRGBFillColor
procedure TPdfCanvas.SetRGBFillColor(Value: TPdfColor);
var
  S: string;
begin
  S := GetColorStr(Value) + ' rg'#10;
  WriteString(S);
end;

// SetRGBStrokeColor
procedure TPdfCanvas.SetRGBStrokeColor(Value: TPdfColor);
var
  S: string;
begin
  S := GetColorStr(Value) + ' RG'#10;
  WriteString(S);
end;

{ TPdfCanvas common routine }

// TextWidth
function TPdfCanvas.TextWidth(Text: string): Single;
begin
  result := FAttr.TextWidth(Text);
end;

// MeasureText
function TPdfCanvas.MeasureText(Text: string; AWidth: Single): integer;
begin
  result := FAttr.MeasureText(Text, AWidth);
end;

// Ellipse
procedure TPdfCanvas.Ellipse(x, y, width, height: Single);
begin
    MoveTo(x, y+height/2);
    CurveToC(x,
             y+height/2-height/2*11/20,
             x+width/2-width/2*11/20,
             y,
             x+width/2,
             y);
    CurveToC(x+width/2+width/2*11/20,
             y,
             x+width,
             y+height/2-height/2*11/20,
             x+width,
             y+height/2);
    CurveToC(x+width,
             y+height/2+height/2*11/20,
             x+width/2+width/2*11/20,
             y+height,
             x+width/2,
             y+height);
    CurveToC(x+width/2-width/2*11/20,
             y+height,
             x,
             y+height/2+height/2*11/20,
             x,
             y+height/2);
end;

// GetNextWord
function TPdfCanvas.GetNextWord(const S: string;
  var Index: integer): string;
var
  ln: integer;
  i: integer;
begin
  // getting a word from text.
  result := '';
  ln := Length(S);
  if Index > ln then
    Exit;
  i := Index;
  while true do
    if (S[i] = #10) and (S[i-1] = #13) or (S[i] = ' ') then
    begin
      result := Copy(S, Index, i - (Index -1));
      break;
    end
    else
    if i >= ln then
    begin
      result := Copy(S, Index, i - (Index - 1));
      break;
    end
    {$IFDEF USE_JPFONTS}
    else
    if ByteType(S, i) = mbTrailByte then
      if ((Copy(S, i+1, 2) <> #129#66) and
        (Copy(S, i+1, 2) <> #129#65)) then
      begin
        result := Copy(S, Index, i - (Index - 1));
        break;
      end
      else
        inc(i)
    else
    if ((i < ln) and (ByteType(S, i + 1) = mbLeadByte)) then
    begin
      result := Copy(S, Index, i - (Index - 1));
      break;
    end
    {$ENDIF}
    else
      inc(i);

   Index := i + 1;
end;

// GetDoc
function TPdfCanvas.GetDoc: TPdfDoc;
begin
  result := nil;
  if FPdfDoc <> nil then
    result := FPdfDoc
  else
    EPdfInvalidOperation.Create('ERROR: GetDoc documant is nil.');
end;

{ TPdfDictionaryWrapper }

// SetData
procedure TPdfDictionaryWrapper.SetData(AData: TPdfDictionary);
begin
  FData := AData;
end;

// GetHasData
function TPdfDictionaryWrapper.GetHasData: boolean;
begin
  result := (FData = nil);
end;

{ TPdfInfo }

// SetAuthor
procedure TPdfInfo.SetAuthor(Value: string);
begin
  FData.AddItem('Author', TPdfText.CreateText(Value));
end;

// SetCreationDate
procedure TPdfInfo.SetCreationDate(Value: TDateTime);
begin
  FData.AddItem('CreationDate', TPdfText.CreateText(_DateTimeToPdfDate(Value)));
end;

// SetModDate
procedure TPdfInfo.SetModDate(Value: TDateTime);
begin
  FData.AddItem('ModDate', TPdfText.CreateText(_DateTimeToPdfDate(Value)));
end;

// SetCreator
procedure TPdfInfo.SetCreator(Value: string);
begin
  FData.AddItem('Creator', TPdfText.CreateText(Value));
end;

// SetTitle
procedure TPdfInfo.SetTitle(Value: string);
begin
  FData.AddItem('Title', TPdfText.CreateText(Value));
end;

// SetSubject
procedure TPdfInfo.SetSubject(Value: string);
begin
  FData.AddItem('Subject', TPdfText.CreateText(Value));
end;

// SetKeywords
procedure TPdfInfo.SetKeywords(Value: string);
begin
  FData.AddItem('Keywords', TPdfText.CreateText(Value));
end;

// GetAuthor
function TPdfInfo.GetAuthor: string;
begin
  if FData.ValueByName('Author') <> nil then
    result := FData.PdfTextByName('Author').Value
  else
    result := '';
end;

// GetCreationDate
function TPdfInfo.GetCreationDate: TDateTime;
begin
  if FData.ValueByName('CreationDate') <> nil then
  try
    result := _PdfDateToDateTime(FData.PdfTextByName('CreationDate').Value);
  except
    result := 0;
  end
  else
    result := 0;
end;

// GetModDate
function TPdfInfo.GetModDate: TDateTime;
begin
  if FData.ValueByName('ModDate') <> nil then
  try
    result := _PdfDateToDateTime(FData.PdfTextByName('ModDate').Value);
  except
    result := 0;
  end
  else
    result := 0;
end;

// GetCreator
function TPdfInfo.GetCreator: string;
begin
  if FData.ValueByName('Creator') <> nil then
    result := FData.PdfTextByName('Creator').Value
  else
    result := '';
end;

// GetTitle
function TPdfInfo.GetTitle: string;
begin
  if FData.ValueByName('Title') <> nil then
    result := FData.PdfTextByName('Title').Value
  else
    result := '';
end;

// GetSubject
function TPdfInfo.GetSubject: string;
begin
  if FData.ValueByName('Subject') <> nil then
    result := FData.PdfTextByName('Subject').Value
  else
    result := '';
end;

// GetKeywords
function TPdfInfo.GetKeywords: string;
begin
  if FData.ValueByName('Keywords') <> nil then
    result := FData.PdfTextByName('Keywords').Value
  else
    result := '';
end;

{ TPdfCatalog }

// SaveOpenAction
procedure TPdfCatalog.SaveOpenAction;
begin
  if (FOpenAction = nil) then
    FData.RemoveItem('OpenAction')
  else
    FData.AddItem('OpenAction', FOpenAction.GetValue);
end;

// SetPageLayout
procedure TPdfCatalog.SetPageLayout(Value: TPdfPageLayout);
var
  FPageLayout: TPdfName;
begin
  FPageLayout := TPdfName(FData.ValueByName('PageLayout'));
  if (FPageLayout = nil) or (not (FPageLayout is TPdfName)) then
    FData.AddItem('PageLayout', TPdfName.CreateName(PDF_PAGE_LAYOUT_NAMES[Ord(Value)]))
  else
    FPageLayout.Value := PDF_PAGE_LAYOUT_NAMES[Ord(Value)];
end;

// GetPageLayout
function TPdfCatalog.GetPageLayout: TPdfPageLayout;
var
  FPageLayout: TPdfName;
  S: string;
  i: integer;
begin
  result := plSinglePage;
  FPageLayout := TPdfName(FData.ValueByName('PageLayout'));
  if (FPageLayout = nil) or (not (FPageLayout is TPdfName)) then
    Exit
  else
  begin
    S := FPageLayout.Value;
    for i := 0 to High(PDF_PAGE_LAYOUT_NAMES) do
      if PDF_PAGE_LAYOUT_NAMES[i] = S then
      begin
        result := TPdfPageLayout(i);
        Break;
      end;
  end;
end;

function TPdfCatalog.GetNonFullScreenPageMode: TPdfPageMode;
var
  FDictionary: TPdfDictionary;
  FPageMode: TPdfName;
  S: string;
  i: integer;
begin
  result := pmUseNone;
  FDictionary := TPdfDictionary(FData.ValueByName('NonFullScreenPageMode'));

  if FDictionary = nil then
    Exit;

  FPageMode := TPdfName(FDictionary.ValueByName('NonFullScreenPageMode'));
  if (FPageMode = nil) or (not (FPageMode is TPdfName)) then
    Exit;

  S := FPageMode.Value;
  for i := 0 to High(PDF_PAGE_MODE_NAMES) do
    if PDF_PAGE_MODE_NAMES[i] = S then
    begin
      result := TPdfPageMode(i);
      Break;
    end;
end;

function TPdfCatalog.GetViewerPreference: TPdfViewerPreferences;
var
  FDictionary: TPdfDictionary;
  FValue: TPdfBoolean;
begin
  result := [];
  FDictionary := TPdfDictionary(FData.ValueByName('ViewerPreference'));

  if FDictionary = nil then
    Exit;

  FValue := FData.PdfBooleanByName('HideToolbar');
  if (FValue <> nil) or FValue.Value then
    result := result + [vpHideToolbar];

  FValue := FData.PdfBooleanByName('HideMenubar');
  if (FValue <> nil) or FValue.Value then
    result := result + [vpHideMenubar];

  FValue := FData.PdfBooleanByName('HideWindowUI');
  if (FValue <> nil) or FValue.Value then
    result := result + [vpHideWindowUI];

  FValue := FData.PdfBooleanByName('FitWindow');
  if (FValue <> nil) or FValue.Value then
    result := result + [vpFitWindow];

  FValue := FData.PdfBooleanByName('CenterWindow');
  if (FValue <> nil) or FValue.Value then
    result := result + [vpCenterWindow];
end;

// SetPageMode
procedure TPdfCatalog.SetPageMode(Value: TPdfPageMode);
var
  FPageMode: TPdfName;
begin
  FPageMode := TPdfName(FData.ValueByName('PageMode'));
  if (FPageMode = nil) or (not (FPageMode is TPdfName)) then
    FData.AddItem('PageMode', TPdfName.CreateName(PDF_PAGE_MODE_NAMES[Ord(Value)]))
  else
    FPageMode.Value := PDF_PAGE_MODE_NAMES[Ord(Value)];
end;

procedure TPdfCatalog.SetNonFullScreenPageMode(Value: TPdfPageMode);
var
  FDictionary: TPdfDictionary;
  FPageMode: TPdfName;
begin
  FDictionary := TPdfDictionary(FData.ValueByName('ViewerPreferences'));

  if FDictionary = nil then
  begin
    FDictionary := TPdfDictionary.CreateDictionary(Data.ObjectMgr);
    Data.AddItem('ViewerPreferences', FDictionary);
  end;

  // if Value is pmFullScreen, remove 'PageMode' element(use default value).
  if (Value = pmFullScreen) or (Value = pmUseNone) then
    FDictionary.RemoveItem('NonFullScreenPageMode')
  else
  begin
    FPageMode := TPdfName(FDictionary.ValueByName('NonFullScreenPageMode'));
    if (FPageMode = nil) or (not (FPageMode is TPdfName)) then
      FDictionary.AddItem('NonFullScreenPageMode',
                        TPdfName.CreateName(PDF_PAGE_MODE_NAMES[Ord(Value)]))
    else
      FPageMode.Value := PDF_PAGE_MODE_NAMES[Ord(Value)];
  end;
end;

procedure TPdfCatalog.SetViewerPreference(Value: TPdfViewerPreferences);
var
  FDictionary: TPdfDictionary;
begin
  FDictionary := TPdfDictionary(FData.ValueByName('ViewerPreferences'));

  if (FDictionary = nil) and (Value <> []) then
  begin
    FDictionary := TPdfDictionary.CreateDictionary(Data.ObjectMgr);
    FData.AddItem('ViewerPreferences', FDictionary);
  end;

  if (vpHideToolbar in Value) then
    FDictionary.AddItem('HideToolbar', TPdfBoolean.CreateBoolean(true))
  else
    FDictionary.RemoveItem('HideToolbar');

  if (vpHideMenubar in Value) then
    FDictionary.AddItem('HideMenubar', TPdfBoolean.CreateBoolean(true))
  else
    FDictionary.RemoveItem('HideMenubar');

  if (vpHideWindowUI in Value) then
    FDictionary.AddItem('HideWindowUI', TPdfBoolean.CreateBoolean(true))
  else
    FDictionary.RemoveItem('HideWindowUI');

  if (vpFitWindow in Value) then
    FDictionary.AddItem('FitWindow', TPdfBoolean.CreateBoolean(true))
  else
    FDictionary.RemoveItem('FitWindow');

  if (vpCenterWindow in Value) then
    FDictionary.AddItem('CenterWindow', TPdfBoolean.CreateBoolean(true))
  else
    FDictionary.RemoveItem('CenterWindow');
end;

// GetPageMode
function TPdfCatalog.GetPageMode: TPdfPageMode;
var
  FPageMode: TPdfName;
  S: string;
  i: integer;
begin
  result := pmUseNone;
  FPageMode := TPdfName(FData.ValueByName('PageMode'));
  if (FPageMode = nil) or (not (FPageMode is TPdfName)) then
    Exit
  else
  begin
    S := FPageMode.Value;
    for i := 0 to High(PDF_PAGE_MODE_NAMES) do
      if PDF_PAGE_MODE_NAMES[i] = S then
      begin
        result := TPdfPageMode(i);
        Break;
      end;
  end;
end;

// GetPages
function TPdfCatalog.GetPages: TPdfDictionary;
begin
  result := TPdfDictionary(FData.ValueByName('Pages'));
  if result = nil then
    raise EPdfInvalidOperation.Create('GetPages --page object is null..');
end;

// SetPages
procedure TPdfCatalog.SetPages(APage: TPdfDictionary);
begin
  if _GetTypeOf(APage) = 'Pages' then
    FData.AddItem('Pages', APage);
end;

{ TPdfFont }

// AddStrElements
procedure TPdfFont.AddStrElements(ADic: TPdfDictionary;
  ATable: array of TPDF_STR_TBL);
var
  i: integer;
begin
  { utility routine for making font dictinary. }
  for i := 0 to High(ATable) do
    ADic.AddItem(ATable[i].KEY, TPdfName.CreateName(ATable[i].VAL));
end;

// AddIntElements
procedure TPdfFont.AddIntElements(ADic: TPdfDictionary;
  ATable: array of TPDF_INT_TBL);
var
  i: integer;
begin
  { utility routine for making font dictionary. }
  for i := 0 to High(ATable) do
    ADic.AddItem(ATable[i].KEY, TPdfNumber.CreateNumber(ATable[i].VAL));
end;

// GetCharWidth
function TPdfFont.GetCharWidth(AText: string; APos: integer): integer;
begin
  result := 0;
end;

// Create
constructor TPdfFont.Create(AXref: TPdfXref; AName: string);
begin
  inherited Create;
  FName := AName;
end;

{ PdfDestination }

// Create
constructor TPdfDestination.Create(APdfDoc: TPdfDoc);
var
  i: integer;
begin
  inherited Create;
  FDoc := APdfDoc;
  if (FDoc = nil) or (not FDoc.HasDoc) then
    raise EPdfInvalidOperation.Create('TPdfDestination --cannot destination object.');
  FPage := FDoc.Canvas.Page;
  for i := Low(FValues) to High(FValues) do
    FValues[i] := 0;
  FZoom := 1;
end;

// Destroy
destructor TPdfDestination.Destroy;
begin
  if FReference <> nil then
    FReference.Free;
  inherited;
end;

// GetElement
function TPdfDestination.GetElement(Index: integer): Integer;
begin
  result := FValues[Index];
end;

// SetElement
procedure TPdfDestination.SetElement(Index: integer; Value: Integer);
begin
  if FValues[Index] <> Value then
    if Value < 0 then
      FValues[Index] := -1
    else
      FValues[Index] := Value;
end;

// SetZoom
procedure TPdfDestination.SetZoom(Value: Single);
begin
  if Value <> FZoom then
    if Value < 0 then
      raise EPdfInvalidValue.Create('Zoom property cannot set to under 0.')
    else
    if Value > PDF_MAX_ZOOMSIZE then
      raise EPdfInvalidValue.CreateFmt('Zoom property cannot set to over %d.', [PDF_MAX_ZOOMSIZE])
    else
      FZoom := Value;
end;

// GetPageWidth
function TPdfDestination.GetPageWidth: Integer;
var
  FMediaBox: TPdfArray;
begin
  FMediaBox := FPage.PdfArrayByName('MediaBox');
  if FMediaBox <> nil then
    result := TPdfNumber(FMediaBox.Items[2]).Value
  else
    result := FDoc.DefaultPageWidth;
end;

// GetPageHeight
function TPdfDestination.GetPageHeight: Integer;
var
  FMediaBox: TPdfArray;
begin
  FMediaBox := FPage.PdfArrayByName('MediaBox');
  if FMediaBox <> nil then
    result := TPdfNumber(FMediaBox.Items[3]).Value
  else
    result := FDoc.DefaultPageHeight;
end;

// GetValue
function TPdfDestination.GetValue: TPdfArray;
const
  DEST_MAX_VALUE = 100;
begin
  // create TPdfArray object from the specified values.
  // the values which are not used are ignored.
  result := TPdfArray.CreateArray(FDoc.FXref);
  with result do
  begin
    AddItem(FPage);
    AddItem(TPdfName.CreateName(PDF_DESTINATION_TYPE_NAMES[ord(FType)]));
    case FType of
      // if the type is dtXYZ, only Left, Top and Zoom values are used,
      // other properties are ignored.
      dtXYZ:
        begin
          if FValues[0] >= -DEST_MAX_VALUE then
            AddItem(TPdfNumber.CreateNumber(Left))
          else
            AddItem(TPdfNull.Create);
          if FValues[1] >= -DEST_MAX_VALUE then
            AddItem(TPdfNumber.CreateNumber(Top))
          else
            AddItem(TPdfNull.Create);
          if FZoom < 0 then
            FZoom := 0;
          AddItem(TPdfReal.CreateReal(FZoom));
        end;
      // if the type is dtFitR, all values except Zoom are used.
      dtFitR:
        begin
          if FValues[0] >= -DEST_MAX_VALUE then
            AddItem(TPdfNumber.CreateNumber(Left))
          else
            AddItem(TPdfNull.Create);
          if FValues[1] >= -DEST_MAX_VALUE then
            AddItem(TPdfNumber.CreateNumber(Bottom))
          else
            AddItem(TPdfNull.Create);
          if FValues[2] >= 0 then
            AddItem(TPdfNumber.CreateNumber(Right))
          else
            AddItem(TPdfNull.Create);
          if FValues[3] >= 0 then
            AddItem(TPdfNumber.CreateNumber(Top))
          else
            AddItem(TPdfNull.Create);
        end;
      // if the type is dtFitH or dtFitBH, only Top property is used.
      dtFitH, dtFitBH:
          if FValues[1] >= -DEST_MAX_VALUE then
            AddItem(TPdfNumber.CreateNumber(Top))
          else
            AddItem(TPdfNull.Create);
      // if the type is dtFitV or dtFitBV, only Top property is used.
      dtFitV, dtFitBV:
          if FValues[0] >= -DEST_MAX_VALUE then
            AddItem(TPdfNumber.CreateNumber(Left))
          else
            AddItem(TPdfNull.Create);
    end;
  end;
end;

{ TPdfOutlineEntry }

// CreateEntry
constructor TPdfOutlineEntry.CreateEntry(AParent: TPdfOutlineEntry);
begin
  inherited Create;

  if AParent = nil then
    Raise Exception.Create('CreateEntry --invalid parent.');

  FParent := AParent;
  FCount := 0;
  FDoc := AParent.Doc;
  Data := TPdfDictionary.CreateDictionary(FDoc.FXref);
  FDoc.FXref.AddObject(Data);
  FDoc.FObjectList.Add(Self);
end;

// Destroy
destructor TPdfOutlineEntry.Destroy;
begin
  if FReference <> nil then
    FReference.Free;
  inherited;
end;

// AddChild
function TPdfOutlineEntry.AddChild: TPdfOutlineEntry;
var
  TmpEntry: TPdfOutlineEntry;
begin
  // increment Count variable recursive.
  inc(FCount);
  TmpEntry := Parent;
  while TmpEntry <> nil do
  begin
    TmpEntry.FCount := TmpEntry.FCount + 1;
    TmpEntry := TmpEntry.Parent;
  end;

  result := TPdfOutlineEntry.CreateEntry(Self);
  if FFirst = nil then
    FFirst := Result;
  if FLast <> nil then
    FLast.FNext := Result;
  Result.FPrev := FLast;
  FLast := Result;
end;

// Save
procedure TPdfOutlineEntry.Save;
begin
  if Opened then
    Data.AddItem('Count', TPdfNumber.CreateNumber(FCount))
  else
    Data.AddItem('Count', TPdfNumber.CreateNumber(-FCount));

  Data.AddItem('Title', TPdfText.CreateText(FTitle));

  if FDest <> nil then
    Data.AddItem('Dest', FDest.GetValue);

  if FFirst <> nil then
  begin
    Data.AddItem('First', FFirst.Data);
    FFirst.Save;
  end;
  if FLast <> nil then
    Data.AddItem('Last', FLast.Data);
  if FPrev <> nil then
    Data.AddItem('Prev', FPrev.Data);
  if FNext <> nil then
  begin
    Data.AddItem('Next', FNext.Data);
    FNext.Save;
  end;
end;

{ TPdfOutlineRoot }

// CreateRoot
constructor TPdfOutlineRoot.CreateRoot(ADoc: TPdfDoc);
begin
  inherited Create;
  FCount := 0;
  FDoc := ADoc;
  FOpened := true;
  Data := TPdfDictionary.CreateDictionary(ADoc.FXref);
  FDoc.FXref.AddObject(Data);
  with Data do
    AddItem('Type', TPdfName.CreateName('Outlines'));
  FDoc.FObjectList.Add(Self);
end;

// Save
procedure TPdfOutlineRoot.Save;
begin
  if Opened then
    Data.AddItem('Count', TPdfNumber.CreateNumber(FCount))
  else
    Data.AddItem('Count', TPdfNumber.CreateNumber(-FCount));
  if FFirst <> nil then
  begin
    Data.AddItem('First', FFirst.Data);
    FFirst.Save;
  end;
  if FLast <> nil then
    Data.AddItem('Last', FLast.Data);
end;

end.
