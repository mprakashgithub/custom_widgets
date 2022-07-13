import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
 final Size size;


 CardShimmer(this.size);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:AppColor.grey.withOpacity(0.5),
      highlightColor: AppColor.bg,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child:  Image.asset(
                    "assets/placeholder.png",
                    height: size.height * 0.213,
                    fit: BoxFit.fill,
                  )
                ),
                Text("Description is Here",style: AppText.r14,)
              ],
            ),
          ),
          AppSpacing.sq8,
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.asset(
                    "assets/placeholder.png",
                    height: size.height * 0.213,
                    fit: BoxFit.fill,
                  )
                ),
                Text("Description is Here",style: AppText.r14,)
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
