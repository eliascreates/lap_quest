// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActivityEntityCollection on Isar {
  IsarCollection<ActivityEntity> get activityEntitys => this.collection();
}

const ActivityEntitySchema = CollectionSchema(
  name: r'ActivityEntity',
  id: 2979934318015624436,
  properties: {
    r'bestLap': PropertySchema(
      id: 0,
      name: r'bestLap',
      type: IsarType.object,
      target: r'Lap',
    ),
    r'isFavorite': PropertySchema(
      id: 1,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'laps': PropertySchema(
      id: 2,
      name: r'laps',
      type: IsarType.objectList,
      target: r'Lap',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'totallapDurationInMilliseconds': PropertySchema(
      id: 4,
      name: r'totallapDurationInMilliseconds',
      type: IsarType.long,
    ),
    r'worstLap': PropertySchema(
      id: 5,
      name: r'worstLap',
      type: IsarType.object,
      target: r'Lap',
    )
  },
  estimateSize: _activityEntityEstimateSize,
  serialize: _activityEntitySerialize,
  deserialize: _activityEntityDeserialize,
  deserializeProp: _activityEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Lap': LapSchema},
  getId: _activityEntityGetId,
  getLinks: _activityEntityGetLinks,
  attach: _activityEntityAttach,
  version: '3.1.0+1',
);

int _activityEntityEstimateSize(
  ActivityEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bestLap;
    if (value != null) {
      bytesCount +=
          3 + LapSchema.estimateSize(value, allOffsets[Lap]!, allOffsets);
    }
  }
  bytesCount += 3 + object.laps.length * 3;
  {
    final offsets = allOffsets[Lap]!;
    for (var i = 0; i < object.laps.length; i++) {
      final value = object.laps[i];
      bytesCount += LapSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.worstLap;
    if (value != null) {
      bytesCount +=
          3 + LapSchema.estimateSize(value, allOffsets[Lap]!, allOffsets);
    }
  }
  return bytesCount;
}

void _activityEntitySerialize(
  ActivityEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Lap>(
    offsets[0],
    allOffsets,
    LapSchema.serialize,
    object.bestLap,
  );
  writer.writeBool(offsets[1], object.isFavorite);
  writer.writeObjectList<Lap>(
    offsets[2],
    allOffsets,
    LapSchema.serialize,
    object.laps,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.totallapDurationInMilliseconds);
  writer.writeObject<Lap>(
    offsets[5],
    allOffsets,
    LapSchema.serialize,
    object.worstLap,
  );
}

ActivityEntity _activityEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActivityEntity();
  object.id = id;
  object.isFavorite = reader.readBool(offsets[1]);
  object.laps = reader.readObjectList<Lap>(
        offsets[2],
        LapSchema.deserialize,
        allOffsets,
        Lap(),
      ) ??
      [];
  object.name = reader.readString(offsets[3]);
  return object;
}

P _activityEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Lap>(
        offset,
        LapSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readObjectList<Lap>(
            offset,
            LapSchema.deserialize,
            allOffsets,
            Lap(),
          ) ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<Lap>(
        offset,
        LapSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _activityEntityGetId(ActivityEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activityEntityGetLinks(ActivityEntity object) {
  return [];
}

void _activityEntityAttach(
    IsarCollection<dynamic> col, Id id, ActivityEntity object) {
  object.id = id;
}

extension ActivityEntityQueryWhereSort
    on QueryBuilder<ActivityEntity, ActivityEntity, QWhere> {
  QueryBuilder<ActivityEntity, ActivityEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActivityEntityQueryWhere
    on QueryBuilder<ActivityEntity, ActivityEntity, QWhereClause> {
  QueryBuilder<ActivityEntity, ActivityEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActivityEntityQueryFilter
    on QueryBuilder<ActivityEntity, ActivityEntity, QFilterCondition> {
  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      bestLapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestLap',
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      bestLapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestLap',
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'laps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'laps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'laps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'laps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'laps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'laps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      totallapDurationInMillisecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totallapDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      totallapDurationInMillisecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totallapDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      totallapDurationInMillisecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totallapDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      totallapDurationInMillisecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totallapDurationInMilliseconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      worstLapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'worstLap',
      ));
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      worstLapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'worstLap',
      ));
    });
  }
}

