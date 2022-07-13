import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final int? index;

  const ImageWidget({
    Key? key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Image.asset(
            'assets/images/android/drawable-ldpi/profile_off_ic.png',
            fit: BoxFit.cover,
          ),
        ),
      );
}
