import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Character Wiki',
      debugShowCheckedModeBanner: true,
      theme: _buildTheme(),
      home: Container(),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default brightness and colors.
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color(0xff212121),
        secondary: Color(0xff1faa00),
        background: Color(0xff484848),
      ),

      // Define the default font family.
      fontFamily: "AkayaTelivigala",

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        // Use for the name of the character in detail-view.
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),

        // Use for the name of the app in app-bar.
        headline6: TextStyle(
          fontSize: 30,
          color: Color(0xff2a3762),
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10.0,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              color: Colors.red,
              blurRadius: 10.0,
              offset: Offset(-3.0, 3.0),
            ),
          ],
        ),

        // Use for the name of the character in list-view.
        subtitle1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),

        // Use for the status and number of the character in list-view.
        subtitle2: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
