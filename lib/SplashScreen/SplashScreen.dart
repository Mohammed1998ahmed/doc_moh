import 'package:doctor/Home/main_screen.dart';
import 'package:doctor/OnBording/onbording.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _OnbordingState();
}

class _OnbordingState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // استدعاء دالة لتأخير الانتقال إلى الواجهة الأخرى بعد فترة زمنية
    Future.delayed(Duration(seconds: 2), () {
      CachShpreafapp.getdata(key: "tokenProfile") != null
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Onbording()),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/images (5).jpeg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/Medical research-pana.png',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(2000),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimerWidght(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text2Shimmer(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  text(
                      title: "@ Melenuim 2023. All rights reserved.",
                      color: Color2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ]),
          ),
        )
      ]),
    );
  }

  Shimmer Text2Shimmer() {
    return Shimmer.fromColors(
      baseColor: Color4,
      highlightColor: Color0,
      child: Center(
        child: text(
            title:
                "Unleash the full potential of veterinary expertise with our cutting-edge veterinary consultation application.",
            color: Color2,
            fontSize: 16,
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ShimerWidght extends StatelessWidget {
  const ShimerWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color0,
      highlightColor: Color.fromARGB(75, 71, 181, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 3,
            child: Divider(
              height: 2,
              color: Color0,
              thickness: 2,
            ),
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Color0,
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Color0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: text(
                title: "THI",
                color: Color0,
                fontSize: 31,
                fontWeight: FontWeight.w700),
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Color0,
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Color0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 3,
            child: Divider(
              height: 2,
              color: Color0,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
