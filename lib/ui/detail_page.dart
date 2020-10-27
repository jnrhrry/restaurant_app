import 'package:flutter/material.dart';
import 'package:restaurant_app/data/restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final Restaurant restaurant;
  const DetailPage({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kota ${restaurant.city}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Divider(
                    color: Colors.greenAccent,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text('${restaurant.rating}'),
                    ],
                  ),
                  Divider(
                    color: Colors.greenAccent,
                  ),
                  Text(restaurant.description),
                  Divider(
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
