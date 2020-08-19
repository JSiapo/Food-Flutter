import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/helpers/images.gen.dart';
// import 'package:food_app/helpers/images.gen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       expandedHeight: _screen.height * 0.4,
      //       backgroundColor: Colors.orange[700],
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20.0),
      //         bottomRight: Radius.circular(20.0),
      //       )),
      //       centerTitle: true,
      //       title: ClipRRect(
      //         borderRadius: BorderRadius.circular(20.0),
      //         child: FadeInImage(
      //           image: NetworkImage(
      //               'https://cdn.pixabay.com/photo/2016/03/09/09/30/girl-1245835_960_720.jpg'),
      //           placeholder: AssetImage(IMG.decore.headerJPG),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Center(
            child: Hero(
              tag: 'avatar',
              child: _avatar(
                  'https://cdn.pixabay.com/photo/2016/03/09/09/30/girl-1245835_960_720.jpg',
                  context),
            ),
          )
        ],
      ),
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
