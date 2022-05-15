import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/ui/widget/character_image_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/detail_view.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: _buildCharacterImage(character.image, size),
            ),
            SizedBox(
              height: size.height / 12,
            ),

            // Character Name.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText(
                character.name,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: size.width / 9,
                    ),
                maxLines: 1,
              ),
            ),

            // Status Info.
            _buildStatusInfoText(context, size),

            // Gender Info.
            const SizedBox(height: 15),
            _buildIndicatorText('Gender:', context, size),
            _buildInfoText(character.gender, context, size),

            // Species Info.
            const SizedBox(height: 10),
            _buildIndicatorText('Species:', context, size),
            _buildInfoText(character.species, context, size),

            // Last known location Info.
            const SizedBox(height: 10),
            _buildIndicatorText('Last known location:', context, size),
            _buildInfoText(
              character.location.name == 'unknown'
                  ? 'Uknown'
                  : character.location.name,
              context,
              size,
            ),

            // Origin Info.
            const SizedBox(height: 10),
            _buildIndicatorText('Origin:', context, size),
            _buildInfoText(
              character.origin.name == 'unknown'
                  ? 'Uknown'
                  : character.origin.name,
              context,
              size,
            ),
          ],
        ),
      ),
    );
  }

  _buildInfoText(
    String text,
    BuildContext context,
    Size size,
  ) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: size.width / 15,
          ),
    );
  }

  _buildIndicatorText(
    String text,
    BuildContext context,
    Size size,
  ) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontSize: size.width / 14,
          ),
    );
  }

  _buildStatusInfoText(
    BuildContext context,
    Size size,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: character.status == 'Alive'
                ? Colors.green
                : character.status == 'Dead'
                    ? Colors.red
                    : Colors.grey,
          ),
        ),
        const SizedBox(width: 5),
        _buildInfoText(
          character.status == 'unknown' ? 'Unknown' : character.status,
          context,
          size,
        ),
      ],
    );
  }

 
}
