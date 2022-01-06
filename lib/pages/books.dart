import 'dart:convert';
import 'package:blogger/pages/post_view.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/image_render.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:html/parser.dart';

import '../constant.dart';
import 'MyHomePage.dart';
import 'aide.dart';
import 'data2.dart';
import 'domande.dart';

class Books extends StatefulWidget {
  static final id = 'Books';
  var V;
  Books({required this.V});
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  late int v = widget.V;
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

  var Post = [];
  var lable1 = [];
  var lable2 = [];
  var lable3 = [];
  var lable4 = [];
  var lable5 = [];
  var lable6 = [];
  var lable7 = [];
  var lable8 = [];
  var lable9 = [];
  var labels;
  var lable = [
    "جميع الكتب",
    "كتب_قتلت_اصحابها",
    "الأدب العالمي",
    "الأدب العربي",
    "روايات عربية",
    "كتب التنمية البشرية",
    "كتب دينية",
    "كتب فرنسية",
    "كتب مترجمة",
    "كتب وروايات انجليزية"
  ];
  var urlVa =
      "https://www.googleapis.com/blogger/v3/blogs/1220968828701768690/posts/?key=AIzaSyDpwI-kMZ_IxqAJVBKAVtWLOlaGQ5YLEuw";
  var _isLoading = true; //For progress bar
  var posts;

