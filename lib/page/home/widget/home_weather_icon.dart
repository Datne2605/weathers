import 'package:flutter/material.dart';
import 'package:weathers/apps/const.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key , required this.nameIcon });

   final String nameIcon;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Container(
      width: size.width/1.5 ,
      padding:const EdgeInsets.all(30.0), 
    child: Image.asset(
      AssetCustom.getLinkImg(nameIcon),
    fit: BoxFit.cover,
    ),
    );
  }
}