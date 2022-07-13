import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget>
    with SingleTickerProviderStateMixin {
  //declare the variables
  double? _width, _height;
  AnimationController? _animationController;
  Animation<double>? _nextPage;
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  // int activePage = 0;
  List<String> images = [
    "assets/images/c2.png",
    "assets/images/c4.png",
    "assets/images/c5.png",
    "assets/images/c6.png",
    "assets/images/c7.png"
  ];
  @override
  void initState() {
    super.initState();
    //Start at the controller and set the time to switch pages
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController!);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController!.addListener(() {
      if (_animationController!.status == AnimationStatus.completed) {
        _animationController!.reset(); //Reset the controller
        final int page = images.length; //Number of pages in your PageView
        if (_currentPage < page) {
          _currentPage++;
          _pageController.animateToPage(_currentPage,
              duration: Duration(milliseconds: 2000), curve: Curves.easeInOut);
        } else {
          _currentPage = 0;
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _animationController!.forward(); //Start controller with widget
    print(_nextPage!.value);
    return Column(
      children: [
        SizedBox(
          height: 180,
          width: _width,
          child: PageView.builder(
              // itemCount: 4,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (value) {
                //When page change, start the controller
                _animationController!.fling();
                setState(() {
                  _currentPage = value;
                  // if (value == images.length) {
                  //   _currentPage = 0;
                  // }
                });
              },
              itemCount: images.length,
              pageSnapping: true,
              allowImplicitScrolling: true,
              // controller: _pageController,

              itemBuilder: (context, pagePosition) {
                return Container(
                  margin: EdgeInsets.all(0),
                  child: Image.asset(images[pagePosition]),
                );
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, _currentPage))
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
