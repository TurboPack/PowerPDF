// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PdfImages.pas' rev: 28.00 (Windows)

#ifndef PdfimagesHPP
#define PdfimagesHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <PdfTypes.hpp>	// Pascal unit
#include <PdfDoc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Pdfimages
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TPdfImageCreator;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfImageCreator : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
public:
	virtual Pdftypes::TPdfImage* __fastcall CreateImage(Vcl::Graphics::TGraphic* AImage);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfImageCreator(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfImageCreator(void) : System::Classes::TPersistent() { }
	
};

#pragma pack(pop)

class DELPHICLASS TPdfBitmapImage;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfBitmapImage : public TPdfImageCreator
{
	typedef TPdfImageCreator inherited;
	
private:
	Pdftypes::TPdfArray* __fastcall CreateIndexedColorArray(Vcl::Graphics::TBitmap* ABitmap);
	
public:
	virtual Pdftypes::TPdfImage* __fastcall CreateImage(Vcl::Graphics::TGraphic* AImage);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfBitmapImage(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfBitmapImage(void) : TPdfImageCreator() { }
	
};

#pragma pack(pop)

class DELPHICLASS EPdfInvalidImageFormat;
#pragma pack(push,4)
class PASCALIMPLEMENTATION EPdfInvalidImageFormat : public System::Sysutils::Exception
{
	typedef System::Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall EPdfInvalidImageFormat(const System::UnicodeString Msg) : System::Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EPdfInvalidImageFormat(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High) : System::Sysutils::Exception(Msg, Args, Args_High) { }
	/* Exception.CreateRes */ inline __fastcall EPdfInvalidImageFormat(NativeUInt Ident)/* overload */ : System::Sysutils::Exception(Ident) { }
	/* Exception.CreateRes */ inline __fastcall EPdfInvalidImageFormat(System::PResStringRec ResStringRec)/* overload */ : System::Sysutils::Exception(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall EPdfInvalidImageFormat(NativeUInt Ident, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High) { }
	/* Exception.CreateResFmt */ inline __fastcall EPdfInvalidImageFormat(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High) { }
	/* Exception.CreateHelp */ inline __fastcall EPdfInvalidImageFormat(const System::UnicodeString Msg, int AHelpContext) : System::Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EPdfInvalidImageFormat(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High, int AHelpContext) : System::Sysutils::Exception(Msg, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EPdfInvalidImageFormat(NativeUInt Ident, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EPdfInvalidImageFormat(System::PResStringRec ResStringRec, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EPdfInvalidImageFormat(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EPdfInvalidImageFormat(NativeUInt Ident, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EPdfInvalidImageFormat(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE Pdftypes::TPdfImage* __fastcall CreatePdfImage(Vcl::Graphics::TGraphic* AImage, System::UnicodeString ImageClassName);
}	/* namespace Pdfimages */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PDFIMAGES)
using namespace Pdfimages;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PdfimagesHPP
