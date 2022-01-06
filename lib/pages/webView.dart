import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatefulWidget {
  var urlView;
  var title;
  webView(var urlView, var title) {
    this.urlView = urlView;
    this.title = title;
  }

  @override
  _WebviewExampleState createState() => _WebviewExampleState();
}

class _WebviewExampleState extends State<webView> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-5140570452528708~4613577017");
    myBanner = buildBannerAd()..load();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  /// ************ admob bannire end
  ///

  num position = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IndexedStack(index: position, children: <Widget>[
          widget.urlView != null
              ? WebView(
                  initialUrl: widget.urlView,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageStarted: (value) {
                    setState(() {
                      position = 1;
                    });
                  },
                  onPageFinished: (value) {
                    setState(() {
                      position = 0;
                    });
                  },
                )
              : Center(
                  child: Column(
                    children: [
                      Text(
                        'هذا الكتاب غير مرخص لنا نشره في الوقت الحالي',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          color: Colors.blueAccent,
                          width: 120,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back),
                                color: Colors.black,
                                iconSize: 20,
                              ),
                              Text("عودة")
                            ],
                          ))
                    ],
                  ),
                ),
          Container(
            child: Center(child: CircularProgressIndicator()),
          )
        ]));
  }
}
