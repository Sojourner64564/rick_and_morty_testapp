// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocationTable extends Location
    with TableInfo<$LocationTable, LocationTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location';
  @override
  VerificationContext validateIntegrity(Insertable<LocationTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
    );
  }

  @override
  $LocationTable createAlias(String alias) {
    return $LocationTable(attachedDatabase, alias);
  }
}

class LocationTable extends DataClass implements Insertable<LocationTable> {
  final int id;
  final String name;
  final String url;
  const LocationTable(
      {required this.id, required this.name, required this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    return map;
  }

  LocationCompanion toCompanion(bool nullToAbsent) {
    return LocationCompanion(
      id: Value(id),
      name: Value(name),
      url: Value(url),
    );
  }

  factory LocationTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
    };
  }

  LocationTable copyWith({int? id, String? name, String? url}) => LocationTable(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );
  LocationTable copyWithCompanion(LocationCompanion data) {
    return LocationTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.url == this.url);
}

class LocationCompanion extends UpdateCompanion<LocationTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> url;
  const LocationCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
  });
  LocationCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String url,
  })  : name = Value(name),
        url = Value(url);
  static Insertable<LocationTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
    });
  }

  LocationCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? url}) {
    return LocationCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $ResultTable extends Result with TableInfo<$ResultTable, ResultTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
      'character_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originIdMeta =
      const VerificationMeta('originId');
  @override
  late final GeneratedColumn<int> originId = GeneratedColumn<int>(
      'origin_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES location (id) ON DELETE CASCADE'));
  static const VerificationMeta _locationIdMeta =
      const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES location (id) ON DELETE CASCADE'));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _episodesMeta =
      const VerificationMeta('episodes');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> episodes =
      GeneratedColumn<String>('episodes', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($ResultTable.$converterepisodes);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<String> created = GeneratedColumn<String>(
      'created', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        characterId,
        name,
        status,
        species,
        type,
        gender,
        originId,
        locationId,
        image,
        episodes,
        url,
        created
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'result';
  @override
  VerificationContext validateIntegrity(Insertable<ResultTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('origin_id')) {
      context.handle(_originIdMeta,
          originId.isAcceptableOrUnknown(data['origin_id']!, _originIdMeta));
    } else if (isInserting) {
      context.missing(_originIdMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    context.handle(_episodesMeta, const VerificationResult.success());
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResultTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResultTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}character_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      originId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}origin_id'])!,
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      episodes: $ResultTable.$converterepisodes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}episodes'])!),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created'])!,
    );
  }

  @override
  $ResultTable createAlias(String alias) {
    return $ResultTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterepisodes =
      const StringListConverter();
}

