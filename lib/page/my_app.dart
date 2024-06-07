
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weathers/apps/config/theme_custom.dart';
import 'package:weathers/bottom_navigation_custom/bottom_custom.dart';
import 'package:weathers/page/home/home_page.dart';
import 'package:weathers/providers/wearther_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp ({super.key , required this.positionCurrent});
  final Position positionCurrent; 

  @override 
  Widget build (BuildContext context) {
    return ChangeNotifierProvider (

      create: (_) => WeatherProvider()..updatePosition(positionCurrent),
      child:  MaterialApp(
        theme: ThemeCustom.themeLight , 
        debugShowCheckedModeBanner: false,
        home: const BottommNavigationCustom(),
      ),
    );


  }
}