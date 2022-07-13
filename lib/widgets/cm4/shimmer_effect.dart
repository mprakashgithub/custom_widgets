import 'package:callme_ve/view/widgets/skelton.dart';
import 'package:flutter/material.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          const Skeleton(height: 120, width: 150),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Skeleton(width: 100),
                const Skeleton(width: 120),
                const SizedBox(height: 5),
                const Skeleton(),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Expanded(
                      child: Skeleton(
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Skeleton(
                        height: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
