import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizeBoxHeight = size.height / 120;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Stack(
            children: [
              Column(
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
                  SizedBox(height: sizeBoxHeight),

                  AutoSizeText(
                    'Character Details',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: size.width / 14,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                  ),

                  // Gender Info.
                  WidgetUtils.buildIndicatorText('Gender:', context, size),
                  WidgetUtils.buildInfoText(
                    text: character.gender,
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),

                  // Species Info.
                  SizedBox(height: sizeBoxHeight),
                  WidgetUtils.buildIndicatorText('Species:', context, size),
                  WidgetUtils.buildInfoText(
                    text: character.species,
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),

                  // Last known location Info.
                  SizedBox(height: sizeBoxHeight),
                  WidgetUtils.buildIndicatorText(
                      'Last known location:', context, size),
                  WidgetUtils.buildInfoText(
                    text: character.location.name == 'unknown'
                        ? 'Uknown'
                        : character.location.name,
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),

                  // Origin Info.
                  SizedBox(height: sizeBoxHeight),
                  WidgetUtils.buildIndicatorText('Origin:', context, size),
                  WidgetUtils.buildInfoText(
                    text: character.origin.name == 'unknown'
                        ? 'Uknown'
                        : character.origin.name,
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),
                ],
              ),
              const Positioned(
                top: 5,
                left: 5,
                child: BackButton(color: Colors.white),
              ),
            ],
          ),
        ),
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
        WidgetUtils.buildInfoText(
          text: character.status == 'unknown' ? 'Unknown' : character.status,
          context: context,
          size: size,
        ),
      ],
    );
  }

  _buildCharacterImage(
    String characterImage,
    Size size,
  ) {
    return SizedBox(
      width: double.infinity,
      height: size.height / 3.2,
      child: Container(
        alignment: const Alignment(0.0, 2.5),
        child: CharacterImageWidget(
          characterImage: characterImage,
          radiusImage: size.height / 10,
        ),
      ),
    );
  }
}
