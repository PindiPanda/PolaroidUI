import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'models/data.dart';
import 'models/daily_stack.dart';
import 'models/header_delegate.dart';
import 'models/friends_list.dart';
import 'screens/camera_screen.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentPage = images.length - 1.0;
  ScrollController scrollController;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);

    _scrollListener() {
      if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          pageController.previousPage(
              duration: Duration(seconds: 1), curve: Curves.slowMiddle);
        });
      }
    }

    scrollController =
        ScrollController(initialScrollOffset: 0.01, keepScrollOffset: true);
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController?.dispose();
    pageController?.dispose();
    super.dispose();
  }

  SliverPersistentHeader photoHeader() {
    PageController pageController =
        PageController(initialPage: images.length - 1);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    return SliverPersistentHeader(
      pinned: true,
      //floating: true,
      delegate: SliverAppBarDelegate(
        minHeight: 250.0,
        maxHeight: 400.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Colors.deepPurple,
                Colors.deepOrange,
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              CardScrollWidget(currentPage),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images.length,
                  controller: pageController,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: [
        CameraScreen(cameras),
        Container(
          color: Colors.deepPurple,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              photoHeader(),
              friendsList(),
            ],
          ),
        ),
      ],
    );
  }
}





