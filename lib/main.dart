import 'package:daegu_fc_angel/bottombar.dart';
import 'package:daegu_fc_angel/main_home.dart';
import 'package:flutter/material.dart';

// 화면 비율 = 360*640

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter test project',
      home: MainList(),
    );
  }
}

class MainList extends StatelessWidget {
  const MainList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          Center(
            child: HomePage()
          ),
          Center(
            child: Text('일정 화면'),
          ),
          Center(
            child: Text('나의 정보 화면'),
          ),
          Center(
            child: Text('엔젤클럽 안내 화면'),
          ),
        ]),
        bottomNavigationBar: BottomBar(),
      )
    );
  }
}
