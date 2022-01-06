import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import '../constant.dart';

class Aider extends StatefulWidget {
  static final id = 'Aider';
  @override
  _AiderState createState() => _AiderState();
}

class _AiderState extends State<Aider> {
  //admob  Bannire ...........................start
  late BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: adUnitIdBannir,
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          myBanner
            ..show(
              anchorType: AnchorType.top,
              anchorOffset: 20,
            );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: appId);
    myBanner = buildBannerAd()..load();
  }

  /// ************ admob bannire end

  ///// native Ads*************************** start
  final _controller = NativeAdmobController();
  Widget createNateveAds() {
    NativeAdmob nativeAdmob = NativeAdmob(
      adUnitID: adUnitIDNativ,
      controller: _controller,
    );
    return Container(
      width: 150,
      height: 150,
      child: nativeAdmob,
    );
  }
//native ads *********** end****************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.yellow,
              width: double.infinity,
              height: 120,
              child: createNateveAds());
        },
      ),
    ));
  }
}
