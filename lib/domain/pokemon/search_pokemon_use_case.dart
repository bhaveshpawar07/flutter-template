
import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';

import '../entity/pokemon/pokemon.dart';

abstract class SearchPokemonUseCase extends
    BaseAsyncUseCase<String,List<Pokemon>>{}