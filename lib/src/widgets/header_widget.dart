import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final avatar =
      'https://static01.nyt.com/images/2019/11/17/books/review/17Salam/Salam1-superJumbo.jpg';
  // 'https://3.bp.blogspot.com/-NAGz3r9a1ZA/XLM60xge2hI/AAAAAAAABR8/KmiboleQ_3QSJnaBc7Vck9JOTQJ9n0l7wCK4BGAYYCw/s1200-pf/Programmer.png';
  // '';
  final username = 'Amie Carrie';
  final header =
      'https://cdn.pixabay.com/photo/2016/12/26/17/28/food-1932466_960_720.jpg';
  @override
  Widget build(BuildContext context) {
    final heightHeader = 280.0;
    final paddingButtons = 30.0;
    final opacityImage = 0.5;
    return Container(
      height: heightHeader,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(paddingButtons),
            bottomRight: Radius.circular(paddingButtons)),
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(opacityImage),
              BlendMode.srcOver,
            ),
            image: CachedNetworkImageProvider(header)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hola',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          username,
                          overflow: TextOverflow.clip,
                          // softWrap: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: SizedBox(),
              ),
              _avatarImage(avatar)
            ],
          ),
          SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }

  Widget _avatarImage(String avatar) {
    final paddingButtons = 30.0;
    return Container(
        padding: EdgeInsets.only(
          right: paddingButtons,
        ),
        child: IconButton(
          iconSize: 70.0,
          icon: CircleAvatar(
            backgroundColor: Colors.white10,
            radius: 55.0,
            backgroundImage: avatar == ''
                ? AssetImage('assets/images/blank_user.png')
                : CachedNetworkImageProvider(
                    avatar,
                  ),
          ),
          onPressed: () {
            print('avatar');
          },
        ));
  }
}
