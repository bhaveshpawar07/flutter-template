import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';

import '../../presentation/entity/pokemon/ui_pokemon.dart';

abstract class SearchPokemonUseCase
    extends BaseAsyncUseCase<String, UIPokemon?> {}