class ResultTable extends DataClass implements Insertable<ResultTable> {
  final int id;
  final int characterId;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final int originId;
  final int locationId;
  final String image;
  final List<String> episodes;
  final String url;
  final String created;
  const ResultTable(
      {required this.id,
      required this.characterId,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.originId,
      required this.locationId,
      required this.image,
      required this.episodes,
      required this.url,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_id'] = Variable<int>(characterId);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['species'] = Variable<String>(species);
    map['type'] = Variable<String>(type);
    map['gender'] = Variable<String>(gender);
    map['origin_id'] = Variable<int>(originId);
    map['location_id'] = Variable<int>(locationId);
    map['image'] = Variable<String>(image);
    {
      map['episodes'] =
          Variable<String>($ResultTable.$converterepisodes.toSql(episodes));
    }
    map['url'] = Variable<String>(url);
    map['created'] = Variable<String>(created);
    return map;
  }

  ResultCompanion toCompanion(bool nullToAbsent) {
    return ResultCompanion(
      id: Value(id),
      characterId: Value(characterId),
      name: Value(name),
      status: Value(status),
      species: Value(species),
      type: Value(type),
      gender: Value(gender),
      originId: Value(originId),
      locationId: Value(locationId),
      image: Value(image),
      episodes: Value(episodes),
      url: Value(url),
      created: Value(created),
    );
  }

  factory ResultTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResultTable(
      id: serializer.fromJson<int>(json['id']),
      characterId: serializer.fromJson<int>(json['characterId']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      species: serializer.fromJson<String>(json['species']),
      type: serializer.fromJson<String>(json['type']),
      gender: serializer.fromJson<String>(json['gender']),
      originId: serializer.fromJson<int>(json['originId']),
      locationId: serializer.fromJson<int>(json['locationId']),
      image: serializer.fromJson<String>(json['image']),
      episodes: serializer.fromJson<List<String>>(json['episodes']),
      url: serializer.fromJson<String>(json['url']),
      created: serializer.fromJson<String>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterId': serializer.toJson<int>(characterId),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'species': serializer.toJson<String>(species),
      'type': serializer.toJson<String>(type),
      'gender': serializer.toJson<String>(gender),
      'originId': serializer.toJson<int>(originId),
      'locationId': serializer.toJson<int>(locationId),
      'image': serializer.toJson<String>(image),
      'episodes': serializer.toJson<List<String>>(episodes),
      'url': serializer.toJson<String>(url),
      'created': serializer.toJson<String>(created),
    };
  }

  ResultTable copyWith(
          {int? id,
          int? characterId,
          String? name,
          String? status,
          String? species,
          String? type,
          String? gender,
          int? originId,
          int? locationId,
          String? image,
          List<String>? episodes,
          String? url,
          String? created}) =>
      ResultTable(
        id: id ?? this.id,
        characterId: characterId ?? this.characterId,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        originId: originId ?? this.originId,
        locationId: locationId ?? this.locationId,
        image: image ?? this.image,
        episodes: episodes ?? this.episodes,
        url: url ?? this.url,
        created: created ?? this.created,
      );
  ResultTable copyWithCompanion(ResultCompanion data) {
    return ResultTable(
      id: data.id.present ? data.id.value : this.id,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      species: data.species.present ? data.species.value : this.species,
      type: data.type.present ? data.type.value : this.type,
      gender: data.gender.present ? data.gender.value : this.gender,
      originId: data.originId.present ? data.originId.value : this.originId,
      locationId:
          data.locationId.present ? data.locationId.value : this.locationId,
      image: data.image.present ? data.image.value : this.image,
      episodes: data.episodes.present ? data.episodes.value : this.episodes,
      url: data.url.present ? data.url.value : this.url,
      created: data.created.present ? data.created.value : this.created,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResultTable(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('type: $type, ')
          ..write('gender: $gender, ')
          ..write('originId: $originId, ')
          ..write('locationId: $locationId, ')
          ..write('image: $image, ')
          ..write('episodes: $episodes, ')
          ..write('url: $url, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterId, name, status, species, type,
      gender, originId, locationId, image, episodes, url, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResultTable &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.name == this.name &&
          other.status == this.status &&
          other.species == this.species &&
          other.type == this.type &&
          other.gender == this.gender &&
          other.originId == this.originId &&
          other.locationId == this.locationId &&
          other.image == this.image &&
          other.episodes == this.episodes &&
          other.url == this.url &&
          other.created == this.created);
}

class ResultCompanion extends UpdateCompanion<ResultTable> {
  final Value<int> id;
  final Value<int> characterId;
  final Value<String> name;
  final Value<String> status;
  final Value<String> species;
  final Value<String> type;
  final Value<String> gender;
  final Value<int> originId;
  final Value<int> locationId;
  final Value<String> image;
  final Value<List<String>> episodes;
  final Value<String> url;
  final Value<String> created;
  const ResultCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.type = const Value.absent(),
    this.gender = const Value.absent(),
    this.originId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.image = const Value.absent(),
    this.episodes = const Value.absent(),
    this.url = const Value.absent(),
    this.created = const Value.absent(),
  });
  ResultCompanion.insert({
    this.id = const Value.absent(),
    required int characterId,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required int originId,
    required int locationId,
    required String image,
    required List<String> episodes,
    required String url,
    required String created,
  })  : characterId = Value(characterId),
        name = Value(name),
        status = Value(status),
        species = Value(species),
        type = Value(type),
        gender = Value(gender),
        originId = Value(originId),
        locationId = Value(locationId),
        image = Value(image),
        episodes = Value(episodes),
        url = Value(url),
        created = Value(created);
  static Insertable<ResultTable> custom({
    Expression<int>? id,
    Expression<int>? characterId,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? species,
    Expression<String>? type,
    Expression<String>? gender,
    Expression<int>? originId,
    Expression<int>? locationId,
    Expression<String>? image,
    Expression<String>? episodes,
    Expression<String>? url,
    Expression<String>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (type != null) 'type': type,
      if (gender != null) 'gender': gender,
      if (originId != null) 'origin_id': originId,
      if (locationId != null) 'location_id': locationId,
      if (image != null) 'image': image,
      if (episodes != null) 'episodes': episodes,
      if (url != null) 'url': url,
      if (created != null) 'created': created,
    });
  }

  ResultCompanion copyWith(
      {Value<int>? id,
      Value<int>? characterId,
      Value<String>? name,
      Value<String>? status,
      Value<String>? species,
      Value<String>? type,
      Value<String>? gender,
      Value<int>? originId,
      Value<int>? locationId,
      Value<String>? image,
      Value<List<String>>? episodes,
      Value<String>? url,
      Value<String>? created}) {
    return ResultCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      originId: originId ?? this.originId,
      locationId: locationId ?? this.locationId,
      image: image ?? this.image,
      episodes: episodes ?? this.episodes,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (originId.present) {
      map['origin_id'] = Variable<int>(originId.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (episodes.present) {
      map['episodes'] = Variable<String>(
          $ResultTable.$converterepisodes.toSql(episodes.value));
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (created.present) {
      map['created'] = Variable<String>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('type: $type, ')
          ..write('gender: $gender, ')
          ..write('originId: $originId, ')
          ..write('locationId: $locationId, ')
          ..write('image: $image, ')
          ..write('episodes: $episodes, ')
          ..write('url: $url, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocationTable location = $LocationTable(this);
  late final $ResultTable result = $ResultTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [location, result];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('location',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('result', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('location',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('result', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$LocationTableCreateCompanionBuilder = LocationCompanion Function({
  Value<int> id,
  required String name,
  required String url,
});
typedef $$LocationTableUpdateCompanionBuilder = LocationCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> url,
});

class $$LocationTableFilterComposer
    extends Composer<_$AppDatabase, $LocationTable> {
  $$LocationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));
}

class $$LocationTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationTable> {
  $$LocationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));
}

class $$LocationTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationTable> {
  $$LocationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$LocationTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocationTable,
    LocationTable,
    $$LocationTableFilterComposer,
    $$LocationTableOrderingComposer,
    $$LocationTableAnnotationComposer,
    $$LocationTableCreateCompanionBuilder,
    $$LocationTableUpdateCompanionBuilder,
    (
      LocationTable,
      BaseReferences<_$AppDatabase, $LocationTable, LocationTable>
    ),
    LocationTable,
    PrefetchHooks Function()> {
  $$LocationTableTableManager(_$AppDatabase db, $LocationTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> url = const Value.absent(),
          }) =>
              LocationCompanion(
            id: id,
            name: name,
            url: url,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String url,
          }) =>
              LocationCompanion.insert(
            id: id,
            name: name,
            url: url,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocationTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocationTable,
    LocationTable,
    $$LocationTableFilterComposer,
    $$LocationTableOrderingComposer,
    $$LocationTableAnnotationComposer,
    $$LocationTableCreateCompanionBuilder,
    $$LocationTableUpdateCompanionBuilder,
    (
      LocationTable,
      BaseReferences<_$AppDatabase, $LocationTable, LocationTable>
    ),
    LocationTable,
    PrefetchHooks Function()>;
typedef $$ResultTableCreateCompanionBuilder = ResultCompanion Function({
  Value<int> id,
  required int characterId,
  required String name,
  required String status,
  required String species,
  required String type,
  required String gender,
  required int originId,
  required int locationId,
  required String image,
  required List<String> episodes,
  required String url,
  required String created,
});
typedef $$ResultTableUpdateCompanionBuilder = ResultCompanion Function({
  Value<int> id,
  Value<int> characterId,
  Value<String> name,
  Value<String> status,
  Value<String> species,
  Value<String> type,
  Value<String> gender,
  Value<int> originId,
  Value<int> locationId,
  Value<String> image,
  Value<List<String>> episodes,
  Value<String> url,
  Value<String> created,
});

final class $$ResultTableReferences
    extends BaseReferences<_$AppDatabase, $ResultTable, ResultTable> {
  $$ResultTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LocationTable _originIdTable(_$AppDatabase db) => db.location
      .createAlias($_aliasNameGenerator(db.result.originId, db.location.id));

  $$LocationTableProcessedTableManager get originId {
    final manager = $$LocationTableTableManager($_db, $_db.location)
        .filter((f) => f.id($_item.originId));
    final item = $_typedResult.readTableOrNull(_originIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LocationTable _locationIdTable(_$AppDatabase db) => db.location
      .createAlias($_aliasNameGenerator(db.result.locationId, db.location.id));

  $$LocationTableProcessedTableManager get locationId {
    final manager = $$LocationTableTableManager($_db, $_db.location)
        .filter((f) => f.id($_item.locationId));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ResultTableFilterComposer
    extends Composer<_$AppDatabase, $ResultTable> {
  $$ResultTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get episodes => $composableBuilder(
          column: $table.episodes,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnFilters(column));

  $$LocationTableFilterComposer get originId {
    final $$LocationTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.originId,
        referencedTable: $db.location,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationTableFilterComposer(
              $db: $db,
              $table: $db.location,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationTableFilterComposer get locationId {
    final $$LocationTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $db.location,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationTableFilterComposer(
              $db: $db,
              $table: $db.location,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ResultTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultTable> {
  $$ResultTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get episodes => $composableBuilder(
      column: $table.episodes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnOrderings(column));

  $$LocationTableOrderingComposer get originId {
    final $$LocationTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.originId,
        referencedTable: $db.location,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationTableOrderingComposer(
              $db: $db,
              $table: $db.location,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationTableOrderingComposer get locationId {
    final $$LocationTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $db.location,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationTableOrderingComposer(
              $db: $db,
              $table: $db.location,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ResultTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultTable> {
  $$ResultTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get episodes =>
      $composableBuilder(column: $table.episodes, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get created =>
      $composableBuilder(column: $table.created, builder: (column) => column);

  $$LocationTableAnnotationComposer get originId {
    final $$LocationTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.originId,
        referencedTable: $db.location,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationTableAnnotationComposer(
              $db: $db,
              $table: $db.location,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationTableAnnotationComposer get locationId {
    final $$LocationTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $db.location,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationTableAnnotationComposer(
              $db: $db,
              $table: $db.location,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ResultTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ResultTable,
    ResultTable,
    $$ResultTableFilterComposer,
    $$ResultTableOrderingComposer,
    $$ResultTableAnnotationComposer,
    $$ResultTableCreateCompanionBuilder,
    $$ResultTableUpdateCompanionBuilder,
    (ResultTable, $$ResultTableReferences),
    ResultTable,
    PrefetchHooks Function({bool originId, bool locationId})> {
  $$ResultTableTableManager(_$AppDatabase db, $ResultTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResultTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResultTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResultTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> characterId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> species = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<int> originId = const Value.absent(),
            Value<int> locationId = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<List<String>> episodes = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> created = const Value.absent(),
          }) =>
              ResultCompanion(
            id: id,
            characterId: characterId,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            originId: originId,
            locationId: locationId,
            image: image,
            episodes: episodes,
            url: url,
            created: created,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int characterId,
            required String name,
            required String status,
            required String species,
            required String type,
            required String gender,
            required int originId,
            required int locationId,
            required String image,
            required List<String> episodes,
            required String url,
            required String created,
          }) =>
              ResultCompanion.insert(
            id: id,
            characterId: characterId,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            originId: originId,
            locationId: locationId,
            image: image,
            episodes: episodes,
            url: url,
            created: created,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ResultTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({originId = false, locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (originId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.originId,
                    referencedTable: $$ResultTableReferences._originIdTable(db),
                    referencedColumn:
                        $$ResultTableReferences._originIdTable(db).id,
                  ) as T;
                }
                if (locationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.locationId,
                    referencedTable:
                        $$ResultTableReferences._locationIdTable(db),
                    referencedColumn:
                        $$ResultTableReferences._locationIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ResultTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ResultTable,
    ResultTable,
    $$ResultTableFilterComposer,
    $$ResultTableOrderingComposer,
    $$ResultTableAnnotationComposer,
    $$ResultTableCreateCompanionBuilder,
    $$ResultTableUpdateCompanionBuilder,
    (ResultTable, $$ResultTableReferences),
    ResultTable,
    PrefetchHooks Function({bool originId, bool locationId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocationTableTableManager get location =>
      $$LocationTableTableManager(_db, _db.location);
  $$ResultTableTableManager get result =>
      $$ResultTableTableManager(_db, _db.result);
}
