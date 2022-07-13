import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double? _width, _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
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
      // drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: _width,
        ),
      ),
      bottomNavigationBar: Container(
        height: _height! * 0.35,
        width: _width,
        padding: const EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
