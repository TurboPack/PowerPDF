==============================================================================

                              P o w e r P d f
                             Version 0.9 (beta)
                   1999-2001 Copyright (c) takeshi kanno
                       takeshi_kanno@est.hi-ho.ne.jp

==============================================================================

INTRODUCTION
============

PowerPdf is  a VCL to create PDF docment visually. Like QuickReport, you can 
design PDF document easily on Delphi IDE. 


REQUIRES
========

Delphi3.0 or later.
The non-visual unit(TPdfDoc, TPdfType) can be used with kylix.


INSTALLATION
============

1.Extracts the files from powerpdf.zip. 
2.Choose Component|Install Component, and install PowerPdf.pas.

NOTE
If you want to use FlateDecode/Zlib compression, copy zlib.pas and *.obj files
(these are included in Delphi's CD-ROM) to your librally path.

Please see the file PowerPdfRef.pdf for the full documentation.


COPYRIGHT
=========

Copyright (C) 1999-2001 Takeshi Kanno

This library is free software; you can redistribute it and/or modify it
under the terms of the GNU Library General Public License as published
by the Free Software Foundation; either version 2 of the License, or any
later version.

This library is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Library general Public License for more
details.


GETTING LATEST VERSION
======================
Visit my homepage at www.est.hi-ho.ne.jp/takeshi_kanno/powerpdf


CHANGES
=======
2001.06.14 Added TPRJpegImage.
2001.06.16 Fixed bugs of TPRImage.
2001.06.30 Added chinese fonts(experimental).
2001.06.30 Modify FloatToStrR method for area whose decimal separator is ",".
2001.07.07 Changed some type definition of PdfDoc.pas (for BCB).
2001.07.07 Added TPRAnnotation.
2001.07.21 Added TPREllipse.
2001.07.28 Fixed bug of TPdfCanvas.SetPage.
2001.08.01 added TPReport.PageLayout.
2001.08.08 changed the algorithm of the free XObject name.
2001.08.10 changed the text width routine(bugs when large font size).
2001.08.12 changed the implementation of outlines.
2001.08.12 changed the implementation of annotation.
2001.08.15 added TPROutline and TPRDestination.
2001.09.01 changed the implementation of the image.
2001.09.08 added OpenAction function.
           added AlignJustified property to TPRLabel.
2001.09.13 added ViewerPreference functions.


NOTE
====
There are some "uncompatibility" functions in version 0.85 and 0.9.
1.pdHolz in TPrintDirection was changed to pdHorz (spelling mistake :-).
2.The implementation of outline-entry was changed. See the documentation and 
  sample programs.
3.The implementation of Image in TPdfDoc was changed. If needs that change 
  your programs if you use TPdfDoc class directory.
4.Change the method name MesureText to MeasureText in TPdfDoc.

I'm Japanese and I'm not good at English. So there may be a funny expression 
in this file and document. 
If you notice such a thing, please report all problems or suggestions to me. 

Thanks.

