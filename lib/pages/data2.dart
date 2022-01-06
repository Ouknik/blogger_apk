import 'dart:convert';
import 'dart:math';
import 'package:blogger/constant.dart';
import 'package:blogger/pages/post_view.dart';
import 'package:blogger/pages/slider.dart';
import 'package:html/parser.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:http/http.dart' as http;

class Books2 extends StatefulWidget {
  static final id = 'Books';
  @override
  _Books2State createState() => _Books2State();
}

class _Books2State extends State<Books2> {
  //admob  Bannire ...........................start
  late BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: adUnitIdBannir,
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          myBanner..show(anchorType: AnchorType.top, anchorOffset: 70);
        });
  }

  /// ************ admob bannire end
  ///// native Ads*************************** start
  final _controller = NativeAdmobController();
  Widget createNateveAds(w, h) {
    NativeAdmob nativeAdmob = NativeAdmob(
      adUnitID: adUnitIDNativ,
      controller: _controller,
    );
    return Container(
      width: w,
      height: h,
      child: nativeAdmob,
    );
  }
//native ads *********** end****************
//******intersitial admob */

  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: InterstitialAdtestAdUnitId,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  ///*********end intersitial

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
    FirebaseAdMob.instance.initialize(appId: appId);
    myBanner = buildBannerAd()..load();

    ///end admob show
    ///

    _fetchData();
  }

  //Function to fetch data from JSON
  @override
  _fetchData() async {
    final response = await http.get(Uri.parse(urlVa));
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

////////////////////////////////////

  //initialization
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
                      imgUrl =
                          "https://1.bp.blogspot.com/--pWsBsIFAMk/YDuqjGZfdwI/AAAAAAAACUM/nprkccuHtlgcHPfYLXCZx3uvaxn5tG-sQCPcBGAYYCw/s368/oop-okni.png";
                    }
                  }

                  return Card(
                    color: Colors.yellow[50],
                    child: new Container(
                      padding: const EdgeInsets.all(16),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          i == 0
                              ? Container(
                                  height: 50,
                                )
                              : Container(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PostView(Post['title'], Post["content"],
                                    imgUrl, Post['titleLink']);
                              }));
                              myInterstitial
                                ..load()
                                ..show(
                                  anchorType: AnchorType.bottom,
                                  anchorOffset: 0.0,
                                  horizontalCenterOffset: 0.0,
                                );
                            },
                            child: Card(
                              child: ListTile(
                                leading: Image(
                                  image: NetworkImage(imgUrl.toString()),
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 100,
                                ),
                                title: Expanded(
                                  child: Text(
                                    Post["title"],
                                    maxLines: 2,
                                    style: new TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                        child: etagTokens != 0
                                            ? RaisedButton(
                                                color: Colors.blueAccent,
                                                onPressed: () {
                                                  setState(() {
                                                    urlVa =
                                                        "https://www.googleapis.com/blogger/v3/blogs/1220968828701768690/posts/?key=AIzaSyDpwI-kMZ_IxqAJVBKAVtWLOlaGQ5YLEuw&etag=$etagTokens";
                                                  });
                                                  _fetchData();
                                                },
                                                child: Text("السابق"),
                                              )
                                            : Text(''),
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
