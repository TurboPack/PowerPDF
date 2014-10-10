{*
 * << P o w e r P d f >> -- PdfJpCMap.pas
 *
 * << conversion routines from japanese charactor code to CID >>
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
 * Create 2001.04.16
 *
 *}
unit PdfJpCMap;

interface

uses
  SysUtils;

type
  {*
   * PdfCidRange
   *}
  TPdfCidRange = record
    CFrom, CTo: integer;
    CRange: integer;
  end;

const

  CMAP_90MS_RKSJ_H: array[0..170] of TPdfCidRange = (
                     (CFrom: $20; CTo: $7d; CRange: 231),
                     (CFrom: $7e; CTo: $7e; CRange: 631),
                     (CFrom: $8140; CTo: $817e; CRange:  633),
                     (CFrom: $8180; CTo: $81ac; CRange:  696),
                     (CFrom: $81b8; CTo: $81bf; CRange:  741),
                     (CFrom: $81c8; CTo: $81ce; CRange:  749),
                     (CFrom: $81da; CTo: $81e8; CRange:  756),
                     (CFrom: $81f0; CTo: $81f7; CRange:  771),
                     (CFrom: $81fc; CTo: $81fc; CRange:  779),
                     (CFrom: $824f; CTo: $8258; CRange:  780),
                     (CFrom: $8260; CTo: $8279; CRange:  790),
                     (CFrom: $8281; CTo: $829a; CRange:  816),
                     (CFrom: $829f; CTo: $82f1; CRange:  842),
                     (CFrom: $8340; CTo: $837e; CRange:  925),
                     (CFrom: $8380; CTo: $8396; CRange:  988),
                     (CFrom: $839f; CTo: $83b6; CRange: 1011),
                     (CFrom: $83bf; CTo: $83d6; CRange: 1035),
                     (CFrom: $8440; CTo: $8460; CRange: 1059),
                     (CFrom: $8470; CTo: $847e; CRange: 1092),
                     (CFrom: $8480; CTo: $8491; CRange: 1107),
                     (CFrom: $849f; CTo: $849f; CRange: 7479),
                     (CFrom: $84a0; CTo: $84a0; CRange: 7481),
                     (CFrom: $84a1; CTo: $84a1; CRange: 7491),
                     (CFrom: $84a2; CTo: $84a2; CRange: 7495),
                     (CFrom: $84a3; CTo: $84a3; CRange: 7503),
                     (CFrom: $84a4; CTo: $84a4; CRange: 7499),
                     (CFrom: $84a5; CTo: $84a5; CRange: 7507),
                     (CFrom: $84a6; CTo: $84a6; CRange: 7523),
                     (CFrom: $84a7; CTo: $84a7; CRange: 7515),
                     (CFrom: $84a8; CTo: $84a8; CRange: 7531),
                     (CFrom: $84a9; CTo: $84a9; CRange: 7539),
                     (CFrom: $84aa; CTo: $84aa; CRange: 7480),
                     (CFrom: $84ab; CTo: $84ab; CRange: 7482),
                     (CFrom: $84ac; CTo: $84ac; CRange: 7494),
                     (CFrom: $84ad; CTo: $84ad; CRange: 7498),
                     (CFrom: $84ae; CTo: $84ae; CRange: 7506),
                     (CFrom: $84af; CTo: $84af; CRange: 7502),
                     (CFrom: $84b0; CTo: $84b0; CRange: 7514),
                     (CFrom: $84b1; CTo: $84b1; CRange: 7530),
                     (CFrom: $84b2; CTo: $84b2; CRange: 7522),
                     (CFrom: $84b3; CTo: $84b3; CRange: 7538),
                     (CFrom: $84b4; CTo: $84b4; CRange: 7554),
                     (CFrom: $84b5; CTo: $84b5; CRange: 7511),
                     (CFrom: $84b6; CTo: $84b6; CRange: 7526),
                     (CFrom: $84b7; CTo: $84b7; CRange: 7519),
                     (CFrom: $84b8; CTo: $84b8; CRange: 7534),
                     (CFrom: $84b9; CTo: $84b9; CRange: 7542),
                     (CFrom: $84ba; CTo: $84ba; CRange: 7508),
                     (CFrom: $84bb; CTo: $84bb; CRange: 7527),
                     (CFrom: $84bc; CTo: $84bc; CRange: 7516),
                     (CFrom: $84bd; CTo: $84bd; CRange: 7535),
                     (CFrom: $84be; CTo: $84be; CRange: 7545),
                     (CFrom: $8740; CTo: $875d; CRange: 7555),
                     (CFrom: $875f; CTo: $8760; CRange: 7585),
                     (CFrom: $8761; CTo: $8761; CRange: 8038),
                     (CFrom: $8762; CTo: $8762; CRange: 7588),
                     (CFrom: $8763; CTo: $8763; CRange: 8040),
                     (CFrom: $8764; CTo: $8764; CRange: 7590),
                     (CFrom: $8765; CTo: $8765; CRange: 8042),
                     (CFrom: $8766; CTo: $8767; CRange: 7592),
                     (CFrom: $8768; CTo: $8768; CRange: 8044),
                     (CFrom: $8769; CTo: $876a; CRange: 7595),
                     (CFrom: $876b; CTo: $876b; CRange: 8043),
                     (CFrom: $876c; CTo: $876d; CRange: 7598),
                     (CFrom: $876e; CTo: $876e; CRange: 8047),
                     (CFrom: $876f; CTo: $8775; CRange: 7601),
                     (CFrom: $877e; CTo: $877e; CRange: 8323),
                     (CFrom: $8780; CTo: $8783; CRange: 7608),
                     (CFrom: $8784; CTo: $8784; CRange: 8055),
                     (CFrom: $8785; CTo: $878f; CRange: 7613),
                     (CFrom: $8790; CTo: $8790; CRange:  762),
                     (CFrom: $8791; CTo: $8791; CRange:  761),
                     (CFrom: $8792; CTo: $8792; CRange:  769),
                     (CFrom: $8793; CTo: $8799; CRange: 7624),
                     (CFrom: $879a; CTo: $879a; CRange:  768),
                     (CFrom: $879b; CTo: $879c; CRange: 7631),
                     (CFrom: $889f; CTo: $88fc; CRange: 1125),
                     (CFrom: $8940; CTo: $897e; CRange: 1219),
                     (CFrom: $8980; CTo: $89fc; CRange: 1282),
                     (CFrom: $8a40; CTo: $8a7e; CRange: 1407),
                     (CFrom: $8a80; CTo: $8afc; CRange: 1470),
                     (CFrom: $8b40; CTo: $8b7e; CRange: 1595),
                     (CFrom: $8b80; CTo: $8bfc; CRange: 1658),
                     (CFrom: $8c40; CTo: $8c7e; CRange: 1783),
                     (CFrom: $8c80; CTo: $8cfc; CRange: 1846),
                     (CFrom: $8d40; CTo: $8d7e; CRange: 1971),
                     (CFrom: $8d80; CTo: $8dfc; CRange: 2034),
                     (CFrom: $8e40; CTo: $8e7e; CRange: 2159),
                     (CFrom: $8e80; CTo: $8efc; CRange: 2222),
                     (CFrom: $8f40; CTo: $8f7e; CRange: 2347),
                     (CFrom: $8f80; CTo: $8ffc; CRange: 2410),
                     (CFrom: $9040; CTo: $907e; CRange: 2535),
                     (CFrom: $9080; CTo: $90fc; CRange: 2598),
                     (CFrom: $9140; CTo: $917e; CRange: 2723),
                     (CFrom: $9180; CTo: $91fc; CRange: 2786),
                     (CFrom: $9240; CTo: $927e; CRange: 2911),
                     (CFrom: $9280; CTo: $92fc; CRange: 2974),
                     (CFrom: $9340; CTo: $937e; CRange: 3099),
                     (CFrom: $9380; CTo: $93fc; CRange: 3162),
                     (CFrom: $9440; CTo: $947e; CRange: 3287),
                     (CFrom: $9480; CTo: $94fc; CRange: 3350),
                     (CFrom: $9540; CTo: $957e; CRange: 3475),
                     (CFrom: $9580; CTo: $95fc; CRange: 3538),
                     (CFrom: $9640; CTo: $967e; CRange: 3663),
                     (CFrom: $9680; CTo: $96fc; CRange: 3726),
                     (CFrom: $9740; CTo: $977e; CRange: 3851),
                     (CFrom: $9780; CTo: $97fc; CRange: 3914),
                     (CFrom: $9840; CTo: $9872; CRange: 4039),
                     (CFrom: $989f; CTo: $98fc; CRange: 4090),
                     (CFrom: $9940; CTo: $997e; CRange: 4184),
                     (CFrom: $9980; CTo: $99fc; CRange: 4247),
                     (CFrom: $9a40; CTo: $9a7e; CRange: 4372),
                     (CFrom: $9a80; CTo: $9afc; CRange: 4435),
                     (CFrom: $9b40; CTo: $9b7e; CRange: 4560),
                     (CFrom: $9b80; CTo: $9bfc; CRange: 4623),
                     (CFrom: $9c40; CTo: $9c7e; CRange: 4748),
                     (CFrom: $9c80; CTo: $9cfc; CRange: 4811),
                     (CFrom: $9d40; CTo: $9d7e; CRange: 4936),
                     (CFrom: $9d80; CTo: $9dfc; CRange: 4999),
                     (CFrom: $9e40; CTo: $9e7e; CRange: 5124),
                     (CFrom: $9e80; CTo: $9efc; CRange: 5187),
                     (CFrom: $9f40; CTo: $9f7e; CRange: 5312),
                     (CFrom: $9f80; CTo: $9ffc; CRange: 5375),
                     (CFrom: $a0; CTo: $df; CRange:      326),
                     (CFrom: $e040; CTo: $e07e; CRange: 5500),
                     (CFrom: $e080; CTo: $e0fc; CRange: 5563),
                     (CFrom: $e140; CTo: $e17e; CRange: 5688),
                     (CFrom: $e180; CTo: $e1fc; CRange: 5751),
                     (CFrom: $e240; CTo: $e27e; CRange: 5876),
                     (CFrom: $e280; CTo: $e2fc; CRange: 5939),
                     (CFrom: $e340; CTo: $e37e; CRange: 6064),
                     (CFrom: $e380; CTo: $e3fc; CRange: 6127),
                     (CFrom: $e440; CTo: $e47e; CRange: 6252),
                     (CFrom: $e480; CTo: $e4fc; CRange: 6315),
                     (CFrom: $e540; CTo: $e57e; CRange: 6440),
                     (CFrom: $e580; CTo: $e5fc; CRange: 6503),
                     (CFrom: $e640; CTo: $e67e; CRange: 6628),
                     (CFrom: $e680; CTo: $e6fc; CRange: 6691),
                     (CFrom: $e740; CTo: $e77e; CRange: 6816),
                     (CFrom: $e780; CTo: $e7fc; CRange: 6879),
                     (CFrom: $e840; CTo: $e87e; CRange: 7004),
                     (CFrom: $e880; CTo: $e8fc; CRange: 7067),
                     (CFrom: $e940; CTo: $e97e; CRange: 7192),
                     (CFrom: $e980; CTo: $e9fc; CRange: 7255),
                     (CFrom: $ea40; CTo: $ea7e; CRange: 7380),
                     (CFrom: $ea80; CTo: $eaa2; CRange: 7443),
                     (CFrom: $eaa3; CTo: $eaa4; CRange: 8284),
                     (CFrom: $ed40; CTo: $ed7e; CRange: 8359),
                     (CFrom: $ed80; CTo: $edb3; CRange: 8422),
                     (CFrom: $edb4; CTo: $edb4; CRange: 1993),
                     (CFrom: $edb5; CTo: $edfc; CRange: 8474),
                     (CFrom: $ee40; CTo: $ee7e; CRange: 8546),
                     (CFrom: $ee80; CTo: $eeec; CRange: 8609),
                     (CFrom: $eeef; CTo: $eef8; CRange: 8092),
                     (CFrom: $eef9; CTo: $eef9; CRange:  751),
                     (CFrom: $eefa; CTo: $eefc; CRange: 8005),
                     (CFrom: $fa40; CTo: $fa49; CRange: 8092),
                     (CFrom: $fa4a; CTo: $fa53; CRange: 7575),
                     (CFrom: $fa54; CTo: $fa54; CRange:  751),
                     (CFrom: $fa55; CTo: $fa57; CRange: 8005),
                     (CFrom: $fa58; CTo: $fa58; CRange: 7618),
                     (CFrom: $fa59; CTo: $fa59; CRange: 7610),
                     (CFrom: $fa5a; CTo: $fa5a; CRange: 8055),
                     (CFrom: $fa5b; CTo: $fa5b; CRange:  768),
                     (CFrom: $fa5c; CTo: $fa7e; CRange: 8359),
                     (CFrom: $fa80; CTo: $facf; CRange: 8394),
                     (CFrom: $fad0; CTo: $fad0; CRange: 1993),
                     (CFrom: $fad1; CTo: $fafc; CRange: 8474),
                     (CFrom: $fb40; CTo: $fb7e; CRange: 8518),
                     (CFrom: $fb80; CTo: $fbfc; CRange: 8581),
                     (CFrom: $fc40; CTo: $fc4b; CRange: 8706));

  CMAP_90MSP_RKSJ_H: array[0..170] of TPdfCidRange = (
                     (CFrom: $20; CTo: $7d; CRange: 1),
                     (CFrom: $7e; CTo: $7e; CRange: 631),
                     (CFrom: $8140; CTo: $817e; CRange:  633),
                     (CFrom: $8180; CTo: $81ac; CRange:  696),
                     (CFrom: $81b8; CTo: $81bf; CRange:  741),
                     (CFrom: $81c8; CTo: $81ce; CRange:  749),
                     (CFrom: $81da; CTo: $81e8; CRange:  756),
                     (CFrom: $81f0; CTo: $81f7; CRange:  771),
                     (CFrom: $81fc; CTo: $81fc; CRange:  779),
                     (CFrom: $824f; CTo: $8258; CRange:  780),
                     (CFrom: $8260; CTo: $8279; CRange:  790),
                     (CFrom: $8281; CTo: $829a; CRange:  816),
                     (CFrom: $829f; CTo: $82f1; CRange:  842),
                     (CFrom: $8340; CTo: $837e; CRange:  925),
                     (CFrom: $8380; CTo: $8396; CRange:  988),
                     (CFrom: $839f; CTo: $83b6; CRange: 1011),
                     (CFrom: $83bf; CTo: $83d6; CRange: 1035),
                     (CFrom: $8440; CTo: $8460; CRange: 1059),
                     (CFrom: $8470; CTo: $847e; CRange: 1092),
                     (CFrom: $8480; CTo: $8491; CRange: 1107),
                     (CFrom: $849f; CTo: $849f; CRange: 7479),
                     (CFrom: $84a0; CTo: $84a0; CRange: 7481),
                     (CFrom: $84a1; CTo: $84a1; CRange: 7491),
                     (CFrom: $84a2; CTo: $84a2; CRange: 7495),
                     (CFrom: $84a3; CTo: $84a3; CRange: 7503),
                     (CFrom: $84a4; CTo: $84a4; CRange: 7499),
                     (CFrom: $84a5; CTo: $84a5; CRange: 7507),
                     (CFrom: $84a6; CTo: $84a6; CRange: 7523),
                     (CFrom: $84a7; CTo: $84a7; CRange: 7515),
                     (CFrom: $84a8; CTo: $84a8; CRange: 7531),
                     (CFrom: $84a9; CTo: $84a9; CRange: 7539),
                     (CFrom: $84aa; CTo: $84aa; CRange: 7480),
                     (CFrom: $84ab; CTo: $84ab; CRange: 7482),
                     (CFrom: $84ac; CTo: $84ac; CRange: 7494),
                     (CFrom: $84ad; CTo: $84ad; CRange: 7498),
                     (CFrom: $84ae; CTo: $84ae; CRange: 7506),
                     (CFrom: $84af; CTo: $84af; CRange: 7502),
                     (CFrom: $84b0; CTo: $84b0; CRange: 7514),
                     (CFrom: $84b1; CTo: $84b1; CRange: 7530),
                     (CFrom: $84b2; CTo: $84b2; CRange: 7522),
                     (CFrom: $84b3; CTo: $84b3; CRange: 7538),
                     (CFrom: $84b4; CTo: $84b4; CRange: 7554),
                     (CFrom: $84b5; CTo: $84b5; CRange: 7511),
                     (CFrom: $84b6; CTo: $84b6; CRange: 7526),
                     (CFrom: $84b7; CTo: $84b7; CRange: 7519),
                     (CFrom: $84b8; CTo: $84b8; CRange: 7534),
                     (CFrom: $84b9; CTo: $84b9; CRange: 7542),
                     (CFrom: $84ba; CTo: $84ba; CRange: 7508),
                     (CFrom: $84bb; CTo: $84bb; CRange: 7527),
                     (CFrom: $84bc; CTo: $84bc; CRange: 7516),
                     (CFrom: $84bd; CTo: $84bd; CRange: 7535),
                     (CFrom: $84be; CTo: $84be; CRange: 7545),
                     (CFrom: $8740; CTo: $875d; CRange: 7555),
                     (CFrom: $875f; CTo: $8760; CRange: 7585),
                     (CFrom: $8761; CTo: $8761; CRange: 8038),
                     (CFrom: $8762; CTo: $8762; CRange: 7588),
                     (CFrom: $8763; CTo: $8763; CRange: 8040),
                     (CFrom: $8764; CTo: $8764; CRange: 7590),
                     (CFrom: $8765; CTo: $8765; CRange: 8042),
                     (CFrom: $8766; CTo: $8767; CRange: 7592),
                     (CFrom: $8768; CTo: $8768; CRange: 8044),
                     (CFrom: $8769; CTo: $876a; CRange: 7595),
                     (CFrom: $876b; CTo: $876b; CRange: 8043),
                     (CFrom: $876c; CTo: $876d; CRange: 7598),
                     (CFrom: $876e; CTo: $876e; CRange: 8047),
                     (CFrom: $876f; CTo: $8775; CRange: 7601),
                     (CFrom: $877e; CTo: $877e; CRange: 8323),
                     (CFrom: $8780; CTo: $8783; CRange: 7608),
                     (CFrom: $8784; CTo: $8784; CRange: 8055),
                     (CFrom: $8785; CTo: $878f; CRange: 7613),
                     (CFrom: $8790; CTo: $8790; CRange:  762),
                     (CFrom: $8791; CTo: $8791; CRange:  761),
                     (CFrom: $8792; CTo: $8792; CRange:  769),
                     (CFrom: $8793; CTo: $8799; CRange: 7624),
                     (CFrom: $879a; CTo: $879a; CRange:  768),
                     (CFrom: $879b; CTo: $879c; CRange: 7631),
                     (CFrom: $889f; CTo: $88fc; CRange: 1125),
                     (CFrom: $8940; CTo: $897e; CRange: 1219),
                     (CFrom: $8980; CTo: $89fc; CRange: 1282),
                     (CFrom: $8a40; CTo: $8a7e; CRange: 1407),
                     (CFrom: $8a80; CTo: $8afc; CRange: 1470),
                     (CFrom: $8b40; CTo: $8b7e; CRange: 1595),
                     (CFrom: $8b80; CTo: $8bfc; CRange: 1658),
                     (CFrom: $8c40; CTo: $8c7e; CRange: 1783),
                     (CFrom: $8c80; CTo: $8cfc; CRange: 1846),
                     (CFrom: $8d40; CTo: $8d7e; CRange: 1971),
                     (CFrom: $8d80; CTo: $8dfc; CRange: 2034),
                     (CFrom: $8e40; CTo: $8e7e; CRange: 2159),
                     (CFrom: $8e80; CTo: $8efc; CRange: 2222),
                     (CFrom: $8f40; CTo: $8f7e; CRange: 2347),
                     (CFrom: $8f80; CTo: $8ffc; CRange: 2410),
                     (CFrom: $9040; CTo: $907e; CRange: 2535),
                     (CFrom: $9080; CTo: $90fc; CRange: 2598),
                     (CFrom: $9140; CTo: $917e; CRange: 2723),
                     (CFrom: $9180; CTo: $91fc; CRange: 2786),
                     (CFrom: $9240; CTo: $927e; CRange: 2911),
                     (CFrom: $9280; CTo: $92fc; CRange: 2974),
                     (CFrom: $9340; CTo: $937e; CRange: 3099),
                     (CFrom: $9380; CTo: $93fc; CRange: 3162),
                     (CFrom: $9440; CTo: $947e; CRange: 3287),
                     (CFrom: $9480; CTo: $94fc; CRange: 3350),
                     (CFrom: $9540; CTo: $957e; CRange: 3475),
                     (CFrom: $9580; CTo: $95fc; CRange: 3538),
                     (CFrom: $9640; CTo: $967e; CRange: 3663),
                     (CFrom: $9680; CTo: $96fc; CRange: 3726),
                     (CFrom: $9740; CTo: $977e; CRange: 3851),
                     (CFrom: $9780; CTo: $97fc; CRange: 3914),
                     (CFrom: $9840; CTo: $9872; CRange: 4039),
                     (CFrom: $989f; CTo: $98fc; CRange: 4090),
                     (CFrom: $9940; CTo: $997e; CRange: 4184),
                     (CFrom: $9980; CTo: $99fc; CRange: 4247),
                     (CFrom: $9a40; CTo: $9a7e; CRange: 4372),
                     (CFrom: $9a80; CTo: $9afc; CRange: 4435),
                     (CFrom: $9b40; CTo: $9b7e; CRange: 4560),
                     (CFrom: $9b80; CTo: $9bfc; CRange: 4623),
                     (CFrom: $9c40; CTo: $9c7e; CRange: 4748),
                     (CFrom: $9c80; CTo: $9cfc; CRange: 4811),
                     (CFrom: $9d40; CTo: $9d7e; CRange: 4936),
                     (CFrom: $9d80; CTo: $9dfc; CRange: 4999),
                     (CFrom: $9e40; CTo: $9e7e; CRange: 5124),
                     (CFrom: $9e80; CTo: $9efc; CRange: 5187),
                     (CFrom: $9f40; CTo: $9f7e; CRange: 5312),
                     (CFrom: $9f80; CTo: $9ffc; CRange: 5375),
                     (CFrom: $a0; CTo: $df; CRange:      326),
                     (CFrom: $e040; CTo: $e07e; CRange: 5500),
                     (CFrom: $e080; CTo: $e0fc; CRange: 5563),
                     (CFrom: $e140; CTo: $e17e; CRange: 5688),
                     (CFrom: $e180; CTo: $e1fc; CRange: 5751),
                     (CFrom: $e240; CTo: $e27e; CRange: 5876),
                     (CFrom: $e280; CTo: $e2fc; CRange: 5939),
                     (CFrom: $e340; CTo: $e37e; CRange: 6064),
                     (CFrom: $e380; CTo: $e3fc; CRange: 6127),
                     (CFrom: $e440; CTo: $e47e; CRange: 6252),
                     (CFrom: $e480; CTo: $e4fc; CRange: 6315),
                     (CFrom: $e540; CTo: $e57e; CRange: 6440),
                     (CFrom: $e580; CTo: $e5fc; CRange: 6503),
                     (CFrom: $e640; CTo: $e67e; CRange: 6628),
                     (CFrom: $e680; CTo: $e6fc; CRange: 6691),
                     (CFrom: $e740; CTo: $e77e; CRange: 6816),
                     (CFrom: $e780; CTo: $e7fc; CRange: 6879),
                     (CFrom: $e840; CTo: $e87e; CRange: 7004),
                     (CFrom: $e880; CTo: $e8fc; CRange: 7067),
                     (CFrom: $e940; CTo: $e97e; CRange: 7192),
                     (CFrom: $e980; CTo: $e9fc; CRange: 7255),
                     (CFrom: $ea40; CTo: $ea7e; CRange: 7380),
                     (CFrom: $ea80; CTo: $eaa2; CRange: 7443),
                     (CFrom: $eaa3; CTo: $eaa4; CRange: 8284),
                     (CFrom: $ed40; CTo: $ed7e; CRange: 8359),
                     (CFrom: $ed80; CTo: $edb3; CRange: 8422),
                     (CFrom: $edb4; CTo: $edb4; CRange: 1993),
                     (CFrom: $edb5; CTo: $edfc; CRange: 8474),
                     (CFrom: $ee40; CTo: $ee7e; CRange: 8546),
                     (CFrom: $ee80; CTo: $eeec; CRange: 8609),
                     (CFrom: $eeef; CTo: $eef8; CRange: 8092),
                     (CFrom: $eef9; CTo: $eef9; CRange:  751),
                     (CFrom: $eefa; CTo: $eefc; CRange: 8005),
                     (CFrom: $fa40; CTo: $fa49; CRange: 8092),
                     (CFrom: $fa4a; CTo: $fa53; CRange: 7575),
                     (CFrom: $fa54; CTo: $fa54; CRange:  751),
                     (CFrom: $fa55; CTo: $fa57; CRange: 8005),
                     (CFrom: $fa58; CTo: $fa58; CRange: 7618),
                     (CFrom: $fa59; CTo: $fa59; CRange: 7610),
                     (CFrom: $fa5a; CTo: $fa5a; CRange: 8055),
                     (CFrom: $fa5b; CTo: $fa5b; CRange:  768),
                     (CFrom: $fa5c; CTo: $fa7e; CRange: 8359),
                     (CFrom: $fa80; CTo: $facf; CRange: 8394),
                     (CFrom: $fad0; CTo: $fad0; CRange: 1993),
                     (CFrom: $fad1; CTo: $fafc; CRange: 8474),
                     (CFrom: $fb40; CTo: $fb7e; CRange: 8518),
                     (CFrom: $fb80; CTo: $fbfc; CRange: 8581),
                     (CFrom: $fc40; CTo: $fc4b; CRange: 8706));

  function CharToCMap_90MS_RKSJ_H(S: string; Index: integer): integer;
  function CharToCMap_90MSP_RKSJ_H(S: string; Index: integer): integer;

