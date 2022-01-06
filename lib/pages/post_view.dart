import 'package:blogger/pages/webView.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  var desc, title, image, titleLink;

  PostView(
    String title,
    var desc,
    String image,
    String titleLink,
  ) {
    this.desc = desc;
    this.title = title;
    this.image = image;
    this.titleLink = titleLink;
  }

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
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
  }

  /// ************ admob bannire end
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: new SingleChildScrollView(
              child: new Column(
        children: <Widget>[
          new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
            child: new Container(
              width: 500.0,
              height: 300.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    //check if the image is not null (length > 5) only then check imgUrl else display default img
                    image: new NetworkImage(widget.image.toString().length > 10
                        ? widget.image.toString()
                        : "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
              ),
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: new Text(
              widget.title,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            margin: EdgeInsets.all(10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: new Text(
                widget.desc,
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                  fontSize: 14.4,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[200],
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return webView(widget.titleLink, widget.title);
                }));
              },
              color: Colors.blue[200],
              child: Text('التحميل'),
            ),
          ),
          Container(
            color: Colors.yellow[50],
            height: 60,
          )
        ],
      ))),
    );
  }
}
