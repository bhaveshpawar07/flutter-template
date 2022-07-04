import 'package:dio/dio.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_details.dart';
import 'package:flutter_template/services/pokemon/remote/pokemon_remote_service.dart';

class PokemonRemoteServiceImpl implements PokemonRemoteService {
  final Dio dio;

  PokemonRemoteServiceImpl({required this.dio});

  @override
  Future<RemotePokemonDetails?> searchPokemon(
      {required String searchTerm}) async {
    final response = await dio.get("api/v2/pokemon/$searchTerm");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }

    // return (response.data as List)
    // .map((e) => RemotePokemonDetails.fromJson(e as Map<String,dynamic>))
    // .toList();
  }
}
