part of 'character_bloc.dart';

@immutable
abstract class CharacterState {
  const CharacterState();
}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {
  final String message;

  const CharacterLoadingState({
    required this.message,
  });
}

class CharacterSuccessState extends CharacterState {
  final List<CharacterModel> character;

  const CharacterSuccessState({
    required this.character,
  });
}

class CharacterErrorState extends CharacterState {
  final String error;

  const CharacterErrorState({
    required this.error,
  });
}