extension ActivityEntityQueryObject
    on QueryBuilder<ActivityEntity, ActivityEntity, QFilterCondition> {
  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition> bestLap(
      FilterQuery<Lap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bestLap');
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition>
      lapsElement(FilterQuery<Lap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'laps');
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterFilterCondition> worstLap(
      FilterQuery<Lap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'worstLap');
    });
  }
}

extension ActivityEntityQueryLinks
    on QueryBuilder<ActivityEntity, ActivityEntity, QFilterCondition> {}

extension ActivityEntityQuerySortBy
    on QueryBuilder<ActivityEntity, ActivityEntity, QSortBy> {
  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      sortByTotallapDurationInMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totallapDurationInMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      sortByTotallapDurationInMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totallapDurationInMilliseconds', Sort.desc);
    });
  }
}

extension ActivityEntityQuerySortThenBy
    on QueryBuilder<ActivityEntity, ActivityEntity, QSortThenBy> {
  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      thenByTotallapDurationInMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totallapDurationInMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QAfterSortBy>
      thenByTotallapDurationInMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totallapDurationInMilliseconds', Sort.desc);
    });
  }
}

extension ActivityEntityQueryWhereDistinct
    on QueryBuilder<ActivityEntity, ActivityEntity, QDistinct> {
  QueryBuilder<ActivityEntity, ActivityEntity, QDistinct>
      distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActivityEntity, ActivityEntity, QDistinct>
      distinctByTotallapDurationInMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totallapDurationInMilliseconds');
    });
  }
}

extension ActivityEntityQueryProperty
    on QueryBuilder<ActivityEntity, ActivityEntity, QQueryProperty> {
  QueryBuilder<ActivityEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActivityEntity, Lap?, QQueryOperations> bestLapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bestLap');
    });
  }

  QueryBuilder<ActivityEntity, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<ActivityEntity, List<Lap>, QQueryOperations> lapsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laps');
    });
  }

  QueryBuilder<ActivityEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ActivityEntity, int, QQueryOperations>
      totallapDurationInMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totallapDurationInMilliseconds');
    });
  }

  QueryBuilder<ActivityEntity, Lap?, QQueryOperations> worstLapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'worstLap');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LapSchema = Schema(
  name: r'Lap',
  id: -3622078117444937234,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'lapDurationInMilliseconds': PropertySchema(
      id: 1,
      name: r'lapDurationInMilliseconds',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 2,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'totalDurationInMilliseconds': PropertySchema(
      id: 3,
      name: r'totalDurationInMilliseconds',
      type: IsarType.long,
    )
  },
  estimateSize: _lapEstimateSize,
  serialize: _lapSerialize,
  deserialize: _lapDeserialize,
  deserializeProp: _lapDeserializeProp,
);

int _lapEstimateSize(
  Lap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _lapSerialize(
  Lap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeLong(offsets[1], object.lapDurationInMilliseconds);
  writer.writeDateTime(offsets[2], object.timestamp);
  writer.writeLong(offsets[3], object.totalDurationInMilliseconds);
}

Lap _lapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lap();
  object.id = reader.readLongOrNull(offsets[0]);
  object.lapDurationInMilliseconds = reader.readLongOrNull(offsets[1]);
  object.timestamp = reader.readDateTimeOrNull(offsets[2]);
  object.totalDurationInMilliseconds = reader.readLongOrNull(offsets[3]);
  return object;
}

P _lapDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LapQueryFilter on QueryBuilder<Lap, Lap, QFilterCondition> {
  QueryBuilder<Lap, Lap, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      lapDurationInMillisecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lapDurationInMilliseconds',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      lapDurationInMillisecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lapDurationInMilliseconds',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      lapDurationInMillisecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lapDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      lapDurationInMillisecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lapDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      lapDurationInMillisecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lapDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      lapDurationInMillisecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lapDurationInMilliseconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> timestampEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      totalDurationInMillisecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalDurationInMilliseconds',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      totalDurationInMillisecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalDurationInMilliseconds',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      totalDurationInMillisecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      totalDurationInMillisecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      totalDurationInMillisecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      totalDurationInMillisecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDurationInMilliseconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LapQueryObject on QueryBuilder<Lap, Lap, QFilterCondition> {}
