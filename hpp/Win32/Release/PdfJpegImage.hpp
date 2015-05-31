// CodeGear C++Builder
// Copyright (c) 1995, 2015 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PdfJpegImage.pas' rev: 29.00 (Windows)

#ifndef PdfjpegimageHPP
#define PdfjpegimageHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <Vcl.Graphics.hpp>
#include <PdfTypes.hpp>
#include <PdfDoc.hpp>
#include <PdfImages.hpp>
#include <Vcl.Imaging.jpeg.hpp>

//-- user supplied -----------------------------------------------------------

namespace Pdfjpegimage
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TPdfJpegImage;
//-- type declarations -------------------------------------------------------
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