implementation

{ CharToCMap_90MS_RKSJ_H }
function CharToCMap_90MS_RKSJ_H(S: string; Index: integer): integer;
var
  i: integer;
  C: integer;
begin
  C := 0;
  result := 0;
  case ByteType(S, Index) of
    mbSingleByte: C := Integer(S[Index]);
    mbLeadByte: C := Integer(S[Index])*256 + Integer(S[Index+1]);
    mbTrailByte:
      begin
        result := -1;
        Exit;
      end;
  end;

  for i := 0 to High(CMAP_90MS_RKSJ_H) - 1 do
  begin
    with CMAP_90MS_RKSJ_H[i] do
      if (C <= CTo) and (C >= CFrom) then
      begin
        result := CRange + (C - CFrom);
        Break;
      end;
  end;
end;

{ CharToCMap_90MS_RKSJ_H }
function CharToCMap_90MSP_RKSJ_H(S: string; Index: integer): integer;
var
  i: integer;
  C: integer;
begin
  C := 0;
  result := 0;
  case ByteType(S, Index) of
    mbSingleByte: C := Integer(S[Index]);
    mbLeadByte: C := Integer(S[Index])*256 + Integer(S[Index+1]);
    mbTrailByte:
      begin
        result := -1;
        Exit;
      end;
  end;

  for i := 0 to High(CMAP_90MSP_RKSJ_H) do
  begin
    with CMAP_90MSP_RKSJ_H[i] do
      if (C <= CTo) and (C >= CFrom) then
      begin
        result := CRange + (C - CFrom);
        Break;
      end;
  end;
end;

end.
