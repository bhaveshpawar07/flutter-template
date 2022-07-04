import 'package:flutter_template/domain/entity/pokemon/pokemon.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_details.dart';

abstract class DomainPokemonMapper
    extends Mapper<RemotePokemonDetails, Pokemon> {
  Pokemon mapLocalPokemon(LocalPokemonDetail from);
}

class DomainPokemonMapperImpl extends DomainPokemonMapper {
  @override
  Pokemon map(RemotePokemonDetails from) {
    return Pokemon(
        id: from.id,
        height: from.height,
        name: from.name,
        url: from.sprites.other.dreamWorld.frontDefault,
        weight: from.weight,
        dateTime: from.dateTime);
  }

  @override
  Pokemon mapLocalPokemon(LocalPokemonDetail from) {
    return Pokemon(
        id: from.id,
        height: from.height,
        name: from.name,
        url: from.url,
        weight: from.weight,
        dateTime: DateTime.parse(from.date));
  }
}
