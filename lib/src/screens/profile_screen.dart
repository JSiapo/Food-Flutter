import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/helpers/images.gen.dart';
import 'package:food_app/src/widgets/header_curvo_widet.dart';
// import 'package:food_app/helpers/images.gen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: [
                  _background(_screen),
                  SafeArea(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: _screen.height * 0.15,
                        ),
                        Center(
                          child: Hero(
                            tag: 'avatar',
                            child: _avatar(
                                'https://cdn.pixabay.com/photo/2016/03/09/09/30/girl-1245835_960_720.jpg',
                                context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _background(Size size) {
    return Column(
      children: [
        // Container(
        //   height: size.height * 0.3,
        //   color: Colors.red,
        // ),
        HeaderCurvo(size.height),
      ],
    );
  }

  Widget _avatar(String avatar, BuildContext context) {
    final paddingButtons = 30.0;
    final avatarWidget = Container(
      padding: EdgeInsets.only(
        right: paddingButtons,
      ),
      height: 100,
      width: 130,
      child: CircleAvatar(
        backgroundColor: Colors.white10,
        radius: 55.0,
        backgroundImage: avatar == ''
            ? AssetImage(IMG.icons.blankuserPNG)
            : CachedNetworkImageProvider(
                avatar,
              ),
      ),
    );
    return avatarWidget;
  }
}
