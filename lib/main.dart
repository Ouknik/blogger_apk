import 'dart:convert';
import 'dart:math';
import 'package:blogger/pages/post_view.dart';
import 'package:blogger/pages/webView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//admob  Bannire ...........................start
  BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-5140570452528708/6823528370",
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          myBanner..show();
        });
  }

  /// ************ admob bannire end

  var urlVa =
      "https://www.googleapis.com/blogger/v3/blogs/1220968828701768690/posts/?key=AIzaSyDpwI-kMZ_IxqAJVBKAVtWLOlaGQ5YLEuw";
  var _isLoading = true; //For progress bar
  var posts;

  var nextPageTokens;
  var etagTokens;
  var imgUrl;
  //initialization
  void initState() {
    super.initState();

    ///admob show
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-5140570452528708~4613577017");
    myBanner = buildBannerAd()..load();

    ///end admob show
    _fetchData();
  }

  //Function to fetch data from JSON
  @override
  _fetchData() async {
    final response = await http.get(urlVa);
    if (response.statusCode == 200) {
      //HTTP OK is 200
      final Map items = json.decode(response.body);
      var post = items['items'];
      var nextPageToken = items['nextPageToken'];
      var etagToken = items['etag'];
      setState(() {
        _isLoading = false;
        this.posts = post;
        this.nextPageTokens = nextPageToken;
        this.etagTokens = etagToken;
      });
    }
  }

  ///les immage Slider et pae defaut
  var productImage0 =
      "https://1.bp.blogspot.com/--pWsBsIFAMk/YDuqjGZfdwI/AAAAAAAACUM/nprkccuHtlgcHPfYLXCZx3uvaxn5tG-sQCPcBGAYYCw/s368/oop-okni.png";
  var productImage1 =
      "https://1.bp.blogspot.com/-uh2KvYp9Rqw/YSyXHnZWctI/AAAAAAAACk8/GEN8VAmMYOwG7q1BF3BYSJ_Ab8yB4ItSQCPcBGAYYCw/s872/tacharfto.png";
  var productImage2 =
      "https://1.bp.blogspot.com/-x9oNvB73ix0/YSqhLBYqM2I/AAAAAAAACjg/AzU4_FAVuTMWubWXE7DqN34nmd4onMozwCPcBGAYYCw/s678/hhhhh.png";
  var productImage3 =
      "https://1.bp.blogspot.com/-eZGlWsLUbWg/YB_BqaXbqQI/AAAAAAAAB18/_gRTycDkHEAu0kD8YQq2H4j6DNMKQ825wCPcBGAYYCw/s540/FB_IMG_16124900660733782.jpg";
  var productImage4 =
      "https://1.bp.blogspot.com/-auxug5gkPes/YCmJSdD13VI/AAAAAAAAB_g/KLTYEUN5xbcU1t97Bb-KwrrerKw4DbjdwCPcBGAYYCw/s770/2-11.webp";
  var productImage5 =
      "https://1.bp.blogspot.com/-WbrX1eEVMzs/YH4epfkaxBI/AAAAAAAACdA/4a_vIsfn7hU3SvTZxBkRyN1hVtJZ0s72ACPcBGAYYCw/s261/%25D9%2587%25D9%2583%25D9%2584.jpg";
  var productImage6 =
      "https://1.bp.blogspot.com/-4ebI7M3uKAE/YSkn5WhaCVI/AAAAAAAACi4/6-Z8_A3CaZkC5OgqcTTzKaH0lv2bRUTRgCPcBGAYYCw/s538/sssssss.png";
  var productImage7 =
      "https://1.bp.blogspot.com/-y11IGZZW8kI/YBFXvdcb1OI/AAAAAAAABzk/SFMX7dBbUDkJ0_WgOvgiMBiX003s9vQ1wCPcBGAYYCw/s600/FB_IMG_16117491999433840.jpg";
  var productImage8 =
      "https://1.bp.blogspot.com/-HU29A29edhY/X_y_rRf-kwI/AAAAAAAAARY/q2gOcAAsmVAOFelvSLbvvWLJaSfUiuVlwCLcBGAsYHQ/s232/IMG_20210111_221135.jpg";
  var productImage9 =
      "https://1.bp.blogspot.com/-k2Lpdn9IHIs/X_xqx3qUi5I/AAAAAAAAAQs/ycz-_VT4R_gx5FIBZPUbX5HBm0CIxGb2QCLcBGAsYHQ/s242/images%2B%25285%2529.jpeg";

////////////////////////////////////

///// native Ads*************************** start
  final _controller = NativeAdmobController();
  Widget createNateveAds() {
    NativeAdmob nativeAdmob = NativeAdmob(
      adUnitID: "ca-app-pub-5140570452528708/8307661124",
      controller: _controller,
    );
    return Container(
      width: double.infinity,
      height: 200,
      child: nativeAdmob,
    );
  }
