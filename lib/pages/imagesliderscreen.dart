import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:imageslider/getdata.dart';
import 'package:imageslider/model/allimages.dart';

class imagesliderscreen extends StatefulWidget {
  imagesliderscreen({Key key}) : super(key: key);

  @override
  _imagesliderscreenState createState() => _imagesliderscreenState();
}

class _imagesliderscreenState extends State<imagesliderscreen> {
  int _current = 0;
  List<Allimages> futureData = [];
  List<CarouselController> buttonCarouselController = [];
  List<CarouselController> buttonCarouselControllerTitle = [];

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      value.forEach((element) {
        buttonCarouselController.add(new CarouselController());
        buttonCarouselControllerTitle.add(new CarouselController());
      });
      setState(() {
        futureData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Container(
          color: Colors.grey[800],
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Dog's Path",
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: futureData.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 25, 2),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        futureData[index].title
                                        /*   "870313 Dach Crest" */,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (futureData[index]
                                                .subPaths
                                                .length
                                                .toString()) +
                                            " Sub Path",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: FlatButton(
                                  onPressed: onPressed,
                                  child: Text("Open Path"),
                                  color: Colors.black,
                                  textColor: Colors.blue,
                                ),
                              )
                            ],
                          ),
                          Column(children: <Widget>[
                            CarouselSlider(
                              carouselController:
                                  buttonCarouselController[index],
                              items: futureData[index]
                                  .subPaths
                                  .map((paths) => Container(
                                        child: Image.network(
                                          paths.image,
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ),
                                        color: Colors.blue,
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  autoPlay: false,
                                  aspectRatio: 10 / 7,
                                  // autoPlayCurve: Curves.fastOutSlowIn,
                                  // enableInfiniteScroll: true,
                                  // autoPlayAnimationDuration:
                                  //     Duration(milliseconds: 800),
                                  viewportFraction: 1,
                                  scrollDirection: Axis.horizontal,
                                  onScrolled: (h) {
                                    print(h);
                                  },
                                  onPageChanged: (index1, reason) {
                                    buttonCarouselControllerTitle[index]
                                        .animateToPage(index1);
                                  }),
                            ),
                            Container(
                              color: Colors.black,
                              child: CarouselSlider(
                                carouselController:
                                    buttonCarouselControllerTitle[index],
                                items: [
                                  for (int i = 0;
                                      i < futureData[index].subPaths.length;
                                      i++)
                                    i
                                ]
                                    .map((pathIndex) => SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              pathIndex != 0
                                                  ? Container(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          buttonCarouselController[
                                                                  index]
                                                              .animateToPage(
                                                                  pathIndex -
                                                                      1);
                                                        },
                                                        child: (Text(
                                                          futureData[index]
                                                                  .subPaths[
                                                                      pathIndex -
                                                                          1]
                                                                  .title +
                                                              " ➡",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                      ),
                                                      color: Colors.black,
                                                    )
                                                  : Text(''),
                                              Container(
                                                child: Text(
                                                    futureData[index]
                                                            .subPaths[pathIndex]
                                                            .title +
                                                        " ➡",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blueAccent)),
                                                color: Colors.black,
                                              ),
                                              pathIndex ==
                                                      futureData[index]
                                                          .subPaths
                                                          .length
                                                  ? Container(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          buttonCarouselController[
                                                                  index]
                                                              .animateToPage(
                                                                  pathIndex +
                                                                      1);
                                                        },
                                                        child: Text(futureData[
                                                                    index]
                                                                .subPaths[
                                                                    pathIndex +
                                                                        1]
                                                                .title +
                                                            " ➡"),
                                                      ),
                                                      color: Colors.black,
                                                    )
                                                  : Text('',
                                                      style: TextStyle(
                                                          color: Colors.white))
                                            ],
                                          ),
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    autoPlay: false,
                                    aspectRatio: 10 / 1,
                                    // autoPlayCurve: Curves.fastOutSlowIn,
                                    // enableInfiniteScroll: true,
                                    // autoPlayAnimationDuration:
                                    //     Duration(milliseconds: 800),
                                    viewportFraction: 1,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index1, reason) {
                                      buttonCarouselController[index]
                                          .animateToPage(index1);
                                    }),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  void onPressed() {}
}
