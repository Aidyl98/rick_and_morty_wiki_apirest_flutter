import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';
import 'package:url_launcher/url_launcher.dart';

class UIDrawer extends StatelessWidget {
  UIDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconsSize = size.width / 13;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent, //pa si por si acaso
          image: DecorationImage(
            image: AssetImage('assets/images/drawer.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListTile(
                context: context,
                size: size,
                title: "GitHub.",
                leading: Icon(
                  FontAwesomeIcons.github,
                  size: iconsSize,
                ),
                tapHandler: () =>
                    _openURL("https://github.com/Aidyl98", context),
              ),
              _buildListTile(
                context: context,
                size: size,
                title: "LinkeIn.",
                leading: Icon(
                  FontAwesomeIcons.linkedin,
                  size: iconsSize,
                ),
                tapHandler: () => _openURL(
                    "https://www.linkedin.com/in/aidyl-albalah", context),
              ),
              _buildListTile(
                context: context,
                size: size,
                title: "HackerRanck.",
                leading: Icon(
                  FontAwesomeIcons.hackerrank,
                  size: iconsSize,
                ),
                tapHandler: () => _openURL(
                    "https://www.hackerrank.com/jgarciaalbalah", context),
              ),
              _buildListTile(
                context: context,
                size: size,
                title: "Gmail.",
                leading: Icon(
                  FontAwesomeIcons.google,
                  size: iconsSize,
                ),
                tapHandler: () =>
                    _openURL("mailto:jgarciaalbalah@gmail.com", context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openURL(String url, BuildContext context) async {
    if (!await launch(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: WidgetUtils.buildInfoText(
            text:
                "Error tratando de abrir la URL $url, es probable que el dispositivo no soporte la opción de abrir URls externas.",
            context: context,
            size: MediaQuery.of(context).size,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  _buildListTile({
    required String title,
    required Widget leading,
    required Function tapHandler,
    required Size size,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height / 75,
        horizontal: 2.0,
      ),
      child: ListTile(
        leading: leading,
        minLeadingWidth: size.width / 25,
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: size.width / 20,
            shadows: [
              Shadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 10.0,
                offset: const Offset(3.0, 3.0),
              ),
              Shadow(
                color: Theme.of(context).colorScheme.background,
                blurRadius: 10.0,
                offset: const Offset(-3.0, 3.0),
              ),
            ],
          ),
        ),
        onTap: () => tapHandler(),
      ),
    );
  }
}
