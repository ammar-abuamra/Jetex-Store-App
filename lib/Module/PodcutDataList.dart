import 'package:flutter/material.dart';


class  Data {
  final String urlAvatar;
  final String username;
  final String message;

  const  Data({
    @required this.urlAvatar,
    @required this.username,
    @required this.message,
  });
}



class PData {
  static const  Datas = < Data>[
     Data(
      urlAvatar:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFnKKqcQYXjeFPYb_ViJTblVY70I8SsVNq8g&usqp=CAU ',
      username: 'Lampo Wheel',
      message: 'Vehicels - Parts',
    ),
     Data(
      urlAvatar:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOik6h3sI6z8EFWSQo1tbutNHo96pBp6W8Hw&usqp=CAU ',
      username: 'Taplo Duck',
      message: 'Vehicels - Accsseories',
    ),
     Data(
      urlAvatar:'https://th.bing.com/th/id/OIP.y00H_NHyP4ezezTZ_WAt9QHaJL?pid=ImgDet&w=570&h=706&rs=1 ',
      username: 'Ipohne',
      message: 'Electronic - Phon\'s',
    ),
     Data(
      urlAvatar:'https://th.bing.com/th/id/OIP.tlS6errfSjVSLhw-GfGaUgHaE8?pid=ImgDet&rs=1',
      username: 'Hp LapTop',
      message: 'Electronic - Laptops',
    ),

  ];
}