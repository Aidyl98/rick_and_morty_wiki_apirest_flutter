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
    } on DioError catch (exc) {
      if (exc.response != null) {
        if (exc.response!.statusCode == 404) {
          throw Exception("You have reached the end of the character list.");
        } else {
          throw Exception(exc.response!.statusCode.toString() +
              ": " +
              exc.response!.statusMessage.toString());
        }
      } else {
        throw Exception("Couldn't fetch characters. Is the device online?");
      }
    }
  }
}
