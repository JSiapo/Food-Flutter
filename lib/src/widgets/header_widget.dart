import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/helpers/images.gen.dart';
import 'package:food_app/src/models/user.dart';

class Header extends StatelessWidget {
  // final String avatar;
  // final String username;
  final User user;

  Header({this.user});

  @override
  Widget build(BuildContext context) {
    // final heightHeader = 240.0;
    final heightHeader = MediaQuery.of(context).size.height * 0.3;
    final paddingButtons = 15.0;
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
            // image: CachedNetworkImageProvider(
            //     'https://cdn.pixabay.com/photo/2016/12/26/17/28/food-1932466_960_720.jpg')),
            image: AssetImage(IMG.decore.headerJPG)),
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
                        width: 174,
                        child: Text(
                          user.userName,
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
              _avatarImage(user.avatar)
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
                ? AssetImage(IMG.icons.blankuserPNG)
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
