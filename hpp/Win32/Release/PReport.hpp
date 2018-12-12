// CodeGear C++Builder
// Copyright (c) 1995, 2017 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PReport.pas' rev: 32.00 (Windows)

#ifndef PreportHPP
#define PreportHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <PdfDoc.hpp>
#include <PdfFonts.hpp>
#include <PdfTypes.hpp>
#include <PdfImages.hpp>
#include <System.Types.hpp>
#include <System.UITypes.hpp>

//-- user supplied -----------------------------------------------------------

namespace Preport
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TPReport;
class DELPHICLASS TPRCanvas;
class DELPHICLASS TPRPage;
class DELPHICLASS TPRPanel;
class DELPHICLASS TPRChildPanel;
class DELPHICLASS TPRLayoutPanel;
class DELPHICLASS TPRGridPanel;
class DELPHICLASS TPRItem;
class DELPHICLASS TPRCustomLabel;
class DELPHICLASS TPRLabel;
class DELPHICLASS TPRText;
class DELPHICLASS TPRShape;
class DELPHICLASS TPRRect;
class DELPHICLASS TPREllipse;
class DELPHICLASS TPRImage;
class DELPHICLASS TPRDestination;
class DELPHICLASS TPROutlineEntry;
class DELPHICLASS TPROutlineRoot;
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TPRFontName : unsigned char { fnFixedWidth, fnArial, fnTimesRoman };

typedef void __fastcall (__closure *TPRPrintPageEvent)(System::TObject* Sender, TPRCanvas* ACanvas);

typedef void __fastcall (__closure *TPRPrintPanelEvent)(System::TObject* Sender, TPRCanvas* ACanvas, const System::Types::TRect &Rect);

typedef TPRPrintPanelEvent TPRPrintItemEvent;

typedef void __fastcall (__closure *TPRPrintChildPanelEvent)(System::TObject* Sender, TPRCanvas* ACanvas, int ACol, int ARow, const System::Types::TRect &Rect);

enum DECLSPEC_DENUM TPrintDirection : unsigned char { pdHorz, pdVert };

typedef Pdfdoc::TPdfDestinationType TPRDestinationType;

typedef Pdfdoc::TPdfPageLayout TPRPageLayout;

typedef Pdfdoc::TPdfPageMode TPRPageMode;

typedef Pdfdoc::TPdfCompressionMethod TPRCompressionMethod;

typedef Pdfdoc::TPdfViewerPreference TPRViewerPreference;

typedef Pdfdoc::TPdfViewerPreferences TPRViewerPreferences;

