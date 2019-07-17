/*import 'dart:math';
import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
  _scrollListener() {

    if (_scrollController.offset <= 50 &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _scrollController.animateTo(1.0, duration: Duration(milliseconds: 1500), curve: ElasticOutCurve());
      });
    }
  }
    _scrollController = ScrollController(initialScrollOffset: 50, keepScrollOffset: true);
    //_scrollController.addListener(_scrollListener);
    super.initState();
  }

  var currentPage = images.length - 1.0;
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      //floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 100.0,
        maxHeight: 200.0,
        child: Container(
          //color: Colors.deepOrange,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepOrange, Colors.deepPurple],
            ),
          ),
          child: Center(
            child: Text(
              headerText,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nothing You Could Do',
                fontSize: 36.0,
                inherit: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverPersistentHeader newMakeHeader(String headerText) {
    PageController pageController = PageController(initialPage: images.length - 1);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    return SliverPersistentHeader(
      pinned: true,
      //floating: true,
      delegate: _SliverAppBarDelegate(
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
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Container(
      color: Colors.deepPurple,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          newMakeHeader('Header Section 1'),
          /*SliverAppBar(
          /*title: Text(
            'Memories',
            style: TextStyle(
              color: Colors.blueGrey,
              fontFamily: 'Nothing You Could Do',
              fontSize: 36.0,
              inherit: false,
            ),
          ),*/
          backgroundColor: Colors.deepOrange,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: null,
            background: Image.asset('assets/polaroid.jpg', fit: BoxFit.cover),
          ),
          //pinned: true,
          //floating: true,
          //snap: true,
        ),
        newMakeHeader('Header Section 1'),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
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
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),*/
          //makeHeader('Header Section 2'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final row = MaterialButton(
                  color: Colors.deepPurple,
                  splashColor: Colors.deepOrange,
                  highlightColor: Colors.deepOrange,
                  //animationDuration: Duration(seconds: 10),
                  onPressed: () {},
                  elevation: 0.0,
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('assets/image_03.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bob The Hedgehog',
                                style: TextStyle(
                                  inherit: false,
                                  fontFamily: 'Nothing You Could Do',
                                  fontSize: 27.0,
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                'I am Mountain Bob!!!',
                                style: TextStyle(
                                  inherit: false,
                                  fontFamily: 'Nothing You Could Do',
                                  fontSize: 18.0,
                                ),
                                maxLines: 1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 15.0, right: 15.0),
                                child: Container(
                                  height: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                return row;
              },
              childCount: 10,
            ),
          ),
          /*makeHeader("Today's Memories"),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(getRandomImage()),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150.0,
            );
          }),
        ),*/
        ],
      ),
    );
  }

  getRandomColor() {
    List colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple
    ];
    Random random = new Random();
    int index = random.nextInt(6);
    return colors[index];
  }

  getRandomImage() {
    Random random = new Random();
    int index = random.nextInt(4);
    return images[index];
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    print(shrinkOffset.toString());
    if (shrinkOffset == 0.0) {
      return (SizedBox.expand(
        child: Image.asset('assets/polaroid.jpg', fit: BoxFit.cover),
      ));
    }
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _MyHomePageState2 extends State<MyHomePage> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return (Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.deepOrange],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 115),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
              ],
            ),
            //SizedBox(height: 500,),
          ],
        ),
      ),
    ));
  }
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;
          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);
          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: AspectRatio(
              aspectRatio: cardAspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[i]), fit: BoxFit.fitHeight),
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 25),
                    right: BorderSide(color: Colors.white, width: 10),
                    //bottom: BorderSide(color: Colors.white, width: 75),
                    left: BorderSide(color: Colors.white, width: 10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0),
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: widthOfPrimaryCard,
                    height: heightOfPrimaryCard / 5,
                    color: Colors.white,
                    child: Text(
                      title[i],
                      style: TextStyle(
                        color: Colors.blueGrey[600],
                        fontSize: 24.0,
                        fontFamily: 'Nothing You Could Do',
                        inherit: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}*/
