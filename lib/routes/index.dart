import 'package:flutter/material.dart';
import 'package:test01/pages/Ad/index.dart';
import 'package:test01/pages/User/login.dart';
import 'package:test01/pages/User/register.dart';
import 'package:test01/pages/User/profile.dart';
import 'package:test01/pages/Main/index.dart';

// 返回app根级组件
Widget getRootWidget() {
  return MaterialApp(
    // 命名路由
    initialRoute: '/ad',
    routes: getRootRoutes(),  
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/ad': (context) => AdPage(),
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/profile': (context) => ProfilePage(),
  };
}