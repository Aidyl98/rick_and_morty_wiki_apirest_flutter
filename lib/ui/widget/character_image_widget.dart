import 'package:flutter/material.dart';

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
                : CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                    strokeWidth: 8,
                  );
          },
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