  var nextPageTokens;
  var etagTokens;
  var imgUrl;

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

//initialization
  @override
  void initState() {
    super.initState();

    ///admob show
    FirebaseAdMob.instance.initialize(appId: appId);
    myBanner = buildBannerAd()..load();

    ///end admob show
    ///
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var L = [
      Post,
      lable1,
      lable2,
      lable3,
      lable4,
      lable5,
      lable6,
      lable7,
      lable8,
      lable9,
    ];

    setState(() {
      _isLoading = false;
      if (posts.length != 0) {
        for (int i = 0; i < posts?.length; i++) {
          setState(() {
            if (posts[i]['labels'][0] == "مؤلف" ||
                posts[i]['labels'][0] == "ملخص" ||
                posts[i]['labels'][0] == "université" ||
                posts[i]['labels'][0] == "مجال الإليكترونيات" ||
                posts[i]['labels'][0] == "الكتب البرمجي" ||
                posts[i]['labels'][0] == "البرمجة" ||
                posts[i]['labels'][0] == "عالم الأردوينو") {
            } else {
              Post.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "كتب_قتلت_اصحابها") {
              lable1.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "الأدب العالمي") {
              lable2.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "الأدب العربي") {
              lable3.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "روايات عربية") {
              lable4.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "كتب التنمية البشرية") {
              lable5.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "كتب دينية") {
              lable6.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "كتب فرنسية") {
              lable7.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "كتب مترجمة") {
              lable8.add(posts[i] ?? "");
            }
            if (posts[i]['labels'][0] == "كتب وروايات انجليزية") {
              lable9.add(posts[i] ?? "");
            }
          });
        }
        setState(() {
          urlVa =
              "https://www.googleapis.com/blogger/v3/blogs/1220968828701768690/posts/?key=AIzaSyDpwI-kMZ_IxqAJVBKAVtWLOlaGQ5YLEuw&pageToken=$nextPageTokens";
        });
        if (nextPageTokens != "CgkIChih7tra-y0Q8vffpOSV8PgQ") {
          _fetchData();
        }
      }
    });
    void NavigatorToPage(page) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    }

    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.teal,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage("images/riwaya.png"),
                    fit: BoxFit.cover,
                  )),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10.0,
                        left: 10.0,
                        child: CircleAvatar(
                          radius: 52,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.teal,
                            backgroundImage: ExactAssetImage("images/imgg.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Text('oopokni.info',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        top: 250,
                        left: 10,
                      ),
                      Positioned(
                        child: Text(
                          'Riwayati',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        top: 20,
                        right: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.teal,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              myBanner.dispose();
                              myInterstitial
                                ..load()
                                ..show(
                                  anchorType: AnchorType.bottom,
                                  anchorOffset: 0.0,
                                  horizontalCenterOffset: 0.0,
                                );
                              Navigator.pop(context);
                            });
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.white70,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'الرئيسية',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            myBanner.dispose();
                            myInterstitial
                              ..load()
                              ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0,
                                horizontalCenterOffset: 0.0,
                              );
                            NavigatorToPage(Books2());
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                Icons.book_rounded,
                                color: Colors.white70,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'كتبي(الطراز القديم)',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            myBanner.dispose();
                            myInterstitial
                              ..load()
                              ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0,
                                horizontalCenterOffset: 0.0,
                              );
                            NavigatorToPage(domande());
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Image.asset(
                                'images/imgg.png',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'أطلب كتابك',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            myBanner.dispose();
                            myInterstitial
                              ..load()
                              ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0,
                                horizontalCenterOffset: 0.0,
                              );
                            NavigatorToPage(Aider());
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'اعلانات',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      createNateveAds(double.infinity, 400.0)
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: Card(
                              color: Colors.teal,
                              elevation: 0,
                              child: Expanded(
                                child: Text(
                                  "OUKNIK",
                                  style: TextStyle(
                                      fontSize: 70,
                                      color: Colors.black12,
                                      fontStyle: FontStyle.italic),
                                ),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            createNateveAds(double.infinity, 100.0),
            Container(
              color: Colors.amber[50],
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lable.length,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          v = i;
                        });
                      },
                      child: Card(
                        color: v == i ? Colors.cyan : Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: v == i ? Colors.black : Colors.teal,
                          ),
                        ),
                        child: Container(
                          width: 160,
                          child: Center(
                              child: Text(
                            lable[i],
                            style: TextStyle(color: Colors.black),
                          )),
                          //color: Colors.amber,
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              child: _isLoading
                  ? new CircularProgressIndicator()
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemCount: L[v].length,
                      itemBuilder: (BuildContext ctx, index) {
                        String postDesc = L[v][index]["content"];
                        var document = parse(postDesc);

                        RegExp regExp = new RegExp(
                          r"(https?:\/\/.*\.(?:png|jpg|gif))",
                          caseSensitive: true,
                          multiLine: false,
                        );
                        String reg = regExp
                            .stringMatch(document.outerHtml.toString())
                            .toString();
                        final match = reg;
                        try {
//Converting the regex output to image (Slashing) , since the output from regex was not perfect for me
                          if (match.length > 10) {
                            if (match.contains(".jpg")) {
                              imgUrl =
                                  match.substring(0, match.indexOf(".jpg"));
                            } else {
                              imgUrl =
                                  "https://1.bp.blogspot.com/--pWsBsIFAMk/YDuqjGZfdwI/AAAAAAAACUM/nprkccuHtlgcHPfYLXCZx3uvaxn5tG-sQCPcBGAYYCw/s368/oop-okni.png";
                            }
                          }
                        } catch (e) {}

                        return Expanded(
                          child:
                              /*index % 5 == 0
                                  ? createNateveAds(60.0, 300.0)
                                  :*/
                              GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PostView(
                                    L[v][index]['title'],
                                    L[v][index]["content"],
                                    imgUrl,
                                    L[v][index]['titleLink']);
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
                              clipBehavior: Clip.antiAlias,
                              color: Colors.yellow[50],
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Expanded(
                                    child: Column(children: [
                                      imgUrl.toString() != null
                                          ? Image.network(
                                              imgUrl,
                                              width: 100,
                                              height: 100,
                                            )
                                          : Center(
                                              child:
                                                  new CircularProgressIndicator()),
                                      Expanded(
                                          child: Text(L[v][index]['title'])),
                                    ]),
                                  )),
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}

/*
*/
