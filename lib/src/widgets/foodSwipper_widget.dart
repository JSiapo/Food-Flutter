import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_app/helpers/images.gen.dart';

class FoodSwipper extends StatelessWidget {
  final images = [
    "https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/01/30/13/49/pancakes-2020863_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 1,
        itemHeight: _screenSize.height *
            (MediaQuery.of(context).orientation == Orientation.portrait
                ? 0.3
                : 0.7),
        itemCount: images.length,
        onIndexChanged: (value) {
          print("value is $value");
        },
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              child: FadeInImage(
                fadeInDuration: Duration(
                  milliseconds: 500,
                ),
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  images[index],
                ),
                placeholder: AssetImage(IMG.decore.loadingGIF),
              ),
            ),
          );
        },
      ),
    );
  }
}
