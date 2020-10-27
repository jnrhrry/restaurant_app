import 'package:flutter/material.dart';
import 'package:restaurant_app/data/restaurant.dart';
import 'dart:convert';

import 'package:restaurant_app/ui/detail_page.dart';

class RestaurantPage extends StatelessWidget {
  static const routeName = '/restaurant_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final json = jsonDecode(snapshot.data);
              final restaurantResponse = RestaurantResponse.fromMap(json);
              final restaurant = restaurantResponse.restaurants;
              return ListView.builder(
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  return _buildRestoItem(context, restaurant[index]);
                },
              );
            }
          }),
    );
  }
}

Widget _buildRestoItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      restaurant.pictureId,
      width: 100,
    ),
    title: Text(restaurant.name),
    subtitle: Text(restaurant.city),
    onTap: () {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: restaurant);
    },
  );
}
