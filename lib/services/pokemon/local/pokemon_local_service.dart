import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';

abstract class PokemonLocalService {
  Stream<List<LocalPokemonDetail>> getLocalPokemon();
  Future<void> savePokemonDetails({required LocalPokemonDetailsCompanion pokemon});
}