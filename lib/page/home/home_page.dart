import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathers/models/weather.dart';
import 'package:weathers/page/home/widget/home_detail_weather.dart';
import 'package:weathers/page/home/widget/home_weather_icon.dart';
import 'package:weathers/page/home/widget/home_temperature.dart';
import 'package:weathers/page/home/widget/home_location.dart';
import 'package:weathers/providers/wearther_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState(); 
  }

  class _HomePageState extends State<HomePage> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurren();
  }

  @override 
  Widget build(BuildContext context ){
    return  Scaffold(
     body : Container (
       decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
            Color(0xff1D6CF3),
            Color(0xff19D2FE),
        ]
        ),
       ),

       child: FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherCurren(),
        initialData: null,
        builder: (BuildContext context , AsyncSnapshot snapshot ){
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
              );
          }
          if(!snapshot.hasData) {
            return Container(
              child: const Text('no data'),
            );
          }


          WeatherData data = snapshot.data as WeatherData;

          return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeWeatherIcon(nameIcon: data.weather[0].main ,),
          HomeTemperature(temp: data.main.temp,),
          HomeLocation(nameLocation: data.name,),
          const SizedBox(height: 30 ,),
          HomeDetailWeather(
            humidity: data.main.humidity,
            speedWind: data.wind.speed ,
            ),
        ],
       );
        },
       )    
    ),
    );
  }
}