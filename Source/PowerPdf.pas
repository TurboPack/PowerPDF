{*
 * << P o w e r P d f >> -- PowerPdf.pas
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
 * 2000.07.07 Create.
 *
 *}
unit PowerPdf;

interface

uses
  System.Classes, PReport, PRJpegImage, PRAnnotation, PdfFonts, PdfImages,
  PdfJpegImage;

procedure Register;
procedure Unregister;

implementation

{ Register }

procedure Register;
begin
  RegisterComponents('PowerPdf', [TPReport,
                                  TPRPage,
                                  TPRLayoutPanel,
                                  TPRGridPanel,
                                  TPRLabel,
                                  TPRText,
                                  TPRRect,
                                  TPREllipse,
                                  TPRImage,
                                  TPRJpegImage,
                                  TPRAnnotation
                                 ]);

  RegisterClassAlias(TPdfFixedWidth, 'FixedWidth');
  RegisterClassAlias(TPdfFixedWidthBold, 'FixedWidth-Bold');
  RegisterClassAlias(TPdfFixedWidthBoldItalic, 'FixedWidth-BoldItalic');
  RegisterClassAlias(TPdfFixedWidthItalic, 'FixedWidth-Italic');
  RegisterClassAlias(TPdfArial, 'Arial');
  RegisterClassAlias(TPdfArialBold, 'Arial-Bold');
  RegisterClassAlias(TPdfArialBoldItalic, 'Arial-BoldItalic');
  RegisterClassAlias(TPdfArialItalic, 'Arial-Italic');
  RegisterClassAlias(TPdfTimesRoman, 'Times-Roman');
  RegisterClassAlias(TPdfTimesBold, 'Times-Bold');
  RegisterClassAlias(TPdfTimesItalic, 'Times-Italic');
  RegisterClassAlias(TPdfTimesBoldItalic, 'Times-BoldItalic');
//  RegisterClassAlias(TPdfScript, 'Script');
//  RegisterClassAlias(TPdfSymbol, 'Symbol');

  RegisterClassAlias(TPdfBitmapImage, 'Pdf-Bitmap');

  RegisterClassAlias(TPdfJpegImage, 'Pdf-Jpeg');

end;

procedure Unregister;
begin
  UnRegisterClass(TPdfFixedWidth);
  UnRegisterClass(TPdfFixedWidthBold);
  UnRegisterClass(TPdfFixedWidthBoldItalic);
  UnRegisterClass(TPdfFixedWidthBold);
  UnRegisterClass(TPdfArial);
  UnRegisterClass(TPdfArialBold);
  UnRegisterClass(TPdfArialBoldItalic);
  UnRegisterClass(TPdfArialBold);
  UnRegisterClass(TPdfTimesRoman);
  UnRegisterClass(TPdfTimesBold);
  UnRegisterClass(TPdfTimesItalic);
  UnRegisterClass(TPdfTimesBoldItalic);
//  UnRegisterClass(TPdfScript);
//  UnRegisterClass(TPdfSymbol);

  UnRegisterClass(TPdfBitmapImage);

  UnRegisterClass(TPdfJpegImage);

end;

initialization

finalization
  Unregister;

end.
