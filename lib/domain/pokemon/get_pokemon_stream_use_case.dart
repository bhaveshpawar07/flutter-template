
import 'package:flutter_template/domain/base/usecase/base_stream_use_case.dart';

import '../../foundation/unit.dart';
import '../entity/pokemon/pokemon.dart';

abstract class GetPokemonStreamUseCase extends
    BaseStreamUseCase<Unit,List<Pokemon>> {}