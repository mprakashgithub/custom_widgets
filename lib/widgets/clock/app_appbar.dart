import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(22.5)),
            child: const Center(
                child: Text(
              "JE",
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.backgroundDark,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
 

// CommonAppBar(
//         backgroundColor: AppColors.backgroundDark,
//         elevation: 0,
//         title: InkWell(
//           onTap: () => _scaffoldKey.currentState!.openDrawer(),
//           child: Container(
//             height: 45,
//             width: 45,
//             decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(22.5)),
//             child: const Center(
//                 child: Text(
//               "JE",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: AppColors.backgroundDark,
//                   fontWeight: FontWeight.bold),
//             )),
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//         automaticallyImplyLeading: false,
//       ),