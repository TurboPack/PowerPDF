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
  Classes, PReport, PRJpegImage, PRAnnotation;

procedure Register;

implementation

{ Registoer }

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
end;

end.
