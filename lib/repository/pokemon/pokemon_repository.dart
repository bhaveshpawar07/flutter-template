import 'package:flutter_template/domain/entity/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon?> searchPokemon({required String searchTerm});
  Future<void> savePokemonDetails({required Pokemon pokemon});
  Future<Pokemon?> getSavedPokemons({required String searchTerm});
}
