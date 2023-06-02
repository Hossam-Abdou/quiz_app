import 'package:flutter/material.dart';

import '../screens/home_page_screen.dart';
import '../screens/levels_screen.dart';
import '../screens/questions_screen.dart';

class RootApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
