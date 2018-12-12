{*
 * << P o w e r P d f >> -- PdfJpegImage.pas
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
 * 2001.06.14 create
 * 2001.09.07 changes the implementation of TPdfImageCreator.
 *
 *}
unit PdfJpegImage;

interface

uses
  SysUtils, Classes, Graphics, PdfTypes, PdfDoc, PdfImages, JPEG;

type
  { TPdfJpegImage }
  TPdfJpegImage = class(TPdfImageCreator)
  public
    function CreateImage(AImage: TGraphic): TPdfImage; override;
  end;

implementation

// CreateImage
function TPdfJpegImage.CreateImage(AImage: TGraphic): TPdfImage;
begin
  // check whether specified graphic is valid image.
  if not (AImage is TJpegImage) then
    raise EPdfInvalidValue.Create('only jpeg image is allowed.');

  result := TPdfImage.CreateStream(nil);
  with result do
  try
    TJpegImage(AImage).SaveToStream(Stream);
    with Attributes do
    begin
      AddItem('Type', TPdfName.CreateName('XObject'));
      AddItem('Subtype', TPdfName.CreateName('Image'));

      // Hier auf Graustufen prüfen
      If TJpegImage(Aimage).Grayscale Then
       AddItem('ColorSpace', TPdfName.CreateName('DeviceGray'))
      Else
       AddItem('ColorSpace', TPdfName.CreateName('DeviceRGB')); // ursprünglich wird immer RGB geschrieben

      AddItem('Width', TPdfNumber.CreateNumber(AImage.Width));
      AddItem('Height', TPdfNumber.CreateNumber(AImage.Height));
      AddItem('BitsPerComponent', TPdfNumber.CreateNumber(8));
      PdfArrayByName('Filter').AddItem(TPdfName.CreateName('DCTDecode'));
    end;
  except
    result.Free;
    raise;
  end; 
end;  

initialization

  RegisterClassAlias(TPdfJpegImage, 'Pdf-Jpeg');

finalization

  UnRegisterClass(TPdfJpegImage);

end.
