import 'dart:math';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Silder extends StatefulWidget {
  double size;
  Silder({required this.size});

//les immage Slider et pae defaut

  @override
  _SilderState createState() => _SilderState();
}

class _SilderState extends State<Silder> {
  int namberBook = 0;
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

  @override
  Widget build(BuildContext context) {
    final imageList = [
      productImage0,
      productImage1,
      productImage2,
      productImage3,
      productImage4,
      productImage5,
      productImage6,
      productImage7,
      productImage8,
      productImage9,
      productImage10,
    ];

    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
          ),
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    image: NetworkImage(imageList[namberBook]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: widget.size,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, next) {
                setState(() {
                  namberBook = Random().nextInt(9);
                });
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
