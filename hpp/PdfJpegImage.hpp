// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PdfJpegImage.pas' rev: 28.00 (Windows)

#ifndef PdfjpegimageHPP
#define PdfjpegimageHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <PdfTypes.hpp>	// Pascal unit
#include <PdfDoc.hpp>	// Pascal unit
#include <PdfImages.hpp>	// Pascal unit
#include <Vcl.Imaging.jpeg.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Pdfjpegimage
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TPdfJpegImage;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfJpegImage : public Pdfimages::TPdfImageCreator
{
	typedef Pdfimages::TPdfImageCreator inherited;
	
public:
	virtual Pdftypes::TPdfImage* __fastcall CreateImage(Vcl::Graphics::TGraphic* AImage);
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfJpegImage(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfJpegImage(void) : Pdfimages::TPdfImageCreator() { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Pdfjpegimage */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PDFJPEGIMAGE)
using namespace Pdfjpegimage;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PdfjpegimageHPP
