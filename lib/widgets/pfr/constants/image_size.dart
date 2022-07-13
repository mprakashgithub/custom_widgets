import 'dart:async';

import 'package:flutter/material.dart';

class ImageSize {
  Future<Size> calculateImageDimension(String url) {
    Completer<Size> completer = Completer();
    Image image = Image.network(url);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  double calculateRatio(double height, double width) {
    double diff = (height - width);
    // if(diff.isNegative || diff<256){
    //   return 1;
    // }
    // if (diff >= 256 && diff < 598) {
    //   return 3 / 4;
    // }

    // else if (diff > 598) {
    //   return 9 / 16;
    // }
    if (diff >= 256) {
      return 3 / 4;
    }
    else {
      return 1;
    }
  }
}
