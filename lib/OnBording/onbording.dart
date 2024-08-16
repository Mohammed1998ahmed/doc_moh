import 'package:doctor/Login/login.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatefulWidget {
  Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _W1State();
}

class _W1State extends State<Onbording> {
  int currentindex = 0;

  final controller = PageController();
  final controller1 = PageController();

  int currentPage = 0;
  int currentPage1 = 0;
  bool isbutton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          imageBackground,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.48,
                child: PageView(
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                      //  currentPage = page;
                      isbutton = currentPage == 2;
                    });
                  },
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Image.asset(
                            pages[0].nameimage.toString(),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Image.asset(
                            pages[1].nameimage.toString(),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Image.asset(
                            pages[2].nameimage.toString(),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotWidth: 12,
                        dotHeight: 10,
                        dotColor: Color4,
                        activeDotColor: Color0,
                      ), // يمكنك استخدام أي تأثير تفضيلي هنا
                    ),
                  ],
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,

                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller1,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage1 = index;
                      isbutton = currentPage1 == 2;
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: text(
                                    title:
                                        "Guiding noble steeds to health and vitality, veterinary consultations for majestic horses are a testament to our unwavering dedication.",
                                    color: Color0,
                                    fontSize: 22,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                // SizedBox(
                                //   height: 6,
                                // ),
                                // text(
                                //   title:
                                //       "Through expert veterinary consultations, we safeguard the grace and strength of magnificent horses, ensuring their well-being and enduring legacy.",
                                //   color: Color2,
                                //   fontSize: 15,
                                //   fontWeight: FontWeight.w400,
                                // ),
                                // Text(
                                //   "Find, book, auctions and horses.",
                                //   style: TextStyle(
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color.fromRGBO(0, 0, 0, 1)),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: text(
                                    title:
                                        "Through expert veterinary consultations, we safeguard the grace and strength of magnificent horses, ensuring their well-being and enduring legacy.",
                                    color: Color0,
                                    textAlign: TextAlign.center,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 6,
                                // ),
                                // Container(
                                //   width:
                                //       MediaQuery.of(context).size.width * 0.8,
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.4,
                                //   child: text(
                                //     title:
                                //         "Choose our Training sessions and auctions offer price Package that fit you.",
                                //     color: Color2,
                                //     textAlign: TextAlign.center,
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: text(
                                    title:
                                        "Harnessing the power of veterinary expertise, we empower elite horses to conquer obstacles, galloping towards peak performance and unrivaled achievements.",
                                    color: Color0,
                                    fontSize: 22,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 6,
                                // ),
                                // text(
                                //   title:
                                //       "Book an appointment for Training sessions.",
                                //   color: Color2,
                                //   textAlign: TextAlign.center,
                                //   fontSize: 15,
                                //   fontWeight: FontWeight.w400,
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              isbutton
                  ? ButtonStaic(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => LoginW(),
                          ),
                        );
                        // يتم تنفيذ هذا الكود عند النقر على الزر
                        print('تم النقر على الزر!' +
                            currentPage.toString() +
                            currentPage1.toString());
                      },
                      widthContainer: MediaQuery.of(context).size.width * 0.30,
                      heightContainer: 50.0,
                      context: context,
                      title: "Get Started",
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonStaic(
                            onTap: () {
                              if (currentPage < 2 && currentPage1 < 2) {
                                controller.animateToPage(
                                  currentPage + 1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                controller1.animateToPage(
                                  currentPage1 + 1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                controller.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                controller1.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                              // يتم تنفيذ هذا الكود عند النقر على الزر
                              print('تم النقر على الزر!');
                            },
                            widthContainer:
                                MediaQuery.of(context).size.width * 0.30,
                            heightContainer: 50.0,
                            title: "Next",
                            context: context,
                          ),
                          Spacer(),
                          isbutton
                              ? Container()
                              : ElevatedButton(
                                  style: ButtonStyle(
                                    // تغيير عرض الزر
                                    minimumSize: MaterialStateProperty.all(
                                        Size(100, 50)),
                                    // تغيير لون الزر
                                    backgroundColor:
                                        MaterialStateProperty.all(Color3),
                                    // تغيير تأثير الظل
                                    elevation: MaterialStateProperty.all(10),
                                    // تحكم بحواف الزر
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Color3),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            LoginW(),
                                      ),
                                    );
                                  },
                                  child: text(
                                      title: 'Skip',
                                      fontSize: 18,
                                      color: Colors.black)),
                        ],
                      ),
                    ),
            ]),
          ),
        )
      ]),
    );
  }
}
