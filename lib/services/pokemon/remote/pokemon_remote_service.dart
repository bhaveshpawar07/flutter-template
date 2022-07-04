import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_details.dart';

abstract class PokemonRemoteService {
  Future<RemotePokemonDetails> searchPokemon({required String searchTerm});
}
