import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:convert';
import 'dart:io';

part 'database.g.dart';

/*@DataClassName('EpisodeTable')
class Character extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get infoId => integer().references(Info, #id)();
  IntColumn get resultId0 => integer().references(Result, #id)();
}
@DataClassName('InfoTable')
class Info extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get count => integer()();
  IntColumn get pages => integer()();
  TextColumn get next => text()();
  TextColumn get prev => text()();
}*/
@DataClassName('ResultTable')
class Result extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get characterId => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get type => text()();
  TextColumn get gender => text()();
  IntColumn get originId => integer().references(Location, #id)();
  IntColumn get locationId => integer().references(Location, #id)();
  TextColumn get image => text()();
  TextColumn get episodes => text().map(const StringListConverter())();
  TextColumn get url => text()();
  TextColumn get created => text()();
}
@DataClassName('LocationTable')
class Location extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get url => text()();
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();
  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return json.decode(fromDb) as List<String>;
  }
  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}

@override
MigrationStrategy get migration {
  return MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
    },
  );
}

@lazySingleton
@DriftDatabase(
  tables: [
 /*   Character,
    Info,*/
    Result,
    Location,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'rick_and_morty.sqlite'));
      return NativeDatabase(file);
    });
  }
}
