import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';

abstract class PokemonLocalService {
  Future<LocalPokemonDetail?> getLocalPokemon({required String searchTerm});
  Future<void> savePokemonDetails(
      {required LocalPokemonDetailsCompanion pokemon});
}
