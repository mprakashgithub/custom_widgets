import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageProfile extends StatelessWidget {
  final String imageUrl;
  final double height;

  const CacheImageProfile({Key? key, required this.height, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      fit: BoxFit.fill,
      width: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => Image.asset(
        "assets/placeholder.png",
        height: height,
        fit: BoxFit.fill,
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/placeholder.png",
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
