import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_details.dart';

abstract class DomainPokemonMapper
    extends Mapper<RemotePokemonDetails, UIPokemon> {
  UIPokemon mapLocalPokemon(LocalPokemonDetail from);
}

class DomainPokemonMapperImpl extends DomainPokemonMapper {
  @override
  UIPokemon map(RemotePokemonDetails from) {
    return UIPokemon(
        pokemonId: from.id,
        height: from.height,
        name: from.name,
        imgUrl: from.sprites.other.dreamWorld.frontDefault,
        weight: from.weight,
        dateTime: from.dateTime);
  }

  @override
  UIPokemon mapLocalPokemon(LocalPokemonDetail from) {
    return UIPokemon(
        pokemonId: from.id,
        height: from.height,
        name: from.name,
        imgUrl: from.url,
        weight: from.weight,
        dateTime: DateTime.parse(from.date));
  }
}
