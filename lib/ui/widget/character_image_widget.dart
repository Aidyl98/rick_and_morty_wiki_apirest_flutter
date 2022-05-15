import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/ui/widget/widget_utils.dart';

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
        child: Image.network(
          characterImage,
          fit: BoxFit.contain,
          loadingBuilder: (context, widget, imageChunkEvent) {
            return imageChunkEvent == null
                ? widget
                : WidgetUtils.buildCircularProgressIndicator(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
