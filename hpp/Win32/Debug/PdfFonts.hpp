// CodeGear C++Builder
// Copyright (c) 1995, 2016 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PdfFonts.pas' rev: 31.00 (Windows)

#ifndef PdffontsHPP
#define PdffontsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <PdfDoc.hpp>
#include <PdfTypes.hpp>

//-- user supplied -----------------------------------------------------------

namespace Pdffonts
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TPdfType1Font;
class DELPHICLASS TPdfFixedWidth;
class DELPHICLASS TPdfFixedWidthBold;
class DELPHICLASS TPdfFixedWidthItalic;
class DELPHICLASS TPdfFixedWidthBoldItalic;
class DELPHICLASS TPdfArial;
class DELPHICLASS TPdfArialBold;
class DELPHICLASS TPdfArialItalic;
class DELPHICLASS TPdfArialBoldItalic;
class DELPHICLASS TPdfTimesRoman;
class DELPHICLASS TPdfTimesBold;
class DELPHICLASS TPdfTimesItalic;
class DELPHICLASS TPdfTimesBoldItalic;
class DELPHICLASS TPdfScript;
//-- type declarations -------------------------------------------------------
typedef System::StaticArray<Pdfdoc::TPDF_STR_TBL, 3> Pdffonts__1;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 2> Pdffonts__2;

typedef System::StaticArray<Pdfdoc::TPDF_STR_TBL, 3> Pdffonts__3;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__4;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__5;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__6;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__7;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 2> Pdffonts__8;

typedef System::StaticArray<Pdfdoc::TPDF_STR_TBL, 3> Pdffonts__9;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__01;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__11;

typedef System::StaticArray<Pdfdoc::TPDF_STR_TBL, 3> Pdffonts__21;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__31;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__41;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 2> Pdffonts__51;

typedef System::StaticArray<Pdfdoc::TPDF_STR_TBL, 3> Pdffonts__61;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__71;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__81;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__91;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__02;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 2> Pdffonts__12;

typedef System::StaticArray<Pdfdoc::TPDF_STR_TBL, 3> Pdffonts__22;

typedef System::StaticArray<Pdfdoc::TPDF_INT_TBL, 7> Pdffonts__32;

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfType1Font : public Pdfdoc::TPdfFont
{
	typedef Pdfdoc::TPdfFont inherited;
	
private:
	System::Byte FFirstChar;
	System::Byte FLastChar;
	System::StaticArray<System::Word, 256> FArray;
	
public:
	virtual void __fastcall SetData(Pdftypes::TPdfDictionary* Value);
	virtual int __fastcall GetCharWidth(System::UnicodeString AText, int APos);
public:
	/* TPdfFont.Create */ inline __fastcall virtual TPdfType1Font(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName) : Pdfdoc::TPdfFont(AXref, AName) { }
	
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfType1Font(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfFixedWidth : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfFixedWidth(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfFixedWidth(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfFixedWidthBold : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfFixedWidthBold(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfFixedWidthBold(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfFixedWidthItalic : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfFixedWidthItalic(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfFixedWidthItalic(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfFixedWidthBoldItalic : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfFixedWidthBoldItalic(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfFixedWidthBoldItalic(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfArial : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfArial(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfArial(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfArialBold : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfArialBold(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfArialBold(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfArialItalic : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfArialItalic(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfArialItalic(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfArialBoldItalic : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfArialBoldItalic(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfArialBoldItalic(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfTimesRoman : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfTimesRoman(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfTimesRoman(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfTimesBold : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfTimesBold(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfTimesBold(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfTimesItalic : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfTimesItalic(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfTimesItalic(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfTimesBoldItalic : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfTimesBoldItalic(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfTimesBoldItalic(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfScript : public TPdfType1Font
{
	typedef TPdfType1Font inherited;
	
public:
	__fastcall virtual TPdfScript(Pdfdoc::TPdfXref* AXref, System::UnicodeString AName);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfScript(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE Pdffonts__1 TYPE1_FONT_STR_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 224> FIXED_WIDTH_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__2 FIXED_WIDTH_INT_TABLE;
extern DELPHI_PACKAGE Pdffonts__3 FIXED_WIDTH_DISC_STR_TABLE;
extern DELPHI_PACKAGE Pdffonts__4 FIXED_WIDTH_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> FIXED_WIDTH_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> FIXED_WIDTH_BOLD_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__5 FIXED_WIDTH_BOLD_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> FIXED_WIDTH_BOLD_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> FIXED_WIDTH_ITALIC_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__6 FIXED_WIDTH_ITALIC_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> FIXED_WIDTH_ITALIC_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> FIXED_WIDTH_BOLDITALIC_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__7 FIXED_WIDTH_BOLDITALIC_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> FIXED_WIDTH_BOLDITALIC_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> ARIAL_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__8 ARIAL_INT_TABLE;
extern DELPHI_PACKAGE Pdffonts__9 ARIAL_DISC_STR_TABLE;
extern DELPHI_PACKAGE Pdffonts__01 ARIAL_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> ARIAL_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> ARIAL_BOLD_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__11 ARIAL_BOLD_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> ARIAL_BOLD_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> ARIAL_ITALIC_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__21 ARIAL_ITALIC_DISC_STR_TABLE;
extern DELPHI_PACKAGE Pdffonts__31 ARIAL_ITALIC_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> ARIAL_ITALIC_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> ARIAL_BOLDITALIC_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__41 ARIAL_BOLDITALIC_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> ARIAL_BOLDITALIC_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> TIMES_ROMAN_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__51 TIMES_INT_TABLE;
extern DELPHI_PACKAGE Pdffonts__61 TIMES_DISC_STR_TABLE;
extern DELPHI_PACKAGE Pdffonts__71 TIMES_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> TIMES_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> TIMES_ITALIC_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__81 TIMES_ITALIC_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> TIMES_ITALIC_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> TIMES_BOLD_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__91 TIMES_BOLD_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> TIMES_BOLD_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> TIMES_BOLDITALIC_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__02 TIMES_BOLDITALIC_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> TIMES_BOLDITALIC_BBOX;
extern DELPHI_PACKAGE System::StaticArray<int, 224> SCRIPT_W_ARRAY;
extern DELPHI_PACKAGE Pdffonts__12 SCRIPT_INT_TABLE;
extern DELPHI_PACKAGE Pdffonts__22 SCRIPT_DISC_STR_TABLE;
extern DELPHI_PACKAGE Pdffonts__32 SCRIPT_DISC_INT_TABLE;
extern DELPHI_PACKAGE System::StaticArray<int, 4> SCRIPT_BBOX;
}	/* namespace Pdffonts */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PDFFONTS)
using namespace Pdffonts;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PdffontsHPP
