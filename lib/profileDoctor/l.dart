import 'package:flutter/material.dart';

class MyTabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'تصنيف 1'),
                Tab(text: 'تصنيف 2'),
                Tab(text: 'تصنيف 3'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('محتوى تصنيف 1')),
                  Center(child: Text('محتوى تصنيف 2')),
                  Center(child: Text('محتوى تصنيف 3')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
