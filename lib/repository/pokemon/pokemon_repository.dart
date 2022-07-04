import 'package:flutter_template/domain/entity/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> searchPokemon({required String searchTerm});
  Future<void> savePokemonDetails({required Pokemon pokemon});
  Stream<List<Pokemon>> getSavedPokemons();
}
