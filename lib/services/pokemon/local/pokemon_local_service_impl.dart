
import 'package:drift/drift.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';
import 'package:flutter_template/services/entity/poke_api/local/local_pokemon_details.dart';
import './pokemon_local_service.dart';

part 'pokemon_local_service_impl.g.dart';
@DriftAccessor(tables: [LocalPokemonDetails])
class PokemonLocalServiceImpl extends DatabaseAccessor<PokemonDatabase>
      with _$PokemonLocalServiceImplMixin
      implements PokemonLocalService{
  PokemonLocalServiceImpl(PokemonDatabase attachedDb):super(attachedDb);

  @override
  Stream<List<LocalPokemonDetail>> getLocalPokemon() {
    return select(localPokemonDetails).watch();
  }

  @override
  Future<void> savePokemonDetails({required LocalPokemonDetailsCompanion pokemon}) {
    return into(localPokemonDetails).insert(pokemon,mode: InsertMode.insertOrReplace);
  }
}