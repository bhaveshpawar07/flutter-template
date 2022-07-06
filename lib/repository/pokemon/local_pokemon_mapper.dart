import 'package:drift/drift.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';

abstract class LocalPokemonMapper
    extends Mapper<UIPokemon, LocalPokemonDetailsCompanion> {}

class LocalPokemonMapperImpl extends LocalPokemonMapper {
  @override
  LocalPokemonDetailsCompanion map(UIPokemon from) {
    return LocalPokemonDetailsCompanion(
      date: Value(from.dateTime.toString()),
      height: Value(from.height),
      id: Value(from.pokemonId),
      name: Value(from.name),
      url: Value(from.imgUrl),
      weight: Value(from.weight),
    );
  }
}
