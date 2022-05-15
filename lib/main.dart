import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/ui/screen/character_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set portrait orientation.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Rick and Morty Character Wiki',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DisplayCharacterScreen(),
      },
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
          fontSize: 40,
          shadows: [
            Shadow(
              color: Color(0xff1faa00),
              blurRadius: 10.0,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              color: Color(0xff64dd17),
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
          color: Colors.grey,
        ),
      ),
    );
  }
}

class CharacterBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
