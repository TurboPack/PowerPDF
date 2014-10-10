{*
 * << P o w e r P d f >> -- PRJpegImage.pas
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
 * 2001.07.01 create
 * 2001.09.07 changes the implementation of TPdfImageCreator.
 *
 *}
unit PRJpegImage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PReport, PdfDoc, PdfTypes, PdfImages, PdfJpegImage, JPEG;

type
  TPRJpegImage = class(TPRImage)
  protected
    procedure SetPicture(Value: TPicture); override;
    procedure Print(ACanvas: TPRCanvas; ARect: TRect); override;
  end;

implementation

// Print
procedure TPRJpegImage.Print(ACanvas: TPRCanvas; ARect: TRect);
var
  FDoc: TPdfDoc;
  FXObjectName: string;
  i: integer;
begin
  if not Printable then Exit;

  if (FPicture = nil) or (FPicture.Graphic = nil) or
   (FPicture.Graphic.Empty) or not (FPicture.Graphic is TJpegImage) then
    Exit;
  FDoc := ACanvas.PdfCanvas.Doc;
  if SharedImage then
  begin
    FXObjectName := Self.Name;
    if FDoc.GetXObject(FXObjectName) = nil then
      FDoc.AddXObject(FXObjectName, CreatePdfImage(FPicture.Graphic, 'Pdf-Jpeg'));
  end
  else
  begin
    for i := 1 to MAX_IMAGE_NUMBER do
    begin
      FXObjectName := Self.Name + IntToStr(Random(MAX_IMAGE_NUMBER));
      if FDoc.GetXObject(FXObjectName) = nil then Break;
      if i = MAX_IMAGE_NUMBER then
        raise Exception.Create('image count over max value..');
    end;
    FDoc.AddXObject(FXObjectName, CreatePdfImage(FPicture.Graphic, 'Pdf-Jpeg'));
  end;
  with ARect, ACanvas.PdfCanvas do
    if FStretch then
      DrawXObject(Left, Self.Page.Height - Bottom, Width, Height, FXObjectName)
    else
      DrawXObjectEx(Left, Self.Page.Height - Top - FPicture.Height,
            FPicture.Width, FPicture.Height,
            Left, Self.Page.Height - Top - Height, Width, Height, FXObjectName);
end;

// SetPicture
procedure TPRJpegImage.SetPicture(Value: TPicture);
begin
  if (Value = nil) or (Value.Graphic = nil) or (Value.Graphic is TJpegImage) then
  begin
    FPicture.Assign(Value);
    Invalidate;
  end
  else
    raise exception.Create('only jpeg image is allowed.');
end;

end.
