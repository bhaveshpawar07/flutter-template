import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';

abstract class GetPokemonStreamUseCase
    extends BaseAsyncUseCase<String, UIPokemon?> {}
