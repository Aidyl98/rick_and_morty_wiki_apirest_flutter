import 'package:rick_and_morty_wiki_apirest_flutter/repository/model/character_model.dart';

abstract class CharacterService {
  Future<List<CharacterModel>> getAllCharacters(int page);
}
