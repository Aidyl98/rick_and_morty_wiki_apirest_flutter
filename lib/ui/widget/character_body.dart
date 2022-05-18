import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';

class CharacterBody extends StatefulWidget {
  const CharacterBody({Key? key}) : super(key: key);

  @override
  _CharacterBodyState createState() => _CharacterBodyState();
}

class _CharacterBodyState extends State<CharacterBody> {
  final List<CharacterModel> _character = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: BlocConsumer<CharacterBloc, CharacterState>(
        listener: (context, characterState) {
          // Loading Data.
          if (characterState is CharacterLoadingState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: WidgetUtils.buildInfoText(
                  text: characterState.message,
                  context: context,
                  size: size,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            );
            // Get Data, end of the list.
          } else if (characterState is CharacterSuccessState &&
              characterState.character.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: WidgetUtils.buildInfoText(
                  text: 'No more characters',
                  context: context,
                  size: size,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            );
            // Get Data Error.
          } else if (characterState is CharacterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: WidgetUtils.buildInfoText(
                  text: characterState.error,
                  context: context,
                  size: size,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return;
        },
        builder: (context, characterState) {
          // Loading Data
          if (characterState is CharacterInitial ||
              characterState is CharacterLoadingState && _character.isEmpty) {
            return WidgetUtils.buildCircularProgressIndicator(context);
            // Add the fetched data to the list.
          } else if (characterState is CharacterSuccessState) {
            _character.addAll(characterState.character);
            ScaffoldMessenger.of(context).clearSnackBars();
            // Error View.
          } else if (characterState is CharacterErrorState &&
              _character.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Reload recuest.
                IconButton(
                  iconSize: size.width / 5,
                  color: Theme.of(context).colorScheme.secondary,
                  splashColor: Theme.of(context).colorScheme.background,
                  tooltip: "Try to fetch the data.",
                  onPressed: () {
                    BlocProvider.of<CharacterBloc>(context)
                        .add(const CharacterFetchEvent());
                  },
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
                // Show text error.
                const SizedBox(height: 15),
                WidgetUtils.buildInfoText(
                  text: characterState.error,
                  context: context,
                  size: size,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<CharacterBloc>(context).isFetching) {
                  BlocProvider.of<CharacterBloc>(context).fetch();
                }
              }),
            itemBuilder: (context, index) {
              return _buildOpenContainer(index, size);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: _character.length,
          );
        },
      ),
    );
  }

  _buildOpenContainer(int index, Size size) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(index, size),
        openBuilder: (context, action) => _buildOpen(index),
        closedColor: Theme.of(context).colorScheme.primary,
        middleColor: Theme.of(context).colorScheme.background,
      ),
    );
  }

  // Tile that shows the list of characters.
  _buildClosed(int index, Size size) {
    return Card(
      child: ListTile(
        // Character Image Avatar.
        leading: CharacterImageWidget(
          characterImage: _character[index].image,
        ),
        // Character Name.
        title: WidgetUtils.buildInfoText(
          text: _character[index].name,
          context: context,
          size: size,
          maxLines: 1,
        ),

        // Character Status.
        subtitle: Row(
          children: [
            WidgetUtils.buildIndicatorText(
              _character[index].status == 'unknown'
                  ? 'Unknown'
                  : _character[index].status,
              context,
              size,
            ),
            WidgetUtils.buildIndicatorText(
              '#${index + 1}',
              context,
              size,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }

  // Shows the Detail Screen of the selected character.
  _buildOpen(int index) {
    return CharacterDetailScreen(character: _character[index]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
