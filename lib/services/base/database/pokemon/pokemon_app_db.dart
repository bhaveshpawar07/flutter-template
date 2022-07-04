import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../../entity/poke_api/local/local_pokemon_details.dart';

part 'pokemon_app_db.g.dart';

@DriftDatabase(
  tables: [LocalPokemonDetails],
)
class PokemonDatabase extends _$PokemonDatabase{
  PokemonDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path,'pokemon_app_db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: FlavorConfig.instance.values.logSqlStatements
    );
  });
}