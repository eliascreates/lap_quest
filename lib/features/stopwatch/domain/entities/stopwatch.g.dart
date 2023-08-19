// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopwatch.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStopwatchEntityCollection on Isar {
  IsarCollection<StopwatchEntity> get stopwatchEntitys => this.collection();
}

const StopwatchEntitySchema = CollectionSchema(
  name: r'StopwatchEntity',
  id: 3007675966835495502,
  properties: {
    r'laps': PropertySchema(
      id: 0,
      name: r'laps',
      type: IsarType.objectList,
      target: r'Lap',
    ),
    r'totalDurationInMilliseconds': PropertySchema(
      id: 1,
      name: r'totalDurationInMilliseconds',
      type: IsarType.long,
    )
  },
  estimateSize: _stopwatchEntityEstimateSize,
  serialize: _stopwatchEntitySerialize,
  deserialize: _stopwatchEntityDeserialize,
  deserializeProp: _stopwatchEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Lap': LapSchema},
  getId: _stopwatchEntityGetId,
  getLinks: _stopwatchEntityGetLinks,
  attach: _stopwatchEntityAttach,
  version: '3.1.0+1',
);

int _stopwatchEntityEstimateSize(
  StopwatchEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.laps.length * 3;
  {
    final offsets = allOffsets[Lap]!;
    for (var i = 0; i < object.laps.length; i++) {
      final value = object.laps[i];
      bytesCount += LapSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _stopwatchEntitySerialize(
  StopwatchEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Lap>(
    offsets[0],
    allOffsets,
    LapSchema.serialize,
    object.laps,
  );
  writer.writeLong(offsets[1], object.totalDurationInMilliseconds);
}

StopwatchEntity _stopwatchEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StopwatchEntity();
  object.id = id;
  object.laps = reader.readObjectList<Lap>(
        offsets[0],
        LapSchema.deserialize,
        allOffsets,
        Lap(),
      ) ??
      [];
  return object;
}

P _stopwatchEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Lap>(
            offset,
            LapSchema.deserialize,
            allOffsets,
            Lap(),
          ) ??
          []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stopwatchEntityGetId(StopwatchEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stopwatchEntityGetLinks(StopwatchEntity object) {
  return [];
}

void _stopwatchEntityAttach(
    IsarCollection<dynamic> col, Id id, StopwatchEntity object) {
  object.id = id;
}

extension StopwatchEntityQueryWhereSort
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QWhere> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StopwatchEntityQueryWhere
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QWhereClause> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterWhereClause> idBetween(
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

extension StopwatchEntityQueryFilter
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QFilterCondition> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      totalDurationInMillisecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDurationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      totalDurationInMillisecondsGreaterThan(
    int value, {
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      totalDurationInMillisecondsLessThan(
    int value, {
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

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      totalDurationInMillisecondsBetween(
    int lower,
    int upper, {
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

extension StopwatchEntityQueryObject
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QFilterCondition> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterFilterCondition>
      lapsElement(FilterQuery<Lap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'laps');
    });
  }
}

extension StopwatchEntityQueryLinks
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QFilterCondition> {}

extension StopwatchEntityQuerySortBy
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QSortBy> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterSortBy>
      sortByTotalDurationInMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationInMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterSortBy>
      sortByTotalDurationInMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationInMilliseconds', Sort.desc);
    });
  }
}

extension StopwatchEntityQuerySortThenBy
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QSortThenBy> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterSortBy>
      thenByTotalDurationInMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationInMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<StopwatchEntity, StopwatchEntity, QAfterSortBy>
      thenByTotalDurationInMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationInMilliseconds', Sort.desc);
    });
  }
}

extension StopwatchEntityQueryWhereDistinct
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QDistinct> {
  QueryBuilder<StopwatchEntity, StopwatchEntity, QDistinct>
      distinctByTotalDurationInMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDurationInMilliseconds');
    });
  }
}

extension StopwatchEntityQueryProperty
    on QueryBuilder<StopwatchEntity, StopwatchEntity, QQueryProperty> {
  QueryBuilder<StopwatchEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StopwatchEntity, List<Lap>, QQueryOperations> lapsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laps');
    });
  }

  QueryBuilder<StopwatchEntity, int, QQueryOperations>
      totalDurationInMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDurationInMilliseconds');
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
    r'durationInMilliseconds': PropertySchema(
      id: 0,
      name: r'durationInMilliseconds',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 1,
      name: r'timestamp',
      type: IsarType.dateTime,
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
  writer.writeLong(offsets[0], object.durationInMilliseconds);
  writer.writeDateTime(offsets[1], object.timestamp);
}

Lap _lapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lap();
  object.durationInMilliseconds = reader.readLongOrNull(offsets[0]);
  object.timestamp = reader.readDateTimeOrNull(offsets[1]);
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
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LapQueryFilter on QueryBuilder<Lap, Lap, QFilterCondition> {
  QueryBuilder<Lap, Lap, QAfterFilterCondition> durationInMillisecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationInMilliseconds',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      durationInMillisecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationInMilliseconds',
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> durationInMillisecondsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition>
      durationInMillisecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> durationInMillisecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInMilliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Lap, Lap, QAfterFilterCondition> durationInMillisecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInMilliseconds',
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
}

extension LapQueryObject on QueryBuilder<Lap, Lap, QFilterCondition> {}
