{*
 * << P o w e r P d f >> -- PdfFonts.pas
 *
 * << Standerd font set for WinAnsiEncoding Charactors >>
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
 * Create 2000.09.14
 *
 *}
unit PdfFonts;

interface

uses
  SysUtils, Classes, PdfDoc, PdfTypes;

const
  TYPE1_FONT_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'Font'),
                         (KEY: 'Subtype'; VAL: 'Type1'),
                         (KEY: 'Encoding'; VAL: 'WinAnsiEncoding')
                         );

  // FixedWidth defination
  FIXED_WIDTH_W_ARRAY: array[32..255] of Integer = (
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600);

  FIXED_WIDTH_INT_TABLE: array[0..1] of TPDF_INT_TBL =(
                       (KEY: 'FirstChar'; VAL: 32),
                       (KEY: 'LastChar'; VAL: 255)
                         );

  FIXED_WIDTH_DISC_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'FontDescriptor'),
                         (KEY: 'FontName'; VAL: 'Type1'),
                         (KEY: 'Encoding'; VAL: 'WinAnsiEncoding')
                         );

  FIXED_WIDTH_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 833),
                         (KEY: 'CapHeight'; VAL: 833),
                         (KEY: 'Descent'; VAL: -300),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET + PDF_FONT_FIXED_WIDTH),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 600));

  FIXED_WIDTH_BBOX: array[0..3] of Integer = (-103,-300,836,833);

  // FixedWidth-Bold defination

  FIXED_WIDTH_BOLD_W_ARRAY: array[32..255] of Integer = (
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600);

  FIXED_WIDTH_BOLD_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 833),
                         (KEY: 'CapHeight'; VAL: 833),
                         (KEY: 'Descent'; VAL: -300),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_FOURCE_BOLD + PDF_FONT_FIXED_WIDTH),
                         (KEY: 'ItalicAngle'; VAL: 0),
                         (KEY: 'StemV'; VAL: 156),
                         (KEY: 'MissingWidth'; VAL: 600));

  FIXED_WIDTH_BOLD_BBOX: array[0..3] of Integer = (-46,-300,702,833);

  // FixedWidth-Italic defination

  FIXED_WIDTH_ITALIC_W_ARRAY: array[32..255] of Integer = (
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600);

  FIXED_WIDTH_ITALIC_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 833),
                         (KEY: 'CapHeight'; VAL: 833),
                         (KEY: 'Descent'; VAL: -300),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_FIXED_WIDTH),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 600));

  FIXED_WIDTH_ITALIC_BBOX: array[0..3] of Integer = (-67,-300,800,833);

  // FixedWidth-BoldItalic defination

  FIXED_WIDTH_BOLDITALIC_W_ARRAY: array[32..255] of Integer = (
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,600,
    600,600);

  FIXED_WIDTH_BOLDITALIC_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 833),
                         (KEY: 'CapHeight'; VAL: 833),
                         (KEY: 'Descent'; VAL: -300),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                             PDF_FONT_FIXED_WIDTH + PDF_FONT_FOURCE_BOLD),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 156),
                         (KEY: 'MissingWidth'; VAL: 600));

  FIXED_WIDTH_BOLDITALIC_BBOX: array[0..3] of Integer = (-103,-300,836,833);

  // Arial definition

  ARIAL_W_ARRAY: array[32..255] of Integer = (
    278,278,355,556,556,889,667,191,333,333,389,584,278,333,
    278,278,556,556,556,556,556,556,556,556,556,556,278,278,584,584,
    584,556,1015,667,667,722,722,667,611,778,722,278,500,667,556,833,
    722,778,667,778,722,667,611,722,667,944,667,667,611,278,278,278,
    469,556,333,556,556,500,556,556,278,556,556,222,222,500,222,833,
    556,556,556,556,333,500,278,556,500,722,500,500,500,334,260,334,
    584,0,556,0,222,556,333,1000,556,556,333,1000,667,333,1000,0,
    611,0,0,222,222,333,333,350,556,1000,333,1000,500,333,944,0,
    500,667,0,333,556,556,556,556,260,556,333,737,370,556,584,0,
    737,333,400,584,333,333,333,556,537,278,333,333,365,556,834,834,
    834,611,667,667,667,667,667,667,1000,722,667,667,667,667,278,278,
    278,278,722,722,778,778,778,778,778,584,778,722,722,722,722,667,
    667,611,556,556,556,556,556,556,889,500,556,556,556,556,278,278,
    278,278,556,556,556,556,556,556,556,584,611,556,556,556,556,500,
    556,500);


  ARIAL_INT_TABLE: array[0..1] of TPDF_INT_TBL = (
                       (KEY: 'FirstChar'; VAL: 32),
                       (KEY: 'LastChar'; VAL: 255)
                       );

  ARIAL_DISC_STR_TABLE: array[0..2] of TPDF_STR_TBL = (
                         (KEY: 'Type'; VAL: 'FontDescriptor'),
                         (KEY: 'FontName'; VAL: 'Type1'),
                         (KEY: 'Encoding'; VAL: 'WinAnsiEncoding')
                         );

  ARIAL_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL = (
                         (KEY: 'Ascent'; VAL: 905),
                         (KEY: 'CapHeight'; VAL: 905),
                         (KEY: 'Descent'; VAL: -212),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET),
                         (KEY: 'ItalicAngle'; VAL: 0),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 750)
                         );

  ARIAL_BBOX: array[0..3] of Integer = (-166,-225,1000,931);

  // Arial-Bold definition

  ARIAL_BOLD_W_ARRAY: array[32..255] of Integer = (
    278,333,474,556,556,889,722,238,333,333,389,584,278,333,
    278,278,556,556,556,556,556,556,556,556,556,556,333,333,584,584,
    584,611,975,722,722,722,722,667,611,778,722,278,556,722,611,833,
    722,778,667,778,722,667,611,722,667,944,667,667,611,333,278,333,
    584,556,333,556,611,556,611,556,333,611,611,278,278,556,278,889,
    611,611,611,611,389,556,333,611,556,778,556,556,500,389,280,389,
    584,0,556,0,278,556,500,1000,556,556,333,1000,667,333,1000,0,
    611,0,0,278,278,500,500,350,556,1000,333,1000,556,333,944,0,
    500,667,0,333,556,556,556,556,280,556,333,737,370,556,584,0,
    737,333,400,584,333,333,333,611,556,278,333,333,365,556,834,834,
    834,611,722,722,722,722,722,722,1000,722,667,667,667,667,278,278,
    278,278,722,722,778,778,778,778,778,584,778,722,722,722,722,667,
    667,611,556,556,556,556,556,556,889,556,556,556,556,556,278,278,
    278,278,611,611,611,611,611,611,611,584,611,611,611,611,611,556,
    611,556);

  ARIAL_BOLD_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 905),
                         (KEY: 'CapHeight'; VAL: 905),
                         (KEY: 'Descent'; VAL: -212),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_FOURCE_BOLD),
                         (KEY: 'ItalicAngle'; VAL: 0),
                         (KEY: 'StemV'; VAL: 156),
                         (KEY: 'MissingWidth'; VAL: 750)
                         );

  ARIAL_BOLD_BBOX: array[0..3] of Integer = (-170,-228,1003,962);

  // Arial-Italic definition

  ARIAL_ITALIC_W_ARRAY: array[32..255] of Integer = (
    278,278,355,556,556,889,667,191,333,333,389,584,278,333,
    278,278,556,556,556,556,556,556,556,556,556,556,278,278,584,584,
    584,556,1015,667,667,722,722,667,611,778,722,278,500,667,556,833,
    722,778,667,778,722,667,611,722,667,944,667,667,611,278,278,278,
    469,556,333,556,556,500,556,556,278,556,556,222,222,500,222,833,
    556,556,556,556,333,500,278,556,500,722,500,500,500,334,260,334,
    584,0,556,0,222,556,333,1000,556,556,333,1000,667,333,1000,0,
    611,0,0,222,222,333,333,350,556,1000,333,1000,500,333,944,0,
    500,667,0,333,556,556,556,556,260,556,333,737,370,556,584,0,
    737,333,400,584,333,333,333,556,537,278,333,333,365,556,834,834,
    834,611,667,667,667,667,667,667,1000,722,667,667,667,667,278,278,
    278,278,722,722,778,778,778,778,778,584,778,722,722,722,722,667,
    667,611,556,556,556,556,556,556,889,500,556,556,556,556,278,278,
    278,278,556,556,556,556,556,556,556,584,611,556,556,556,556,500,
    556,500);

  ARIAL_ITALIC_DISC_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'FontDescriptor'),
                         (KEY: 'FontName'; VAL: 'Type1'),
                         (KEY: 'Encoding'; VAL: 'WinAnsiEncoding')
                         );

  ARIAL_ITALIC_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 905),
                         (KEY: 'CapHeight'; VAL: 905),
                         (KEY: 'Descent'; VAL: -212),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 750)
                         );

  ARIAL_ITALIC_BBOX: array[0..3] of Integer = (-170,-225,1116,931);

  // Arial-BoldItalic definition

  ARIAL_BOLDITALIC_W_ARRAY: array[32..255] of Integer = (
    278,333,474,556,556,889,722,238,333,333,389,584,278,333,
    278,278,556,556,556,556,556,556,556,556,556,556,333,333,584,584,
    584,611,975,722,722,722,722,667,611,778,722,278,556,722,611,833,
    722,778,667,778,722,667,611,722,667,944,667,667,611,333,278,333,
    584,556,333,556,611,556,611,556,333,611,611,278,278,556,278,889,
    611,611,611,611,389,556,333,611,556,778,556,556,500,389,280,389,
    584,0,556,0,278,556,500,1000,556,556,333,1000,667,333,1000,0,
    611,0,0,278,278,500,500,350,556,1000,333,1000,556,333,944,0,
    500,667,0,333,556,556,556,556,280,556,333,737,370,556,584,0,
    737,333,400,584,333,333,333,611,556,278,333,333,365,556,834,834,
    834,611,722,722,722,722,722,722,1000,722,667,667,667,667,278,278,
    278,278,722,722,778,778,778,778,778,584,778,722,722,722,722,667,
    667,611,556,556,556,556,556,556,889,556,556,556,556,556,278,278,
    278,278,611,611,611,611,611,611,611,584,611,611,611,611,611,556,
    611,556);

  ARIAL_BOLDITALIC_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 905),
                         (KEY: 'CapHeight'; VAL: 905),
                         (KEY: 'Descent'; VAL: -212),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_FOURCE_BOLD),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 156),
                         (KEY: 'MissingWidth'; VAL: 750));

  ARIAL_BOLDITALIC_BBOX: array[0..3] of Integer = (-174,-228,1114,962);

  // Times definition

  TIMES_ROMAN_W_ARRAY: array[32..255] of Integer = (
    250,333,408,500,500,833,778,180,333,333,500,564,250,333,
    250,278,500,500,500,500,500,500,500,500,500,500,278,278,564,564,
    564,444,921,722,667,667,722,611,556,722,722,333,389,722,611,889,
    722,722,556,722,667,556,611,722,722,944,722,722,611,333,278,333,
    469,500,333,444,500,444,500,444,333,500,500,278,278,500,278,778,
    500,500,500,500,333,389,278,500,500,722,500,500,444,480,200,480,
    541,0,500,0,333,500,444,1000,500,500,333,1000,556,333,889,0,
    611,0,0,333,333,444,444,350,500,1000,333,980,389,333,722,0,
    444,722,0,333,500,500,500,500,200,500,333,760,276,500,564,0,
    760,333,400,564,300,300,333,500,453,250,333,300,310,500,750,750,
    750,444,722,722,722,722,722,722,889,667,611,611,611,611,333,333,
    333,333,722,722,722,722,722,722,722,564,722,722,722,722,722,722,
    556,500,444,444,444,444,444,444,667,444,444,444,444,444,278,278,
    278,278,500,500,500,500,500,500,500,564,500,500,500,500,500,500,
    500,500);

  TIMES_INT_TABLE: array[0..1] of TPDF_INT_TBL = (
                       (KEY: 'FirstChar'; VAL: 32),
                       (KEY: 'LastChar'; VAL: 255)
                       );

  TIMES_DISC_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'FontDescriptor'),
                         (KEY: 'FontName'; VAL: 'Type1'),
                         (KEY: 'Encoding'; VAL: 'WinAnsiEncoding')
                         );

  TIMES_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 891),
                         (KEY: 'CapHeight'; VAL: 891),
                         (KEY: 'Descent'; VAL: -216),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_SERIF),
                         (KEY: 'ItalicAngle'; VAL: 0),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 778)
                         );

  TIMES_BBOX: array[0..3] of Integer = (-168,-218,1000,898);

  // Times-Italic definition

  TIMES_ITALIC_W_ARRAY: array[32..255] of Integer = (
    250,333,420,500,500,833,778,214,333,333,500,675,250,333,
    250,278,500,500,500,500,500,500,500,500,500,500,333,333,675,675,
    675,500,920,611,611,667,722,611,611,722,722,333,444,667,556,833,
    667,722,611,722,611,500,556,722,611,833,611,556,556,389,278,389,
    422,500,333,500,500,444,500,444,278,500,500,278,278,444,278,722,
    500,500,500,500,389,389,278,500,444,667,444,444,389,400,275,400,
    541,0,500,0,333,500,556,889,500,500,333,1000,500,333,944,0,
    556,0,0,333,333,556,556,350,500,889,333,980,389,333,667,0,
    389,556,0,389,500,500,500,500,275,500,333,760,276,500,675,0,
    760,333,400,675,300,300,333,500,523,250,333,300,310,500,750,750,
    750,500,611,611,611,611,611,611,889,667,611,611,611,611,333,333,
    333,333,722,667,722,722,722,722,722,675,722,722,722,722,722,556,
    611,500,500,500,500,500,500,500,667,444,444,444,444,444,278,278,
    278,278,500,500,500,500,500,500,500,675,500,500,500,500,500,444,
    500,444);

  TIMES_ITALIC_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 891),
                         (KEY: 'CapHeight'; VAL: 891),
                         (KEY: 'Descent'; VAL: -216),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_SERIF + PDF_FONT_ITALIC),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 778));

  TIMES_ITALIC_BBOX: array[0..3] of Integer = (-169,-217,1010,883);

  // Times-BOLD definition

  TIMES_BOLD_W_ARRAY: array[32..255] of Integer = (
    250,333,555,500,500,1000,833,278,333,333,500,570,250,333,
    250,278,500,500,500,500,500,500,500,500,500,500,333,333,570,570,
    570,500,930,722,667,722,722,667,611,778,778,389,500,778,667,944,
    722,778,611,778,722,556,667,722,722,1000,722,722,667,333,278,333,
    581,500,333,500,556,444,556,444,333,500,556,278,333,556,278,833,
    556,500,556,556,444,389,333,556,500,722,500,500,444,394,220,394,
    520,0,500,0,333,500,500,1000,500,500,333,1000,556,333,1000,0,
    667,0,0,333,333,500,500,350,500,1000,333,1000,389,333,722,0,
    444,722,0,333,500,500,500,500,220,500,333,747,300,500,570,0,
    747,333,400,570,300,300,333,556,540,250,333,300,330,500,750,750,
    750,500,722,722,722,722,722,722,1000,722,667,667,667,667,389,389,
    389,389,722,722,778,778,778,778,778,570,778,722,722,722,722,722,
    611,556,500,500,500,500,500,500,722,444,444,444,444,444,278,278,
    278,278,500,556,500,500,500,500,500,570,500,556,556,556,556,500,
    556,500);

  TIMES_BOLD_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 891),
                         (KEY: 'CapHeight'; VAL: 891),
                         (KEY: 'Descent'; VAL: -216),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_SERIF + PDF_FONT_FOURCE_BOLD),
                         (KEY: 'ItalicAngle'; VAL: 0),
                         (KEY: 'StemV'; VAL: 156),
                         (KEY: 'MissingWidth'; VAL: 778));

  TIMES_BOLD_BBOX: array[0..3] of Integer = (-168,-218,1000,935);

  // Times-BoldItalic definition

  TIMES_BOLDITALIC_W_ARRAY: array[32..255] of Integer = (
    250,389,555,500,500,833,778,278,333,333,500,570,250,333,
    250,278,500,500,500,500,500,500,500,500,500,500,333,333,570,570,
    570,500,832,667,667,667,722,667,667,722,778,389,500,667,611,889,
    722,722,611,722,667,556,611,722,667,889,667,611,611,333,278,333,
    570,500,333,500,500,444,500,444,333,500,556,278,278,500,278,778,
    556,500,500,500,389,389,278,556,444,667,500,444,389,348,220,348,
    570,0,500,0,333,500,500,1000,500,500,333,1000,556,333,944,0,
    611,0,0,333,333,500,500,350,500,1000,333,1000,389,333,722,0,
    389,611,0,389,500,500,500,500,220,500,333,747,266,500,606,0,
    747,333,400,570,300,300,333,576,500,250,333,300,300,500,750,750,
    750,500,667,667,667,667,667,667,944,667,667,667,667,667,389,389,
    389,389,722,722,722,722,722,722,722,570,722,722,722,722,722,611,
    611,500,500,500,500,500,500,500,722,444,444,444,444,444,278,278,
    278,278,500,556,500,500,500,500,500,570,500,556,556,556,556,444,
    500,444);

  TIMES_BOLDITALIC_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 891),
                         (KEY: 'CapHeight'; VAL: 891),
                         (KEY: 'Descent'; VAL: -216),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET +
                           PDF_FONT_SERIF + PDF_FONT_FOURCE_BOLD),
                         (KEY: 'ItalicAngle'; VAL: -15),
                         (KEY: 'StemV'; VAL: 156),
                         (KEY: 'MissingWidth'; VAL: 778));

  TIMES_BOLDITALIC_BBOX: array[0..3] of Integer = (-200,-218,996,921);

  SCRIPT_W_ARRAY: array[32..255] of Integer = (
    323,202,323,424,404,485,525,202,283,283,323,525,202,525,202,444,
    404,404,404,404,404,404,404,404,404,404,202,202,485,525,485,364,
    545,404,465,404,465,404,404,465,485,343,303,485,384,667,485,424,
    505,444,505,404,384,485,465,566,485,465,424,283,283,283,444,323,
    222,323,283,222,323,202,162,303,303,141,141,283,162,505,364,283,
    303,303,263,222,182,303,303,424,323,303,283,283,162,283,485,202,
    202,202,202,202,202,202,202,202,202,202,202,202,202,202,202,202,
    202,222,202,202,202,202,202,202,202,202,202,202,202,202,202,202,
    202,202,222,384,283,465,162,283,404,283,323,404,404,404,283,404,
    404,404,404,404,404,384,424,404,404,404,283,404,404,404,404,364,
    404,404,404,404,404,404,566,404,404,404,404,404,343,343,343,343,
    465,485,424,424,424,424,424,323,404,485,485,485,485,465,444,444,
    323,323,323,323,323,323,384,222,202,202,202,202,141,141,141,141,
    283,364,283,283,283,283,283,404,283,303,303,303,303,303,384,303
    );

  SCRIPT_INT_TABLE: array[0..1] of TPDF_INT_TBL = (
                       (KEY: 'FirstChar'; VAL: 32),
                       (KEY: 'LastChar'; VAL: 255)
                         );

  SCRIPT_DISC_STR_TABLE: array[0..2] of TPDF_STR_TBL =(
                         (KEY: 'Type'; VAL: 'FontDescriptor'),
                         (KEY: 'FontName'; VAL: 'Type1'),
                         (KEY: 'Encoding'; VAL: 'WinAnsiEncoding')
                         );

  SCRIPT_DISC_INT_TABLE: array[0..6] of TPDF_INT_TBL =(
                         (KEY: 'Ascent'; VAL: 758),
                         (KEY: 'CapHeight'; VAL: 758),
                         (KEY: 'Descent'; VAL: -363),
                         (KEY: 'Flags'; VAL: PDF_FONT_STD_CHARSET + PDF_FONT_ITALIC),
                         (KEY: 'ItalicAngle'; VAL: 0),
                         (KEY: 'StemV'; VAL: 78),
                         (KEY: 'MissingWidth'; VAL: 202));

  SCRIPT_BBOX: array[0..3] of Integer = (-184,-363,505,758);

