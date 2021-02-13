import 'package:bingo_star_app/src/pages/carton_seleted.dart';
import 'package:bingo_star_app/src/services/provider_list_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
     DeviceOrientation.portraitUp,
  ]
  );
}

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NotifierBolo(),)
          ],
          child: MaterialApp(
        title: 'BINGO - V 1.0',
        debugShowCheckedModeBanner: false,
        //iniciamos la ruta
        initialRoute: '/',
        routes: {
          '/' : (BuildContext context) => CartonPage(),
        },
      ),
    );
  }
}