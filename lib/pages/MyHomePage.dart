import 'dart:math';

import 'package:blogger/constant.dart';
import 'package:blogger/pages/books.dart';
import 'package:blogger/pages/data2.dart';
import 'package:blogger/pages/webView.dart';
import 'package:blogger/pages/aide.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import 'domande.dart';
import 'slider.dart';

class MyHomePage extends StatefulWidget {
  static final id = 'MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //admob  Bannire ...........................start
  late BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: adUnitIdBannir,
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          myBanner
            ..show(
                anchorType: AnchorType.top,
                //horizontalCenterOffset: 30,
                anchorOffset: 70);
        });
  }

  /// ************ admob bannire end
  ///

  ///les immage Slider et pae defaut

  var productImage10 =
      "https://1.bp.blogspot.com/-4tIuV2vgyvw/YTik09XyWJI/AAAAAAAACls/ulL89YhKW1Uoc9ici7XaX8X1wr5-QPrMQCLcBGAsYHQ/s822/fakkara.png";
  var productImage0 =
      "https://1.bp.blogspot.com/-KNrsHlhaubw/X_4v5Lf8hrI/AAAAAAAABxo/BTza8u0z0MIp9XHVdACjK2DrVsVPE8IqgCLcBGAsYHQ/s1075/20210113_002430.jpg";
  var productImage1 =
      "https://1.bp.blogspot.com/-uh2KvYp9Rqw/YSyXHnZWctI/AAAAAAAACk8/GEN8VAmMYOwG7q1BF3BYSJ_Ab8yB4ItSQCPcBGAYYCw/s872/tacharfto.png";
  var productImage2 =
      "https://1.bp.blogspot.com/-x9oNvB73ix0/YSqhLBYqM2I/AAAAAAAACjg/AzU4_FAVuTMWubWXE7DqN34nmd4onMozwCPcBGAYYCw/s678/hhhhh.png";
  var productImage3 =
      "https://1.bp.blogspot.com/-eZGlWsLUbWg/YB_BqaXbqQI/AAAAAAAAB18/_gRTycDkHEAu0kD8YQq2H4j6DNMKQ825wCPcBGAYYCw/s540/FB_IMG_16124900660733782.jpg";
  var productImage4 =
      "https://1.bp.blogspot.com/-auxug5gkPes/YCmJSdD13VI/AAAAAAAAB_c/AjjAY3tf3_0vdIguK_EfQl8nWey-OhLFQCLcBGAsYHQ/s770/2-11.webp";
  var productImage5 =
      "https://1.bp.blogspot.com/-rYCSVIb3Aqw/YFcpXvg8I0I/AAAAAAAACJg/XuI4VB4VBoAcUYIow1qhT_tQDuC2Uuw-ACLcBGAsYHQ/s1028/IMG_20210321_120841.jpg";
  var productImage6 =
      "https://1.bp.blogspot.com/-4ebI7M3uKAE/YSkn5WhaCVI/AAAAAAAACi4/6-Z8_A3CaZkC5OgqcTTzKaH0lv2bRUTRgCPcBGAYYCw/s538/sssssss.png";
  var productImage7 =
      "https://1.bp.blogspot.com/-6LCA9exB798/YAHyB8ELeGI/AAAAAAAAAW4/uOFsOGwnCcUllI1GMAwwpdJYj_Cfxps8gCLcBGAsYHQ/s936/Screenshot_20210115_205009.jpg";
  var productImage8 =
      "https://1.bp.blogspot.com/-IOu6yH-FZTw/YUD1csjKUFI/AAAAAAAACmo/YPgzs-XbhroP-aaTHtw8GybVrOpTFaxfACLcBGAsYHQ/s998/9imam.png";
  var productImage9 =
      "https://1.bp.blogspot.com/-k2Lpdn9IHIs/X_xqx3qUi5I/AAAAAAAAAQs/ycz-_VT4R_gx5FIBZPUbX5HBm0CIxGb2QCLcBGAsYHQ/s242/images%2B%25285%2529.jpeg";

////////////////////////////////////

