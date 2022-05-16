import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';

class DisplayCharacterScreen extends StatelessWidget {
  const DisplayCharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(characterRepository: CharacterServiceImplementation())
            ..add(const CharacterFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            'Rick and Morty Character Wiki',
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
          ),
        ),
        drawer: UIDrawer(),
        body: const CharacterBody(),
      ),
    );
  }
}
