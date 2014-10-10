// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PRAnnotation.pas' rev: 28.00 (Windows)

#ifndef PrannotationHPP
#define PrannotationHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <PReport.hpp>	// Pascal unit
#include <PdfDoc.hpp>	// Pascal unit
#include <PdfFonts.hpp>	// Pascal unit
#include <PdfTypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Prannotation
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TPRAnnotation;
class PASCALIMPLEMENTATION TPRAnnotation : public Preport::TPRItem
{
	typedef Preport::TPRItem inherited;
	
private:
	System::Classes::TStrings* FLines;
	bool FOpened;
	void __fastcall SetLines(System::Classes::TStrings* Value);
	HIDESBASE void __fastcall SetText(System::UnicodeString Value);
	HIDESBASE System::UnicodeString __fastcall GetText(void);
	System::Classes::TStrings* __fastcall GetLines(void);
	
protected:
	MESSAGE void __fastcall CMTextChanged(Winapi::Messages::TMessage &Message);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Print(Preport::TPRCanvas* ACanvas, const System::Types::TRect &ARect);
	
public:
	__fastcall virtual TPRAnnotation(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TPRAnnotation(void);
	__property System::UnicodeString Text = {read=GetText, write=SetText};
	
__published:
	__property Caption = {default=0};
	__property System::Classes::TStrings* Lines = {read=GetLines, write=SetLines};
	__property bool Opened = {read=FOpened, write=FOpened, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Prannotation */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PRANNOTATION)
using namespace Prannotation;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PrannotationHPP
