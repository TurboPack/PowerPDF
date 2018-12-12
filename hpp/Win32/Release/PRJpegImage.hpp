// CodeGear C++Builder
// Copyright (c) 1995, 2017 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PRJpegImage.pas' rev: 33.00 (Windows)

#ifndef PrjpegimageHPP
#define PrjpegimageHPP

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
#include <PReport.hpp>
#include <PdfDoc.hpp>
#include <PdfTypes.hpp>
#include <PdfImages.hpp>
#include <PdfJpegImage.hpp>
#include <Vcl.Imaging.jpeg.hpp>

//-- user supplied -----------------------------------------------------------

namespace Prjpegimage
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TPRJpegImage;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TPRJpegImage : public Preport::TPRImage
{
	typedef Preport::TPRImage inherited;
	
protected:
	virtual void __fastcall SetPicture(Vcl::Graphics::TPicture* Value);
	virtual void __fastcall Print(Preport::TPRCanvas* ACanvas, const System::Types::TRect &ARect);
public:
	/* TPRImage.Create */ inline __fastcall virtual TPRJpegImage(System::Classes::TComponent* AOwner) : Preport::TPRImage(AOwner) { }
	/* TPRImage.Destroy */ inline __fastcall virtual ~TPRJpegImage() { }
	
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
