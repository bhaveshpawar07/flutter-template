import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';

abstract class PokemonRepository {
  Future<UIPokemon?> searchPokemon({required String searchTerm});
  Future<void> savePokemonDetails({required UIPokemon pokemon});
  Future<UIPokemon?> getSavedPokemons({required String searchTerm});
}