//native ads *********** end****************

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        backgroundColor: Colors.cyan,
        title: new Text("روايتي_Riwayati"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              })
        ],
      ),
      body: Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.posts != null ? this.posts.length : 0,
                itemBuilder: (context, i) {
                  final Post = this.posts[i];

                  String postDesc = Post["content"];
                  var document = parse(postDesc);

                  RegExp regExp = new RegExp(
                    r"(https?:\/\/.*\.(?:png|jpg|gif))",
                    caseSensitive: true,
                    multiLine: true,
                  );
                  String reg = regExp
                      .stringMatch(document.outerHtml.toString())
                      .toString();
                  final match = reg;

                  //Converting the regex output to image (Slashing) , since the output from regex was not perfect for me
                  if (match.length > 5) {
                    if (match.contains(".jpg")) {
                      imgUrl = match.substring(0, match.indexOf(".jpg"));
                    } else {
                      imgUrl = productImage0;
                    }
                  }

                  final imageList = [
                    productImage1,
                    productImage2,
                    productImage3,
                    productImage4,
                    productImage5,
                    productImage6,
                    productImage7,
                    productImage8,
                    productImage9,
                  ];
                  return Card(
                    color: Colors.yellow[50],
                    child: new Container(
                      padding: const EdgeInsets.all(16),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          i != 0 && i % 3 == 0
                              ? createNateveAds()
                              : Container(
                                  width: 0,
                                  height: 0,
                                ),
                          i == 0
                              ? Container(
                                  child: Column(
                                    children: [
                                      CarouselSlider(
                                        items: [
                                          Container(
                                            margin: EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              image: DecorationImage(
                                                image: NetworkImage(imageList[
                                                    Random().nextInt(9)]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],

                                        //Slider Container properties
                                        options: CarouselOptions(
                                          height: 200.0,
                                          enlargeCenterPage: true,
                                          autoPlay: true,
                                          aspectRatio: 16 / 9,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 800),
                                          viewportFraction: 0.8,
                                          onPageChanged: (index, next) {},
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                          i == 0
                              ? Container(
                                  child: Text(
                                    "أحسن باقة يمكنك قراءتها.....                                   ",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                    textDirection: TextDirection.rtl,
                                  ),
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                          i == 0
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  height: 90,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.red,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.yellow,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.green,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.cyan,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.orange,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.teal,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.lime,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.pink,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundColor: Colors.blue,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              imageList[Random().nextInt(9)]),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                          new Container(
                            width: 500.0,
                            height: 200.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  //check if the image is not null (length > 5) only then check imgUrl else display default img
                                  image: new NetworkImage(
                                      imgUrl.toString().length != 0
                                          ? imgUrl.toString()
                                          : productImage0)),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: new Text(
                              Post["title"],
                              maxLines: 3,
                              style: new TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0.0),
                                child: new RaisedButton(
                                  child: new Text(
                                    "اقرأ المزيد",
                                    style: new TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    //We will pass description to postview through an argument
                                    Navigator.of(context)
                                        .push(new MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                        return PostView(
                                            Post['title'],
                                            document.body.text,
                                            imgUrl,
                                            Post['titleLink']);
                                      },
                                    ));
                                  },
                                ),
                              ),
                              new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0.0),
                                child: new RaisedButton(
                                    child: new Text(
                                      "تحميل",
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return webView(
                                            Post['titleLink'], Post['title']);
                                      }));
                                    }),
                              ),
                            ],
                          ),
                          i == 9
                              ? Divider(
                                  color: Colors.pinkAccent,
                                  endIndent: 10,
                                  height: 30,
                                  indent: 10,
                                  thickness: 3,
                                )
                              : Container(),
                          i == 9
                              ? Container(
                                  color: Colors.blue[50],
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: RaisedButton(
                                          color: Colors.blueAccent,
                                          onPressed: () {
                                            setState(() {
                                              urlVa =
                                                  "https://www.googleapis.com/blogger/v3/blogs/1220968828701768690/posts/?key=AIzaSyDpwI-kMZ_IxqAJVBKAVtWLOlaGQ5YLEuw&etag=$etagTokens";
                                            });
                                            _fetchData();
                                          },
                                          child: Text("السابق"),
                                        ),
                                      ),
                                      Container(
                                        child: RaisedButton(
                                          color: Colors.blueAccent,
                                          onPressed: () {
                                            setState(() {
                                              urlVa =
                                                  "https://www.googleapis.com/blogger/v3/blogs/1220968828701768690/posts/?key=AIzaSyDpwI-kMZ_IxqAJVBKAVtWLOlaGQ5YLEuw&pageToken=$nextPageTokens";
                                            });
                                            _fetchData();
                                          },
                                          child: Text("التالي"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                          i == 9
                              ? Container(
                                  color: Colors.yellow[50],
                                  height: 60,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
