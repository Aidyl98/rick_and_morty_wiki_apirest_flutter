import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/repository/repository_exporter.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterServiceImplementation characterRepository;
  int page = 1;
  bool isFetching = false;

  CharacterBloc({
    required this.characterRepository,
  }) : super(CharacterInitial());

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is CharacterFetchEvent) {
      try {
        yield const CharacterLoadingState(message: 'Loading Characters');
        final response = await characterRepository.getAllCharacters(page);
        yield CharacterSuccessState(
          character: response.toList(),
        );
        page++;
      } on Exception {
        yield const CharacterErrorState(
            error: "Couldn't fetch characters. Is the device online?");
      }
    }
  }
}
