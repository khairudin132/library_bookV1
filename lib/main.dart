import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:library_book/router/router.dart';
import 'package:library_book/states/current_user.dart';
import 'package:library_book/theme/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = LibraryRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: OurTheme().buildTheme(),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
