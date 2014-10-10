// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PRJpegImage.pas' rev: 28.00 (Windows)

#ifndef PrjpegimageHPP
#define PrjpegimageHPP

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
#include <PdfTypes.hpp>	// Pascal unit
#include <PdfImages.hpp>	// Pascal unit
#include <PdfJpegImage.hpp>	// Pascal unit
#include <Vcl.Imaging.jpeg.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Prjpegimage
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TPRJpegImage;
class PASCALIMPLEMENTATION TPRJpegImage : public Preport::TPRImage
{
	typedef Preport::TPRImage inherited;
	
protected:
	virtual void __fastcall SetPicture(Vcl::Graphics::TPicture* Value);
	virtual void __fastcall Print(Preport::TPRCanvas* ACanvas, const System::Types::TRect &ARect);
public:
	/* TPRImage.Create */ inline __fastcall virtual TPRJpegImage(System::Classes::TComponent* AOwner) : Preport::TPRImage(AOwner) { }
	/* TPRImage.Destroy */ inline __fastcall virtual ~TPRJpegImage(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Prjpegimage */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PRJPEGIMAGE)
using namespace Prjpegimage;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PrjpegimageHPP
