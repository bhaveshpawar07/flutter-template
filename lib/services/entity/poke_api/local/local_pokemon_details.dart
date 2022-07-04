import 'package:drift/drift.dart';

class LocalPokemonDetails extends Table{
  IntColumn get id => integer()();
  IntColumn get height => integer()();
  TextColumn get name => text()();
  TextColumn get url => text()();
  IntColumn get weight => integer()();
  TextColumn get date => text()();

  @override
  Set<Column> get primaryKey => {id};
}