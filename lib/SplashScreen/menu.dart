import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Curved Boxes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Curved Boxes'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 100.0,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.0),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 100.0,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20.0),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 100.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(100.0, 100);
    path.lineTo(size.width * 10, size.height * 10);
    path.lineTo(size.width * 10, size.height * 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
