import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/ui/spash_screen.dart';
import 'ui/restaurant_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        RestaurantPage.routeName: (context) => RestaurantPage(),
        DetailPage.routeName: (context) => DetailPage(
              restaurant: ModalRoute.of(context).settings.arguments,
            )
      },
    );
  }
}
