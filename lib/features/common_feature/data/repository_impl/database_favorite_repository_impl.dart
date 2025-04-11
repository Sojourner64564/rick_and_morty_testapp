import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/database/database.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/repository/database_repository.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/location_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

@LazySingleton(as: DatabaseFavoriteRepository)
class DatabaseFavoriteRepositoryImpl implements DatabaseFavoriteRepository {
  DatabaseFavoriteRepositoryImpl(this.appDatabase);

  final AppDatabase appDatabase;

  @override
  Future<List<ResultEntity>> loadFromDB() async{
    try{
      final resultTable = await appDatabase.select(appDatabase.result).get();
      final List<ResultEntity> resultList = [];
      for(final element in resultTable){

        final originLocationStatement = appDatabase.select(appDatabase.location)
          ..where((row)=> row.id.isValue(element.locationId));
        final originTable =  await originLocationStatement.get();
        final originLocationEntity = LocationEntity(
            name: originTable.first.name,
            url: originTable.first.url,
        );

        final locationStatement =  appDatabase.select(appDatabase.location)
          ..where((row)=> row.id.isValue(element.locationId));
        final locationTable =  await locationStatement.get();
        final locationEntity = LocationEntity(
          name: locationTable.first.name,
          url: locationTable.first.url,
        );

        final ResultEntity resultEntity = ResultEntity(
            id: element.characterId,
            name: element.name,
            status:element.status,
            species:element.species,
            type:element.type,
            gender:element.gender,
            origin:originLocationEntity,
            location:locationEntity,
            image:element.image,
            episode:element.episodes,
            url:element.url,
            created:element.created,
        );
        resultList.add(resultEntity);
      }
      return resultList;
    }catch(e){
      throw DataBaseFailure();
    }
  }

  @override
  Future<void> saveToDB(ResultEntity resultEntity) async {
    try {
      final originId = await appDatabase.into(appDatabase.location).insert(
        LocationCompanion.insert(
          name: resultEntity.origin.name,
          url: resultEntity.origin.url,
        )
      );
      final locationId = await appDatabase.into(appDatabase.location).insert(
        LocationCompanion.insert(
          name: resultEntity.location.name,
          url: resultEntity.location.url,
        ),
      );
      await appDatabase.into(appDatabase.result).insert(
        ResultCompanion.insert(
          characterId: resultEntity.id,
          name: resultEntity.name,
          status: resultEntity.status,
          species: resultEntity.species,
          type: resultEntity.type,
          gender: resultEntity.gender,
          originId: originId,
          locationId: locationId,
          image: resultEntity.image,
          episodes: resultEntity.episode,
          url: resultEntity.url,
          created: resultEntity.created,
        ),
      );
    }catch(e){
      throw DataBaseFailure();
    }
  }

  @override
  Future<List<ResultEntity>> loadNameFilteredFromDB(String text) async{
    try{
      final sortedResultTable = appDatabase.select(appDatabase.result)
        ..where((row)=>row.name.lower().like("%${text.trim().toLowerCase()}%"));
      final resultTable = await sortedResultTable.get();
      final List<ResultEntity> resultList = [];
      for(final element in resultTable){

        final originLocationStatement = appDatabase.select(appDatabase.location)
          ..where((row)=> row.id.isValue(element.locationId));
        final originTable =  await originLocationStatement.get();
        final originLocationEntity = LocationEntity(
          name: originTable.first.name,
          url: originTable.first.url,
        );

        final locationStatement =  appDatabase.select(appDatabase.location)
          ..where((row)=> row.id.isValue(element.locationId));
        final locationTable =  await locationStatement.get();
        final locationEntity = LocationEntity(
          name: locationTable.first.name,
          url: locationTable.first.url,
        );

        final ResultEntity resultEntity = ResultEntity(
          id: element.characterId,
          name: element.name,
          status:element.status,
          species:element.species,
          type:element.type,
          gender:element.gender,
          origin:originLocationEntity,
          location:locationEntity,
          image:element.image,
          episode:element.episodes,
          url:element.url,
          created:element.created,
        );
        resultList.add(resultEntity);
      }
      return resultList;
    }catch(e){
      throw DataBaseFailure();
    }
  }

  @override
  Future<List<int>> favoriteIds() async{
    try{
      final resultTable = await appDatabase.select(appDatabase.result).get();
      final List<int> charactersIds = [];
      for(final element in resultTable){
        charactersIds.add(element.characterId);
      }
      return charactersIds;
    }catch(e){
      throw DataBaseFailure();
    }
  }

  @override
  void deleteFromDB(int characterId){
    try{
      appDatabase.delete(appDatabase.result)..where((row)=>row.characterId.isValue(characterId))..go();
    }catch(e){
      throw DataBaseFailure();
    }
  }
}