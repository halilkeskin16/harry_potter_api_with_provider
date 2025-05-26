import 'package:dio/dio.dart';
import 'package:harry_potter_api/core/const/api_constanse.dart';
import '../../models/character.dart';

class CharacterService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {'Content-Type': 'application/json'},
  ));

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await _dio.get(ApiConstants.charactersEndpoint);
      final data = response.data as List;
      return data.map((e) => Character.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Karakterleri getirirken hata oluştu: $e');
    }
  }
}
