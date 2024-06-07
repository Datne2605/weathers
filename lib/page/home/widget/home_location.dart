import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({super.key, required this.nameLocation});

  final String nameLocation ;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd-MM-yyy');


    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/location.png'),
            const SizedBox(width: 8),
            Text(
              nameLocation ,
               style: const TextStyle(
                fontSize: 23 ,
                 color: Colors.white
             ),
             )
          ],
        ),
        const SizedBox(height: 4),

        Text( df.format(DateTime.now()),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),)
      ]
      
    );
    
  }
}