///// native Ads*************************** start
  final _controller = NativeAdmobController();
  Widget createNateveAds(h, w) {
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

  //initialization
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        //
        .initialize(appId: appId);
    myBanner = buildBannerAd()..load();
  }

  @override
  Widget build(BuildContext context) {
    Navig(line, tit) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return webView(line, tit);
      }));
      //show intersisial
      myInterstitial
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0,
        );
      //////
    }

    void NavigatorToPage(page) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    }

    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        backgroundColor: Colors.cyan,
        title: new Text("روايتي_Riwayati"),
      ),
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
                            NavigatorToPage(Books(V: 0));
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
                                'كتبي(الطراز الجديد)',
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
                            NavigatorToPage(Books(V: Random().nextInt(9)));
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
                                'المفضلة',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
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
                              SizedBox(
                                height: 20,
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
                                Icons.ad_units,
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
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /////slider
            Silder(size: 400),
            SingleChildScrollView(
              child: Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1eyeqWRVjTDKB3qxTLap_UBR9dmaq1572/view",
                            "فكر وازداد ثراء");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage10),
                              ),
                            ),
                            Text("فكر وازداد ثراء")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/19PXx2JvWkWU8YE6yInZ2UMtZpNRnADu9/view?usp=sharing",
                            "تشرفت برحيلك");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage1),
                              ),
                            ),
                            Expanded(child: Text("تشرفت برحيلك"))
                          ],
                        ),
                      ),
                    ),
                    createNateveAds(150.0, 150.0),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1N5NecFnZWFwYBtw7-zxTqY3cmEPuMGVV/view?usp=sharing",
                            "الأم في أدب غسان");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage2),
                              ),
                            ),
                            Text("الأم في أدب غسان")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/14yNtbqNbevsiRa4okjQNyMhyYtzQUgcd/view?usp=sharing",
                            " فن اللامبلاة");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage3),
                              ),
                            ),
                            Text(" فن اللامبلاة")
                          ],
                        ),
                      ),
                    ),
                    createNateveAds(150.0, 150.0),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/134H11g0T7KUoVMROac9oN5AQl-2MG5mq/view?usp=drivesdk",
                            "لوكاندة بير الوطاويط");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage4),
                              ),
                            ),
                            Text("لوكاندة بير الوطاويط")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1gxCwiYVo1o4g9ieIYTjydyEuSV3h6rTK/view?usp=sharing",
                            "الأسير ");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage5),
                              ),
                            ),
                            Text("الأسير ")
                          ],
                        ),
                      ),
                    ),
                    createNateveAds(150.0, 150.0),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1HWWV4fMh3j7cn-AxKM5-LGSGaNEZhiy5/view?usp=sharing",
                            " فقط أنصت ");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage6),
                              ),
                            ),
                            Text(" فقط أنصت ")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1vz3duh69yHqatnYArxRj8Ti5qkb9pmFV/view",
                            "عزيزي أنا");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage7),
                              ),
                            ),
                            Text("عزيزي أنا")
                          ],
                        ),
                      ),
                    ),
                    createNateveAds(150.0, 150.0),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1jL5MfkwSFnM9I9U0g1E1RddX_MCvmTe7/view?usp=drivesdk",
                            "قمم تهوى النجاح");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage8),
                              ),
                            ),
                            Text("قمم تهوى النجاح")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1qFUVyiiUIM80wXieoEve7eTQ8xYA5hlO/view",
                            "خذها بقوة");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage9),
                              ),
                            ),
                            Text("خذها بقوة")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navig(
                            "https://drive.google.com/file/d/1DzR40tDgwURMFAMuPR0fhQqJ_q0De2DM/view",
                            "#44 حب الحياة");
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.yellow[50],
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(productImage0),
                              ),
                            ),
                            Text("#44 حب الحياة")
                          ],
                        ),
                      ),
                    ),
                    createNateveAds(150.0, 150.0),
                  ],
                ),
              ),
            ),
            createNateveAds(300.0, double.infinity),
          ],
        )),
      ),
    );
  }
}