type
  TPdfType1Font = class(TPdfFont)
  private
    FFirstChar: Byte;
    FLastChar: Byte;
    FArray: array[0..255] of Word;
  public
    procedure SetData(Value: TPdfDictionary); override;
    function GetCharWidth(AText: string; APos: integer): integer; override;
  end;

  TPdfFixedWidth = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfFixedWidthBold = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfFixedWidthItalic = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfFixedWidthBoldItalic = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfArial = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfArialBold = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfArialItalic = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfArialBoldItalic = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfTimesRoman = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfTimesBold = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfTimesItalic = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfTimesBoldItalic = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

  TPdfScript = class(TPdfType1Font)
  public
    constructor Create(AXref: TPdfXref; AName: string); override;
  end;

implementation

{ TPdfType1Font }
function TPdfType1Font.GetCharWidth(AText: string; APos: integer): integer;
begin
  result := FArray[ord(AText[APos])];
end;

procedure TPdfType1Font.SetData(Value: TPdfDictionary);
var
  i: integer;
  DefaultWidth: Word;
  Widths: TPdfArray;
begin
  inherited SetData(Value);

  // initialize char widths array by default value (if missing width parameter
  // is defined, use it as default value.)
  if Data.PdfNumberByName('MissingWidth') <> nil then
    DefaultWidth := Data.PdfNumberByName('MissingWidth').Value
  else
    DefaultWidth := 0;
  for i := 0 to 255 do
    FArray[i] := DefaultWidth;

  FFirstChar := Data.PdfNumberByName('FirstChar').Value;
  FLastChar := Data.PdfNumberByName('LastChar').Value;

  // fill width array with "Widths" table values.
  Widths := Data.PdfArrayByName('Widths');
  for i := 0 to Widths.ItemCount - 1 do
    FArray[i + FFirstChar] := TPdfNumber(Widths.Items[i]).Value;
