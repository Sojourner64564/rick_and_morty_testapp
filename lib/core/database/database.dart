import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:convert';
import 'dart:io';

part 'database.g.dart';

@DataClassName('ResultTable')
class Result extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get characterId => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get type => text()();
  TextColumn get gender => text()();
  IntColumn get originId => integer().references(Location, #id, onDelete: KeyAction.cascade)(); // каскадное удлание
  IntColumn get locationId => integer().references(Location, #id, onDelete: KeyAction.cascade)();// каскадное удлание
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
    final list =  json.decode(fromDb) as List;
    return list.map((e) => e.toString()).toList();
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

@DriftDatabase(
  tables: [
    Result,
    Location,
  ],
)
class AppDatabase extends _$AppDatabase {
  //TODO поставить сюда настоящую базу данных как будет закончено
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'favorite_card_rick_and_morty.sqlite'));
      return NativeDatabase(file);
    });
  }
}
