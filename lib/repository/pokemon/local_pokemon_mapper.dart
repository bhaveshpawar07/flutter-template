import 'package:drift/drift.dart';
import 'package:flutter_template/domain/entity/pokemon/pokemon.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';

abstract class LocalPokemonMapper
    extends Mapper<Pokemon, LocalPokemonDetailsCompanion> {}

class LocalPokemonMapperImpl extends LocalPokemonMapper {
  @override
  LocalPokemonDetailsCompanion map(Pokemon from) {
    return LocalPokemonDetailsCompanion(
      date: Value(from.dateTime.toString()),
      height: Value(from.height),
      id: Value(from.id),
      name: Value(from.name),
      url: Value(from.url),
      weight: Value(from.weight),
    );
  }
}