end;

{ FixedWidth }
constructor TPdfFixedWidth.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);

  // make instance of TPdfDictionary and register to Xref table.
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  // adding element to the dictionary.
  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, FIXED_WIDTH_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Courier'));

  // create "Width" table of the font.
  FWidths := TPdfArray.CreateNumArray(AXref, FIXED_WIDTH_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ FixedWidthBold }
constructor TPdfFixedWidthBold.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, FIXED_WIDTH_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Courier-Bold'));

  FWidths := TPdfArray.CreateNumArray(AXref, FIXED_WIDTH_BOLD_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ FixedWidthItalic }
constructor TPdfFixedWidthItalic.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, FIXED_WIDTH_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Courier-Oblique'));

  FWidths := TPdfArray.CreateNumArray(AXref, FIXED_WIDTH_ITALIC_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ FixedWidthBoldItalic }
constructor TPdfFixedWidthBoldItalic.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, FIXED_WIDTH_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Courier-BoldOblique'));

  FWidths := TPdfArray.CreateNumArray(AXref, FIXED_WIDTH_BOLDITALIC_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ Arial }
constructor TPdfArial.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, ARIAL_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Helvetica'));

  FWidths := TPdfArray.CreateNumArray(AXref, ARIAL_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ Arial-Bold }
constructor TPdfArialBold.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, ARIAL_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Helvetica-Bold'));

  FWidths := TPdfArray.CreateNumArray(AXref, ARIAL_BOLD_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ Arial-Italic }
