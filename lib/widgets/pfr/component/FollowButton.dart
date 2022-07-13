import 'package:app/constant.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  bool isFollowed;
  Function() onClick;

  FollowButton(this.isFollowed, this.onClick);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isFollowed ? AppColor.white : AppColor.primary)),
        onPressed: onClick,
        child: Text(
          isFollowed ? "Following" : "Follow",
          style:
              TextStyle(color: isFollowed ? AppColor.primary : AppColor.white),
        ));
  }
}
