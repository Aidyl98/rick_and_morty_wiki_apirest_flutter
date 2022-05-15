part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {
  const CharacterEvent();
}

class CharacterFetchEvent extends CharacterEvent {
  const CharacterFetchEvent();
}