constructor TPdfArialItalic.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, ARIAL_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Helvetica-Oblique'));

  FWidths := TPdfArray.CreateNumArray(AXref, ARIAL_ITALIC_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ Arial-BoldItalic }
constructor TPdfArialBoldItalic.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, ARIAL_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Helvetica-BoldOblique'));

  FWidths := TPdfArray.CreateNumArray(AXref, ARIAL_BOLDITALIC_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ TPdfTimesRoman }
constructor TPdfTimesRoman.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, TIMES_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Times-Roman'));

  FWidths := TPdfArray.CreateNumArray(AXref, TIMES_ROMAN_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ TPdfTimesBold }
constructor TPdfTimesBold.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, TIMES_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Times-Bold'));

  FWidths := TPdfArray.CreateNumArray(AXref, TIMES_BOLD_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ TPdfTimesItalic }
constructor TPdfTimesItalic.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, TIMES_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Times-Italic'));

  FWidths := TPdfArray.CreateNumArray(AXref, TIMES_ITALIC_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ TPdfTimesBoldItalic }
constructor TPdfTimesBoldItalic.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, TIMES_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Times-BoldItalic'));

  FWidths := TPdfArray.CreateNumArray(AXref, TIMES_BOLDITALIC_W_ARRAY);
  FFont.AddInternalItem('Widths', FWidths);

  SetData(FFont);
