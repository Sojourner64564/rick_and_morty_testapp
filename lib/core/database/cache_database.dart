import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty_testapp/core/database/database.dart';
import 'package:path/path.dart' as p;

@lazySingleton
class CacheDatabase extends AppDatabase{
  CacheDatabase(): super(LazyDatabase(() async{
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'cache_card_rick_and_morty.sqlite'));
      return NativeDatabase(file);
    });
  }));
}