import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';

class CharacterImageWidget extends StatelessWidget {
  final String characterImage;
  final double radiusImage;

  const CharacterImageWidget({
    Key? key,
    required this.characterImage,
    this.radiusImage = 30,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusImage,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: characterImage,
          placeholder: (context, url) =>
              WidgetUtils.buildCircularProgressIndicator(context),
          errorWidget: (context, url, error) => CircleAvatar(
            radius: radiusImage,
            child: const ClipOval(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image_error.png'),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
