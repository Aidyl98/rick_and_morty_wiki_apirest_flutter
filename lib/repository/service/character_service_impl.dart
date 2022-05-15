import 'package:dio/dio.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/repository/api_constants.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/repository/model/character_model.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/repository/service/character_service.dart';

class CharacterServiceImplementation extends CharacterService {
  static final Dio _dio = Dio();

  @override
  Future<List<CharacterModel>> getAllCharacters(int page) async {
    try {
      List<Map<String, dynamic>> allEntities = [];

      // Get object info and pagination.
      var response = await _dio.get(ApiConstants.baseURL +
          ApiConstants.characterEndpoint +
          ApiConstants.pageEndpoint +
          '$page');

      allEntities
          .addAll(List<Map<String, dynamic>>.from(response.data["results"]));

      return List<CharacterModel>.from(
          allEntities.map((x) => CharacterModel.fromJson(x)));
    } on DioError {
      rethrow;
    }
  }
}