class PASCALIMPLEMENTATION TPReport : public Pdfdoc::TAbstractPReport
{
	typedef Pdfdoc::TAbstractPReport inherited;
	
private:
	System::UnicodeString FFileName;
	int FPage;
	System::UnicodeString FAuthor;
	System::TDateTime FCreationDate;
	System::UnicodeString FCreator;
	System::UnicodeString FKeywords;
	System::TDateTime FModDate;
	System::UnicodeString FSubject;
	System::UnicodeString FTitle;
	TPRCanvas* FCanvas;
	Pdfdoc::TPdfDoc* FDoc;
	Pdfdoc::TPdfPageMode FPageMode;
	Pdfdoc::TPdfPageMode FNonFullScreenPageMode;
	Pdfdoc::TPdfPageLayout FPageLayout;
	Pdfdoc::TPdfCompressionMethod FCompressionMethod;
	bool FUseOutlines;
	TPROutlineRoot* FOutlineRoot;
	TPRDestination* FOpenAction;
	Pdfdoc::TPdfViewerPreferences FViewerPreference;
	void __fastcall SetOpenAction(TPRDestination* ADest);
	void __fastcall SetAuthor(System::UnicodeString Value);
	void __fastcall SetCreationDate(System::TDateTime Value);
	void __fastcall SetCreator(System::UnicodeString Value);
	void __fastcall SetKeyWords(System::UnicodeString Value);
	void __fastcall SetModDate(System::TDateTime Value);
	void __fastcall SetSubject(System::UnicodeString Value);
	void __fastcall SetTitle(System::UnicodeString Value);
	void __fastcall SetPageLayout(Pdfdoc::TPdfPageLayout Value);
	void __fastcall SetPageMode(Pdfdoc::TPdfPageMode Value);
	void __fastcall SetNonFullScreenPageMode(Pdfdoc::TPdfPageMode Value);
	void __fastcall SetUseOutlines(bool Value);
	void __fastcall SetViewerPreference(Pdfdoc::TPdfViewerPreferences Value);
	TPRDestination* __fastcall GetOpenAction(void);
	TPROutlineRoot* __fastcall GetOutlineRoot(void);
	
public:
	__fastcall virtual TPReport(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TPReport(void);
	void __fastcall BeginDoc(void);
	void __fastcall Print(TPRPage* APage);
	void __fastcall EndDoc(void);
	void __fastcall Abort(void);
	TPRDestination* __fastcall CreateDestination(void);
	Pdfdoc::TPdfDoc* __fastcall GetPdfDoc(void);
	__property int PageNumber = {read=FPage, nodefault};
	__property TPROutlineRoot* OutlineRoot = {read=GetOutlineRoot};
	__property TPRDestination* OpenAction = {read=GetOpenAction, write=SetOpenAction};
	
__published:
	__property System::UnicodeString FileName = {read=FFileName, write=FFileName};
	__property System::UnicodeString Author = {read=FAuthor, write=SetAuthor};
	__property System::TDateTime CreationDate = {read=FCreationDate, write=SetCreationDate};
	__property System::UnicodeString Creator = {read=FCreator, write=SetCreator};
	__property System::UnicodeString Keywords = {read=FKeywords, write=SetKeyWords};
	__property System::TDateTime ModDate = {read=FModDate, write=SetModDate};
	__property System::UnicodeString Subject = {read=FSubject, write=SetSubject};
	__property System::UnicodeString Title = {read=FTitle, write=SetTitle};
	__property Pdfdoc::TPdfPageLayout PageLayout = {read=FPageLayout, write=SetPageLayout, default=0};
	__property Pdfdoc::TPdfPageMode PageMode = {read=FPageMode, write=SetPageMode, default=0};
	__property Pdfdoc::TPdfPageMode NonFullScreenPageMode = {read=FNonFullScreenPageMode, write=SetNonFullScreenPageMode, default=0};
	__property Pdfdoc::TPdfCompressionMethod CompressionMethod = {read=FCompressionMethod, write=FCompressionMethod, default=0};
	__property bool UseOutlines = {read=FUseOutlines, write=SetUseOutlines, nodefault};
	__property Pdfdoc::TPdfViewerPreferences ViewerPreference = {read=FViewerPreference, write=SetViewerPreference, nodefault};
};


#pragma pack(push,4)
class PASCALIMPLEMENTATION TPRCanvas : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	Pdfdoc::TPdfCanvas* FCanvas;
	void __fastcall SetPdfCanvas(Pdfdoc::TPdfCanvas* ACanvas);
	int __fastcall GetPageHeight(void);
	int __fastcall GetPageWidth(void);
	
public:
	__fastcall TPRCanvas(void);
	float __fastcall TextWidth(System::UnicodeString Text);
	void __fastcall SetCharSpace(float charSpace);
	void __fastcall SetWordSpace(float wordSpace);
	void __fastcall SetHorizontalScaling(System::Word hScaling);
	void __fastcall SetLeading(float leading);
	void __fastcall SetFont(System::UnicodeString fontname, float size);
	void __fastcall SetTextRenderingMode(Pdfdoc::TTextRenderingMode mode);
	void __fastcall SetTextRise(System::Word rise);
	void __fastcall TextOut(float X, float Y, System::UnicodeString Text);
	void __fastcall TextRect(const System::Types::TRect &ARect, System::UnicodeString Text, System::Classes::TAlignment Alignment, bool Clipping);
	__property Pdfdoc::TPdfCanvas* PdfCanvas = {read=FCanvas, write=SetPdfCanvas};
	__property int PageHeight = {read=GetPageHeight, nodefault};
	__property int PageWidth = {read=GetPageWidth, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPRCanvas(void) { }
	
};

#pragma pack(pop)

class PASCALIMPLEMENTATION TPRPage : public Vcl::Extctrls::TCustomPanel
{
	typedef Vcl::Extctrls::TCustomPanel inherited;
	
private:
	Pdfdoc::TPdfDoc* FDoc;
	int FMarginTop;
	int FMarginLeft;
	int FMarginRight;
	int FMarginBottom;
	TPRPrintPageEvent FPrintPageEvent;
	void __fastcall SetMarginTop(int Value);
	void __fastcall SetMarginLeft(int Value);
	void __fastcall SetMarginRight(int Value);
	void __fastcall SetMarginBottom(int Value);
	
protected:
	virtual void __fastcall AlignControls(Vcl::Controls::TControl* AControl, System::Types::TRect &ARect);
	virtual void __fastcall Paint(void);
	void __fastcall Print(TPRCanvas* ACanvas);
	__property Pdfdoc::TPdfDoc* InternalDoc = {read=FDoc};
	
public:
	__fastcall virtual TPRPage(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TPRPage(void);
	
__published:
	__property TPRPrintPageEvent OnPrintPage = {read=FPrintPageEvent, write=FPrintPageEvent};
	__property int MarginTop = {read=FMarginTop, write=SetMarginTop, nodefault};
	__property int MarginLeft = {read=FMarginLeft, write=SetMarginLeft, nodefault};
	__property int MarginRight = {read=FMarginRight, write=SetMarginRight, nodefault};
	__property int MarginBottom = {read=FMarginBottom, write=SetMarginBottom, nodefault};
	__property Visible = {default=1};
public:
	/* TWinControl.CreateParented */ inline __fastcall TPRPage(HWND ParentWindow) : Vcl::Extctrls::TCustomPanel(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TPRPanel : public Vcl::Extctrls::TCustomPanel
{
	typedef Vcl::Extctrls::TCustomPanel inherited;
	
private:
	TPRPage* __fastcall GetPage(void);
	System::Types::TRect __fastcall GetAbsoluteRect(void);
	
protected:
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	
public:
	__property TPRPage* Page = {read=GetPage};
	__fastcall virtual TPRPanel(System::Classes::TComponent* AOwner);
public:
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TPRPanel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TPRPanel(HWND ParentWindow) : Vcl::Extctrls::TCustomPanel(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TPRChildPanel : public TPRPanel
{
	typedef TPRPanel inherited;
	
public:
	/* TPRPanel.Create */ inline __fastcall virtual TPRChildPanel(System::Classes::TComponent* AOwner) : TPRPanel(AOwner) { }
	
public:
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TPRChildPanel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TPRChildPanel(HWND ParentWindow) : TPRPanel(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TPRLayoutPanel : public TPRPanel
{
	typedef TPRPanel inherited;
	
private:
	TPRPrintPanelEvent FAfterPrint;
	TPRPrintPanelEvent FBeforePrint;
	
protected:
	virtual void __fastcall SetParent(Vcl::Controls::TWinControl* AParent);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	
__published:
	__property Align = {default=0};
	__property TPRPrintPanelEvent BeforePrint = {read=FBeforePrint, write=FBeforePrint};
	__property TPRPrintPanelEvent AfterPrint = {read=FAfterPrint, write=FAfterPrint};
public:
	/* TPRPanel.Create */ inline __fastcall virtual TPRLayoutPanel(System::Classes::TComponent* AOwner) : TPRPanel(AOwner) { }
	
public:
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TPRLayoutPanel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TPRLayoutPanel(HWND ParentWindow) : TPRPanel(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TPRGridPanel : public TPRPanel
{
	typedef TPRPanel inherited;
	
private:
	TPRPrintPanelEvent FAfterPrint;
	TPRPrintPanelEvent FBeforePrint;
	TPRPrintChildPanelEvent FBeforePrintChild;
	TPRPrintChildPanelEvent FAfterPrintChild;
	int FColCount;
	int FRowCount;
	TPRChildPanel* FChildPanel;
	TPrintDirection FPrintDirection;
	void __fastcall SetColCount(int Value);
	void __fastcall SetRowCount(int Value);
	
protected:
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	virtual void __fastcall AlignControls(Vcl::Controls::TControl* AControl, System::Types::TRect &ARect);
	virtual void __fastcall Paint(void);
	virtual void __fastcall SetParent(Vcl::Controls::TWinControl* AParent);
	DYNAMIC System::Classes::TComponent* __fastcall GetChildParent(void);
	
public:
	__fastcall virtual TPRGridPanel(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TPRGridPanel(void);
	DYNAMIC void __fastcall GetChildren(System::Classes::TGetChildProc Proc, System::Classes::TComponent* Root);
	
__published:
	__property int ColCount = {read=FColCount, write=SetColCount, nodefault};
	__property int RowCount = {read=FRowCount, write=SetRowCount, nodefault};
	__property Align = {default=0};
	__property TPrintDirection PrintDirection = {read=FPrintDirection, write=FPrintDirection, default=0};
	__property TPRPrintPanelEvent BeforePrint = {read=FBeforePrint, write=FBeforePrint};
	__property TPRPrintPanelEvent AfterPrint = {read=FAfterPrint, write=FAfterPrint};
	__property TPRPrintChildPanelEvent BeforePrintChild = {read=FBeforePrintChild, write=FBeforePrintChild};
	__property TPRPrintChildPanelEvent AfterPrintChild = {read=FAfterPrintChild, write=FAfterPrintChild};
public:
	/* TWinControl.CreateParented */ inline __fastcall TPRGridPanel(HWND ParentWindow) : TPRPanel(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TPRItem : public Vcl::Controls::TGraphicControl
{
	typedef Vcl::Controls::TGraphicControl inherited;
	
private:
	bool FPrintable;
	TPRPage* __fastcall GetPage(void);
	
protected:
	virtual void __fastcall SetParent(Vcl::Controls::TWinControl* AParent);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	Pdfdoc::TPdfDoc* __fastcall GetInternalDoc(void);
	__property TPRPage* Page = {read=GetPage};
	
public:
	__fastcall virtual TPRItem(System::Classes::TComponent* AOwner);
	
__published:
	__property Align = {default=0};
	__property bool Printable = {read=FPrintable, write=FPrintable, default=1};
public:
	/* TGraphicControl.Destroy */ inline __fastcall virtual ~TPRItem(void) { }
	
};


class PASCALIMPLEMENTATION TPRCustomLabel : public TPRItem
{
	typedef TPRItem inherited;
	
private:
	System::Uitypes::TColor FFontColor;
	TPRFontName FFontName;
	float FFontSize;
	bool FFontBold;
	bool FFontItalic;
	float FCharSpace;
	float FWordSpace;
	void __fastcall SetCharSpace(float Value);
	void __fastcall SetWordSpace(float Value);
	void __fastcall SetFontColor(System::Uitypes::TColor Value);
	System::UnicodeString __fastcall GetFontClassName(void);
	void __fastcall SetFontName(TPRFontName Value);
	void __fastcall SetFontItalic(bool Value);
	void __fastcall SetFontBold(bool Value);
	void __fastcall SetFontSize(float Value);
	
protected:
	float __fastcall InternalTextout(Pdfdoc::TPdfCanvas* APdfCanvas, System::UnicodeString S, int X, int Y);
	MESSAGE void __fastcall CMTextChanged(Winapi::Messages::TMessage &Message);
	
public:
	__fastcall virtual TPRCustomLabel(System::Classes::TComponent* AOwner);
	
__published:
	__property System::Uitypes::TColor FontColor = {read=FFontColor, write=SetFontColor, default=0};
	__property TPRFontName FontName = {read=FFontName, write=SetFontName, nodefault};
	__property float FontSize = {read=FFontSize, write=SetFontSize};
	__property bool FontBold = {read=FFontBold, write=SetFontBold, default=0};
	__property bool FontItalic = {read=FFontItalic, write=SetFontItalic, default=0};
	__property float CharSpace = {read=FCharSpace, write=SetCharSpace};
	__property float WordSpace = {read=FWordSpace, write=SetWordSpace};
public:
	/* TGraphicControl.Destroy */ inline __fastcall virtual ~TPRCustomLabel(void) { }
	
};


class PASCALIMPLEMENTATION TPRLabel : public TPRCustomLabel
{
	typedef TPRCustomLabel inherited;
	
private:
	System::Classes::TAlignment FAlignment;
	bool FClipping;
	bool FAlignJustified;
	void __fastcall SetAlignment(System::Classes::TAlignment Value);
	void __fastcall SetAlignJustified(bool Value);
	void __fastcall SetCanvasProperties(Pdfdoc::TPdfCanvas* ACanvas);
	
protected:
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	
__published:
	float __fastcall GetTextWidth(void);
	__property Caption = {default=0};
	__property bool Clipping = {read=FClipping, write=FClipping, default=0};
	__property System::Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
	__property bool AlignJustified = {read=FAlignJustified, write=SetAlignJustified, default=0};
public:
	/* TPRCustomLabel.Create */ inline __fastcall virtual TPRLabel(System::Classes::TComponent* AOwner) : TPRCustomLabel(AOwner) { }
	
public:
	/* TGraphicControl.Destroy */ inline __fastcall virtual ~TPRLabel(void) { }
	
};


class PASCALIMPLEMENTATION TPRText : public TPRCustomLabel
{
	typedef TPRCustomLabel inherited;
	
private:
	bool FWordwrap;
	float FLeading;
	System::Classes::TStrings* FLines;
	void __fastcall SetLeading(float Value);
	void __fastcall SetWordwrap(bool Value);
	void __fastcall SetLines(System::Classes::TStrings* Value);
	HIDESBASE void __fastcall SetText(System::UnicodeString Value);
	HIDESBASE System::UnicodeString __fastcall GetText(void);
	System::Classes::TStrings* __fastcall GetLines(void);
	
protected:
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	
public:
	__fastcall virtual TPRText(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TPRText(void);
	__property System::UnicodeString Text = {read=GetText, write=SetText};
	
__published:
	__property float Leading = {read=FLeading, write=SetLeading};
	__property System::Classes::TStrings* Lines = {read=GetLines, write=SetLines};
	__property bool WordWrap = {read=FWordwrap, write=SetWordwrap, default=0};
};


class PASCALIMPLEMENTATION TPRShape : public TPRItem
{
	typedef TPRItem inherited;
	
private:
	float FLineWidth;
	System::Uitypes::TColor FLineColor;
	Vcl::Graphics::TPenStyle FLineStyle;
	System::Uitypes::TColor FFillColor;
	void __fastcall SetLineColor(System::Uitypes::TColor Value);
	void __fastcall SetFillColor(System::Uitypes::TColor Value);
	void __fastcall SetLineWidth(float Value);
	void __fastcall SetLineStyle(Vcl::Graphics::TPenStyle Value);
	
protected:
	void __fastcall SetDash(Pdfdoc::TPdfCanvas* ACanvas, Vcl::Graphics::TPenStyle APattern);
	
public:
	__fastcall virtual TPRShape(System::Classes::TComponent* AOwner);
	
__published:
	__property float LineWidth = {read=FLineWidth, write=SetLineWidth};
	__property System::Uitypes::TColor LineColor = {read=FLineColor, write=SetLineColor, default=0};
	__property Vcl::Graphics::TPenStyle LineStyle = {read=FLineStyle, write=SetLineStyle, nodefault};
	__property System::Uitypes::TColor FillColor = {read=FFillColor, write=SetFillColor, default=536870911};
public:
	/* TGraphicControl.Destroy */ inline __fastcall virtual ~TPRShape(void) { }
	
};


class PASCALIMPLEMENTATION TPRRect : public TPRShape
{
	typedef TPRShape inherited;
	
protected:
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
public:
	/* TPRShape.Create */ inline __fastcall virtual TPRRect(System::Classes::TComponent* AOwner) : TPRShape(AOwner) { }
	
public:
	/* TGraphicControl.Destroy */ inline __fastcall virtual ~TPRRect(void) { }
	
};


class PASCALIMPLEMENTATION TPREllipse : public TPRShape
{
	typedef TPRShape inherited;
	
protected:
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
public:
	/* TPRShape.Create */ inline __fastcall virtual TPREllipse(System::Classes::TComponent* AOwner) : TPRShape(AOwner) { }
	
public:
	/* TGraphicControl.Destroy */ inline __fastcall virtual ~TPREllipse(void) { }
	
};


class PASCALIMPLEMENTATION TPRImage : public TPRItem
{
	typedef TPRItem inherited;
	
private:
	void __fastcall SetStretch(bool Value);
	
protected:
	Vcl::Graphics::TPicture* FPicture;
	bool FSharedImage;
	bool FStretch;
	virtual void __fastcall SetPicture(Vcl::Graphics::TPicture* Value);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	
public:
	__fastcall virtual TPRImage(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TPRImage(void);
	
__published:
	__property Vcl::Graphics::TPicture* Picture = {read=FPicture, write=SetPicture};
	__property bool SharedImage = {read=FSharedImage, write=FSharedImage, nodefault};
	__property bool Stretch = {read=FStretch, write=SetStretch, default=1};
};


#pragma pack(push,4)
class PASCALIMPLEMENTATION TPRDestination : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Pdfdoc::TPdfDestination* FData;
	void __fastcall SetType(Pdfdoc::TPdfDestinationType Value);
	Pdfdoc::TPdfDestinationType __fastcall GetType(void);
	void __fastcall SetElement(int Index, int Value);
	void __fastcall SetZoom(float Value);
	int __fastcall GetElement(int Index);
	float __fastcall GetZoom(void);
	
protected:
	__fastcall TPRDestination(Pdfdoc::TPdfDestination* AData);
	
public:
	__property Pdfdoc::TPdfDestination* Data = {read=FData};
	__property Pdfdoc::TPdfDestinationType DestinationType = {read=GetType, write=SetType, nodefault};
	__property int Left = {read=GetElement, write=SetElement, index=0, nodefault};
	__property int Top = {read=GetElement, write=SetElement, index=1, nodefault};
	__property int Right = {read=GetElement, write=SetElement, index=2, nodefault};
	__property int Bottom = {read=GetElement, write=SetElement, index=3, nodefault};
	__property float Zoom = {read=GetZoom, write=SetZoom};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TPRDestination(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPROutlineEntry : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Pdfdoc::TPdfOutlineEntry* FData;
	TPROutlineEntry* __fastcall GetParent(void);
	TPROutlineEntry* __fastcall GetNext(void);
	TPROutlineEntry* __fastcall GetPrev(void);
	TPROutlineEntry* __fastcall GetFirst(void);
	TPROutlineEntry* __fastcall GetLast(void);
	TPRDestination* __fastcall GetDest(void);
	System::UnicodeString __fastcall GetTitle(void);
	bool __fastcall GetOpened(void);
	void __fastcall SetDest(TPRDestination* Value);
	void __fastcall SetTitle(System::UnicodeString Value);
	void __fastcall SetOpened(bool Value);
	
public:
	TPROutlineEntry* __fastcall AddChild(void);
	__property TPROutlineEntry* Parent = {read=GetParent};
	__property TPROutlineEntry* Next = {read=GetNext};
	__property TPROutlineEntry* Prev = {read=GetPrev};
	__property TPROutlineEntry* First = {read=GetFirst};
	__property TPROutlineEntry* Last = {read=GetLast};
	__property TPRDestination* Dest = {read=GetDest, write=SetDest};
	__property System::UnicodeString Title = {read=GetTitle, write=SetTitle};
	__property bool Opened = {read=GetOpened, write=SetOpened, nodefault};
public:
	/* TObject.Create */ inline __fastcall TPROutlineEntry(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TPROutlineEntry(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPROutlineRoot : public TPROutlineEntry
{
	typedef TPROutlineEntry inherited;
	
protected:
	__fastcall TPROutlineRoot(Pdfdoc::TPdfDoc* ADoc);
public:
	/* TObject.Create */ inline __fastcall TPROutlineRoot(void) : TPROutlineEntry() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TPROutlineRoot(void) { }
	
};

#pragma pack(pop)

typedef System::StaticArray<System::UnicodeString, 3> Preport__91;

typedef System::StaticArray<System::UnicodeString, 3> Preport__02;

typedef System::StaticArray<System::UnicodeString, 3> Preport__12;

typedef System::StaticArray<System::UnicodeString, 3> Preport__22;

typedef System::StaticArray<System::UnicodeString, 3> Preport__32;

//-- var, const, procedure ---------------------------------------------------
#define POWER_PDF_VERSION_STR L"PowerPdf version 0.9"
#define POWER_PDF_COPYRIGHT L"copyright (c) 1999-2001 takeshi kanno"
extern DELPHI_PACKAGE int LINE_PITCH;
extern DELPHI_PACKAGE System::Uitypes::TColor LINE_COLOR;
static const System::Int8 DEFAULT_MARGIN = System::Int8(0x20);
extern DELPHI_PACKAGE System::Uitypes::TColor PROTECT_AREA_COLOR;
static const System::Int8 MIN_PANEL_SIZE = System::Int8(0xa);
static const System::Word MAX_IMAGE_NUMBER = System::Word(0xffff);
extern DELPHI_PACKAGE Preport__91 PDFFONT_CLASS_NAMES;
extern DELPHI_PACKAGE Preport__02 PDFFONT_CLASS_BOLD_NAMES;
extern DELPHI_PACKAGE Preport__12 PDFFONT_CLASS_ITALIC_NAMES;
extern DELPHI_PACKAGE Preport__22 PDFFONT_CLASS_BOLDITALIC_NAMES;
extern DELPHI_PACKAGE Preport__32 ITEM_FONT_NAMES;
extern DELPHI_PACKAGE System::StaticArray<System::Uitypes::TFontCharset, 3> ITEM_FONT_CHARSETS;
}	/* namespace Preport */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PREPORT)
using namespace Preport;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PreportHPP