end;

{ TPdfScript }
constructor TPdfScript.Create(AXref: TPdfXref; AName: string);
var
  FWidths: TPdfArray;
  FFontDescriptor: TPdfDictionary;
  FFont: TPdfDictionary;
begin
  inherited Create(AXref, AName);
  FFont := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFont);

  AddStrElements(FFont, TYPE1_FONT_STR_TABLE);
  AddIntElements(FFont, SCRIPT_INT_TABLE);
  FFont.AddItem('BaseFont', TPdfName.CreateName('Script'));

  FFontDescriptor := TPdfDictionary.CreateDictionary(AXref);
  AXref.AddObject(FFontDescriptor);

  AddStrElements(FFontDescriptor, SCRIPT_DISC_STR_TABLE);
  AddIntElements(FFontDescriptor, SCRIPT_DISC_INT_TABLE);
  FFontDescriptor.AddItem('FontBBox',
             TPdfArray.CreateNumArray(AXref, SCRIPT_BBOX));
  FFont.AddItem('FontDescriptor', FFontDescriptor);

  FWidths := TPdfArray.CreateNumArray(AXref, SCRIPT_W_ARRAY);
  FFont.AddItem('Widths', FWidths);

  SetData(FFont);
end;

initialization

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

finalization

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

end.
