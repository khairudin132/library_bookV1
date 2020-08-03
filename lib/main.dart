import 'package:flutter/material.dart';
import 'package:library_book/screen/root/root.dart';
import 'package:library_book/states/current_user.dart';
import 'package:library_book/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: OurTheme().buildTheme(),
        home: OurRoot(),
      ),
    );
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: OurTheme().buildTheme(),
//      home: HomeScreen(),
//    );
  }
}
