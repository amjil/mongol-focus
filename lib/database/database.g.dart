// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _deferAtMeta = const VerificationMeta(
    'deferAt',
  );
  @override
  late final GeneratedColumn<DateTime> deferAt = GeneratedColumn<DateTime>(
    'defer_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
    'due_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFocusedMeta = const VerificationMeta(
    'isFocused',
  );
  @override
  late final GeneratedColumn<bool> isFocused = GeneratedColumn<bool>(
    'is_focused',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_focused" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isFlaggedMeta = const VerificationMeta(
    'isFlagged',
  );
  @override
  late final GeneratedColumn<bool> isFlagged = GeneratedColumn<bool>(
    'is_flagged',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_flagged" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recurrenceRuleMeta = const VerificationMeta(
    'recurrenceRule',
  );
  @override
  late final GeneratedColumn<String> recurrenceRule = GeneratedColumn<String>(
    'recurrence_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recurrenceEndDateMeta = const VerificationMeta(
    'recurrenceEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> recurrenceEndDate =
      GeneratedColumn<DateTime>(
        'recurrence_end_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _reviewIntervalDaysMeta =
      const VerificationMeta('reviewIntervalDays');
  @override
  late final GeneratedColumn<int> reviewIntervalDays = GeneratedColumn<int>(
    'review_interval_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    content,
    status,
    deferAt,
    dueAt,
    isFocused,
    isFlagged,
    recurrenceRule,
    recurrenceEndDate,
    lastReviewedAt,
    reviewIntervalDays,
    estimatedMinutes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<Item> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('defer_at')) {
      context.handle(
        _deferAtMeta,
        deferAt.isAcceptableOrUnknown(data['defer_at']!, _deferAtMeta),
      );
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    }
    if (data.containsKey('is_focused')) {
      context.handle(
        _isFocusedMeta,
        isFocused.isAcceptableOrUnknown(data['is_focused']!, _isFocusedMeta),
      );
    }
    if (data.containsKey('is_flagged')) {
      context.handle(
        _isFlaggedMeta,
        isFlagged.isAcceptableOrUnknown(data['is_flagged']!, _isFlaggedMeta),
      );
    }
    if (data.containsKey('recurrence_rule')) {
      context.handle(
        _recurrenceRuleMeta,
        recurrenceRule.isAcceptableOrUnknown(
          data['recurrence_rule']!,
          _recurrenceRuleMeta,
        ),
      );
    }
    if (data.containsKey('recurrence_end_date')) {
      context.handle(
        _recurrenceEndDateMeta,
        recurrenceEndDate.isAcceptableOrUnknown(
          data['recurrence_end_date']!,
          _recurrenceEndDateMeta,
        ),
      );
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    if (data.containsKey('review_interval_days')) {
      context.handle(
        _reviewIntervalDaysMeta,
        reviewIntervalDays.isAcceptableOrUnknown(
          data['review_interval_days']!,
          _reviewIntervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      deferAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}defer_at'],
      ),
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_at'],
      ),
      isFocused: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_focused'],
      )!,
      isFlagged: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_flagged'],
      )!,
      recurrenceRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_rule'],
      ),
      recurrenceEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recurrence_end_date'],
      ),
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
      reviewIntervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_interval_days'],
      ),
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final String id;
  final String type;
  final String content;
  final String status;
  final DateTime? deferAt;
  final DateTime? dueAt;
  final bool isFocused;
  final bool isFlagged;
  final String? recurrenceRule;
  final DateTime? recurrenceEndDate;
  final DateTime? lastReviewedAt;
  final int? reviewIntervalDays;
  final int? estimatedMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Item({
    required this.id,
    required this.type,
    required this.content,
    required this.status,
    this.deferAt,
    this.dueAt,
    required this.isFocused,
    required this.isFlagged,
    this.recurrenceRule,
    this.recurrenceEndDate,
    this.lastReviewedAt,
    this.reviewIntervalDays,
    this.estimatedMinutes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['content'] = Variable<String>(content);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || deferAt != null) {
      map['defer_at'] = Variable<DateTime>(deferAt);
    }
    if (!nullToAbsent || dueAt != null) {
      map['due_at'] = Variable<DateTime>(dueAt);
    }
    map['is_focused'] = Variable<bool>(isFocused);
    map['is_flagged'] = Variable<bool>(isFlagged);
    if (!nullToAbsent || recurrenceRule != null) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule);
    }
    if (!nullToAbsent || recurrenceEndDate != null) {
      map['recurrence_end_date'] = Variable<DateTime>(recurrenceEndDate);
    }
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    if (!nullToAbsent || reviewIntervalDays != null) {
      map['review_interval_days'] = Variable<int>(reviewIntervalDays);
    }
    if (!nullToAbsent || estimatedMinutes != null) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      type: Value(type),
      content: Value(content),
      status: Value(status),
      deferAt: deferAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deferAt),
      dueAt: dueAt == null && nullToAbsent
          ? const Value.absent()
          : Value(dueAt),
      isFocused: Value(isFocused),
      isFlagged: Value(isFlagged),
      recurrenceRule: recurrenceRule == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceRule),
      recurrenceEndDate: recurrenceEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceEndDate),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      reviewIntervalDays: reviewIntervalDays == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewIntervalDays),
      estimatedMinutes: estimatedMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedMinutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Item.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      content: serializer.fromJson<String>(json['content']),
      status: serializer.fromJson<String>(json['status']),
      deferAt: serializer.fromJson<DateTime?>(json['deferAt']),
      dueAt: serializer.fromJson<DateTime?>(json['dueAt']),
      isFocused: serializer.fromJson<bool>(json['isFocused']),
      isFlagged: serializer.fromJson<bool>(json['isFlagged']),
      recurrenceRule: serializer.fromJson<String?>(json['recurrenceRule']),
      recurrenceEndDate: serializer.fromJson<DateTime?>(
        json['recurrenceEndDate'],
      ),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      reviewIntervalDays: serializer.fromJson<int?>(json['reviewIntervalDays']),
      estimatedMinutes: serializer.fromJson<int?>(json['estimatedMinutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'content': serializer.toJson<String>(content),
      'status': serializer.toJson<String>(status),
      'deferAt': serializer.toJson<DateTime?>(deferAt),
      'dueAt': serializer.toJson<DateTime?>(dueAt),
      'isFocused': serializer.toJson<bool>(isFocused),
      'isFlagged': serializer.toJson<bool>(isFlagged),
      'recurrenceRule': serializer.toJson<String?>(recurrenceRule),
      'recurrenceEndDate': serializer.toJson<DateTime?>(recurrenceEndDate),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'reviewIntervalDays': serializer.toJson<int?>(reviewIntervalDays),
      'estimatedMinutes': serializer.toJson<int?>(estimatedMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Item copyWith({
    String? id,
    String? type,
    String? content,
    String? status,
    Value<DateTime?> deferAt = const Value.absent(),
    Value<DateTime?> dueAt = const Value.absent(),
    bool? isFocused,
    bool? isFlagged,
    Value<String?> recurrenceRule = const Value.absent(),
    Value<DateTime?> recurrenceEndDate = const Value.absent(),
    Value<DateTime?> lastReviewedAt = const Value.absent(),
    Value<int?> reviewIntervalDays = const Value.absent(),
    Value<int?> estimatedMinutes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Item(
    id: id ?? this.id,
    type: type ?? this.type,
    content: content ?? this.content,
    status: status ?? this.status,
    deferAt: deferAt.present ? deferAt.value : this.deferAt,
    dueAt: dueAt.present ? dueAt.value : this.dueAt,
    isFocused: isFocused ?? this.isFocused,
    isFlagged: isFlagged ?? this.isFlagged,
    recurrenceRule: recurrenceRule.present
        ? recurrenceRule.value
        : this.recurrenceRule,
    recurrenceEndDate: recurrenceEndDate.present
        ? recurrenceEndDate.value
        : this.recurrenceEndDate,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
    reviewIntervalDays: reviewIntervalDays.present
        ? reviewIntervalDays.value
        : this.reviewIntervalDays,
    estimatedMinutes: estimatedMinutes.present
        ? estimatedMinutes.value
        : this.estimatedMinutes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      content: data.content.present ? data.content.value : this.content,
      status: data.status.present ? data.status.value : this.status,
      deferAt: data.deferAt.present ? data.deferAt.value : this.deferAt,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      isFocused: data.isFocused.present ? data.isFocused.value : this.isFocused,
      isFlagged: data.isFlagged.present ? data.isFlagged.value : this.isFlagged,
      recurrenceRule: data.recurrenceRule.present
          ? data.recurrenceRule.value
          : this.recurrenceRule,
      recurrenceEndDate: data.recurrenceEndDate.present
          ? data.recurrenceEndDate.value
          : this.recurrenceEndDate,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      reviewIntervalDays: data.reviewIntervalDays.present
          ? data.reviewIntervalDays.value
          : this.reviewIntervalDays,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('status: $status, ')
          ..write('deferAt: $deferAt, ')
          ..write('dueAt: $dueAt, ')
          ..write('isFocused: $isFocused, ')
          ..write('isFlagged: $isFlagged, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('recurrenceEndDate: $recurrenceEndDate, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('reviewIntervalDays: $reviewIntervalDays, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    content,
    status,
    deferAt,
    dueAt,
    isFocused,
    isFlagged,
    recurrenceRule,
    recurrenceEndDate,
    lastReviewedAt,
    reviewIntervalDays,
    estimatedMinutes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.type == this.type &&
          other.content == this.content &&
          other.status == this.status &&
          other.deferAt == this.deferAt &&
          other.dueAt == this.dueAt &&
          other.isFocused == this.isFocused &&
          other.isFlagged == this.isFlagged &&
          other.recurrenceRule == this.recurrenceRule &&
          other.recurrenceEndDate == this.recurrenceEndDate &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.reviewIntervalDays == this.reviewIntervalDays &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> content;
  final Value<String> status;
  final Value<DateTime?> deferAt;
  final Value<DateTime?> dueAt;
  final Value<bool> isFocused;
  final Value<bool> isFlagged;
  final Value<String?> recurrenceRule;
  final Value<DateTime?> recurrenceEndDate;
  final Value<DateTime?> lastReviewedAt;
  final Value<int?> reviewIntervalDays;
  final Value<int?> estimatedMinutes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.content = const Value.absent(),
    this.status = const Value.absent(),
    this.deferAt = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.isFocused = const Value.absent(),
    this.isFlagged = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.recurrenceEndDate = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.reviewIntervalDays = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsCompanion.insert({
    required String id,
    required String type,
    required String content,
    this.status = const Value.absent(),
    this.deferAt = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.isFocused = const Value.absent(),
    this.isFlagged = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.recurrenceEndDate = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.reviewIntervalDays = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       content = Value(content);
  static Insertable<Item> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? content,
    Expression<String>? status,
    Expression<DateTime>? deferAt,
    Expression<DateTime>? dueAt,
    Expression<bool>? isFocused,
    Expression<bool>? isFlagged,
    Expression<String>? recurrenceRule,
    Expression<DateTime>? recurrenceEndDate,
    Expression<DateTime>? lastReviewedAt,
    Expression<int>? reviewIntervalDays,
    Expression<int>? estimatedMinutes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (content != null) 'content': content,
      if (status != null) 'status': status,
      if (deferAt != null) 'defer_at': deferAt,
      if (dueAt != null) 'due_at': dueAt,
      if (isFocused != null) 'is_focused': isFocused,
      if (isFlagged != null) 'is_flagged': isFlagged,
      if (recurrenceRule != null) 'recurrence_rule': recurrenceRule,
      if (recurrenceEndDate != null) 'recurrence_end_date': recurrenceEndDate,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (reviewIntervalDays != null)
        'review_interval_days': reviewIntervalDays,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String>? content,
    Value<String>? status,
    Value<DateTime?>? deferAt,
    Value<DateTime?>? dueAt,
    Value<bool>? isFocused,
    Value<bool>? isFlagged,
    Value<String?>? recurrenceRule,
    Value<DateTime?>? recurrenceEndDate,
    Value<DateTime?>? lastReviewedAt,
    Value<int?>? reviewIntervalDays,
    Value<int?>? estimatedMinutes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      content: content ?? this.content,
      status: status ?? this.status,
      deferAt: deferAt ?? this.deferAt,
      dueAt: dueAt ?? this.dueAt,
      isFocused: isFocused ?? this.isFocused,
      isFlagged: isFlagged ?? this.isFlagged,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      recurrenceEndDate: recurrenceEndDate ?? this.recurrenceEndDate,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      reviewIntervalDays: reviewIntervalDays ?? this.reviewIntervalDays,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (deferAt.present) {
      map['defer_at'] = Variable<DateTime>(deferAt.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (isFocused.present) {
      map['is_focused'] = Variable<bool>(isFocused.value);
    }
    if (isFlagged.present) {
      map['is_flagged'] = Variable<bool>(isFlagged.value);
    }
    if (recurrenceRule.present) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule.value);
    }
    if (recurrenceEndDate.present) {
      map['recurrence_end_date'] = Variable<DateTime>(recurrenceEndDate.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (reviewIntervalDays.present) {
      map['review_interval_days'] = Variable<int>(reviewIntervalDays.value);
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('status: $status, ')
          ..write('deferAt: $deferAt, ')
          ..write('dueAt: $dueAt, ')
          ..write('isFocused: $isFocused, ')
          ..write('isFlagged: $isFlagged, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('recurrenceEndDate: $recurrenceEndDate, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('reviewIntervalDays: $reviewIntervalDays, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemTreeTable extends ItemTree
    with TableInfo<$ItemTreeTable, ItemTreeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTreeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [parentId, childId, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_tree';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemTreeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {parentId, childId};
  @override
  ItemTreeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTreeData(
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $ItemTreeTable createAlias(String alias) {
    return $ItemTreeTable(attachedDatabase, alias);
  }
}

class ItemTreeData extends DataClass implements Insertable<ItemTreeData> {
  final String parentId;
  final String childId;
  final int position;
  const ItemTreeData({
    required this.parentId,
    required this.childId,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parent_id'] = Variable<String>(parentId);
    map['child_id'] = Variable<String>(childId);
    map['position'] = Variable<int>(position);
    return map;
  }

  ItemTreeCompanion toCompanion(bool nullToAbsent) {
    return ItemTreeCompanion(
      parentId: Value(parentId),
      childId: Value(childId),
      position: Value(position),
    );
  }

  factory ItemTreeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemTreeData(
      parentId: serializer.fromJson<String>(json['parentId']),
      childId: serializer.fromJson<String>(json['childId']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'parentId': serializer.toJson<String>(parentId),
      'childId': serializer.toJson<String>(childId),
      'position': serializer.toJson<int>(position),
    };
  }

  ItemTreeData copyWith({String? parentId, String? childId, int? position}) =>
      ItemTreeData(
        parentId: parentId ?? this.parentId,
        childId: childId ?? this.childId,
        position: position ?? this.position,
      );
  ItemTreeData copyWithCompanion(ItemTreeCompanion data) {
    return ItemTreeData(
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      childId: data.childId.present ? data.childId.value : this.childId,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemTreeData(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(parentId, childId, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemTreeData &&
          other.parentId == this.parentId &&
          other.childId == this.childId &&
          other.position == this.position);
}

class ItemTreeCompanion extends UpdateCompanion<ItemTreeData> {
  final Value<String> parentId;
  final Value<String> childId;
  final Value<int> position;
  final Value<int> rowid;
  const ItemTreeCompanion({
    this.parentId = const Value.absent(),
    this.childId = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemTreeCompanion.insert({
    required String parentId,
    required String childId,
    required int position,
    this.rowid = const Value.absent(),
  }) : parentId = Value(parentId),
       childId = Value(childId),
       position = Value(position);
  static Insertable<ItemTreeData> custom({
    Expression<String>? parentId,
    Expression<String>? childId,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (parentId != null) 'parent_id': parentId,
      if (childId != null) 'child_id': childId,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemTreeCompanion copyWith({
    Value<String>? parentId,
    Value<String>? childId,
    Value<int>? position,
    Value<int>? rowid,
  }) {
    return ItemTreeCompanion(
      parentId: parentId ?? this.parentId,
      childId: childId ?? this.childId,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTreeCompanion(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, parentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final String name;
  final String? parentId;
  const Tag({required this.id, required this.name, this.parentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
    );
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      parentId: serializer.fromJson<String?>(json['parentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'parentId': serializer.toJson<String?>(parentId),
    };
  }

  Tag copyWith({
    String? id,
    String? name,
    Value<String?> parentId = const Value.absent(),
  }) => Tag(
    id: id ?? this.id,
    name: name ?? this.name,
    parentId: parentId.present ? parentId.value : this.parentId,
  );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, parentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> parentId;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required String name,
    this.parentId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? parentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentId != null) 'parent_id': parentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? parentId,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemTagsTable extends ItemTags with TableInfo<$ItemTagsTable, ItemTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [itemId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId, tagId};
  @override
  ItemTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTag(
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $ItemTagsTable createAlias(String alias) {
    return $ItemTagsTable(attachedDatabase, alias);
  }
}

class ItemTag extends DataClass implements Insertable<ItemTag> {
  final String itemId;
  final String tagId;
  const ItemTag({required this.itemId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  ItemTagsCompanion toCompanion(bool nullToAbsent) {
    return ItemTagsCompanion(itemId: Value(itemId), tagId: Value(tagId));
  }

  factory ItemTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemTag(
      itemId: serializer.fromJson<String>(json['itemId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  ItemTag copyWith({String? itemId, String? tagId}) =>
      ItemTag(itemId: itemId ?? this.itemId, tagId: tagId ?? this.tagId);
  ItemTag copyWithCompanion(ItemTagsCompanion data) {
    return ItemTag(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemTag(')
          ..write('itemId: $itemId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemTag &&
          other.itemId == this.itemId &&
          other.tagId == this.tagId);
}

class ItemTagsCompanion extends UpdateCompanion<ItemTag> {
  final Value<String> itemId;
  final Value<String> tagId;
  final Value<int> rowid;
  const ItemTagsCompanion({
    this.itemId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemTagsCompanion.insert({
    required String itemId,
    required String tagId,
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId),
       tagId = Value(tagId);
  static Insertable<ItemTag> custom({
    Expression<String>? itemId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemTagsCompanion copyWith({
    Value<String>? itemId,
    Value<String>? tagId,
    Value<int>? rowid,
  }) {
    return ItemTagsCompanion(
      itemId: itemId ?? this.itemId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTagsCompanion(')
          ..write('itemId: $itemId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FocusSessionsTable extends FocusSessions
    with TableInfo<$FocusSessionsTable, FocusSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FocusSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
    'end_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _depthScoreMeta = const VerificationMeta(
    'depthScore',
  );
  @override
  late final GeneratedColumn<int> depthScore = GeneratedColumn<int>(
    'depth_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemId,
    startAt,
    endAt,
    depthScore,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'focus_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<FocusSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    }
    if (data.containsKey('depth_score')) {
      context.handle(
        _depthScoreMeta,
        depthScore.isAcceptableOrUnknown(data['depth_score']!, _depthScoreMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FocusSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FocusSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_at'],
      ),
      depthScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}depth_score'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $FocusSessionsTable createAlias(String alias) {
    return $FocusSessionsTable(attachedDatabase, alias);
  }
}

class FocusSession extends DataClass implements Insertable<FocusSession> {
  final String id;
  final String itemId;
  final DateTime startAt;
  final DateTime? endAt;
  final int depthScore;
  final String? note;
  const FocusSession({
    required this.id,
    required this.itemId,
    required this.startAt,
    this.endAt,
    required this.depthScore,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['start_at'] = Variable<DateTime>(startAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    map['depth_score'] = Variable<int>(depthScore);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  FocusSessionsCompanion toCompanion(bool nullToAbsent) {
    return FocusSessionsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      startAt: Value(startAt),
      endAt: endAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endAt),
      depthScore: Value(depthScore),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory FocusSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FocusSession(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
      depthScore: serializer.fromJson<int>(json['depthScore']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'startAt': serializer.toJson<DateTime>(startAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
      'depthScore': serializer.toJson<int>(depthScore),
      'note': serializer.toJson<String?>(note),
    };
  }

  FocusSession copyWith({
    String? id,
    String? itemId,
    DateTime? startAt,
    Value<DateTime?> endAt = const Value.absent(),
    int? depthScore,
    Value<String?> note = const Value.absent(),
  }) => FocusSession(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    startAt: startAt ?? this.startAt,
    endAt: endAt.present ? endAt.value : this.endAt,
    depthScore: depthScore ?? this.depthScore,
    note: note.present ? note.value : this.note,
  );
  FocusSession copyWithCompanion(FocusSessionsCompanion data) {
    return FocusSession(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
      depthScore: data.depthScore.present
          ? data.depthScore.value
          : this.depthScore,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FocusSession(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('depthScore: $depthScore, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, startAt, endAt, depthScore, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FocusSession &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt &&
          other.depthScore == this.depthScore &&
          other.note == this.note);
}

class FocusSessionsCompanion extends UpdateCompanion<FocusSession> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<DateTime> startAt;
  final Value<DateTime?> endAt;
  final Value<int> depthScore;
  final Value<String?> note;
  final Value<int> rowid;
  const FocusSessionsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.depthScore = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FocusSessionsCompanion.insert({
    required String id,
    required String itemId,
    required DateTime startAt,
    this.endAt = const Value.absent(),
    this.depthScore = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       itemId = Value(itemId),
       startAt = Value(startAt);
  static Insertable<FocusSession> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<DateTime>? startAt,
    Expression<DateTime>? endAt,
    Expression<int>? depthScore,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (startAt != null) 'start_at': startAt,
      if (endAt != null) 'end_at': endAt,
      if (depthScore != null) 'depth_score': depthScore,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FocusSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? itemId,
    Value<DateTime>? startAt,
    Value<DateTime?>? endAt,
    Value<int>? depthScore,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return FocusSessionsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      depthScore: depthScore ?? this.depthScore,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    if (depthScore.present) {
      map['depth_score'] = Variable<int>(depthScore.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FocusSessionsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('depthScore: $depthScore, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews with TableInfo<$ReviewsTable, Review> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<String> targetId = GeneratedColumn<String>(
    'target_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    targetId,
    content,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<Review> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Review map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Review(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_id'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(attachedDatabase, alias);
  }
}

class Review extends DataClass implements Insertable<Review> {
  final String id;
  final String type;
  final String? targetId;
  final String content;
  final DateTime createdAt;
  const Review({
    required this.id,
    required this.type,
    this.targetId,
    required this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || targetId != null) {
      map['target_id'] = Variable<String>(targetId);
    }
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      type: Value(type),
      targetId: targetId == null && nullToAbsent
          ? const Value.absent()
          : Value(targetId),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory Review.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Review(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      targetId: serializer.fromJson<String?>(json['targetId']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'targetId': serializer.toJson<String?>(targetId),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Review copyWith({
    String? id,
    String? type,
    Value<String?> targetId = const Value.absent(),
    String? content,
    DateTime? createdAt,
  }) => Review(
    id: id ?? this.id,
    type: type ?? this.type,
    targetId: targetId.present ? targetId.value : this.targetId,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  Review copyWithCompanion(ReviewsCompanion data) {
    return Review(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Review(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('targetId: $targetId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, targetId, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Review &&
          other.id == this.id &&
          other.type == this.type &&
          other.targetId == this.targetId &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class ReviewsCompanion extends UpdateCompanion<Review> {
  final Value<String> id;
  final Value<String> type;
  final Value<String?> targetId;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.targetId = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewsCompanion.insert({
    required String id,
    required String type,
    this.targetId = const Value.absent(),
    required String content,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       content = Value(content);
  static Insertable<Review> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? targetId,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (targetId != null) 'target_id': targetId,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewsCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String?>? targetId,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ReviewsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      targetId: targetId ?? this.targetId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<String>(targetId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('targetId: $targetId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) =>
      Setting(key: key ?? this.key, value: value ?? this.value);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PerspectivesTable extends Perspectives
    with TableInfo<$PerspectivesTable, Perspective> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PerspectivesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filterConditionsMeta = const VerificationMeta(
    'filterConditions',
  );
  @override
  late final GeneratedColumn<String> filterConditions = GeneratedColumn<String>(
    'filter_conditions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortByMeta = const VerificationMeta('sortBy');
  @override
  late final GeneratedColumn<String> sortBy = GeneratedColumn<String>(
    'sort_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('dueDate'),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<String> sortOrder = GeneratedColumn<String>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('asc'),
  );
  static const VerificationMeta _groupByMeta = const VerificationMeta(
    'groupBy',
  );
  @override
  late final GeneratedColumn<String> groupBy = GeneratedColumn<String>(
    'group_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    filterConditions,
    sortBy,
    sortOrder,
    groupBy,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'perspectives';
  @override
  VerificationContext validateIntegrity(
    Insertable<Perspective> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('filter_conditions')) {
      context.handle(
        _filterConditionsMeta,
        filterConditions.isAcceptableOrUnknown(
          data['filter_conditions']!,
          _filterConditionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_filterConditionsMeta);
    }
    if (data.containsKey('sort_by')) {
      context.handle(
        _sortByMeta,
        sortBy.isAcceptableOrUnknown(data['sort_by']!, _sortByMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('group_by')) {
      context.handle(
        _groupByMeta,
        groupBy.isAcceptableOrUnknown(data['group_by']!, _groupByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Perspective map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Perspective(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      filterConditions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filter_conditions'],
      )!,
      sortBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sort_by'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sort_order'],
      )!,
      groupBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_by'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PerspectivesTable createAlias(String alias) {
    return $PerspectivesTable(attachedDatabase, alias);
  }
}

class Perspective extends DataClass implements Insertable<Perspective> {
  final String id;
  final String name;
  final String filterConditions;
  final String sortBy;
  final String sortOrder;
  final String groupBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Perspective({
    required this.id,
    required this.name,
    required this.filterConditions,
    required this.sortBy,
    required this.sortOrder,
    required this.groupBy,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['filter_conditions'] = Variable<String>(filterConditions);
    map['sort_by'] = Variable<String>(sortBy);
    map['sort_order'] = Variable<String>(sortOrder);
    map['group_by'] = Variable<String>(groupBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PerspectivesCompanion toCompanion(bool nullToAbsent) {
    return PerspectivesCompanion(
      id: Value(id),
      name: Value(name),
      filterConditions: Value(filterConditions),
      sortBy: Value(sortBy),
      sortOrder: Value(sortOrder),
      groupBy: Value(groupBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Perspective.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Perspective(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      filterConditions: serializer.fromJson<String>(json['filterConditions']),
      sortBy: serializer.fromJson<String>(json['sortBy']),
      sortOrder: serializer.fromJson<String>(json['sortOrder']),
      groupBy: serializer.fromJson<String>(json['groupBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'filterConditions': serializer.toJson<String>(filterConditions),
      'sortBy': serializer.toJson<String>(sortBy),
      'sortOrder': serializer.toJson<String>(sortOrder),
      'groupBy': serializer.toJson<String>(groupBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Perspective copyWith({
    String? id,
    String? name,
    String? filterConditions,
    String? sortBy,
    String? sortOrder,
    String? groupBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Perspective(
    id: id ?? this.id,
    name: name ?? this.name,
    filterConditions: filterConditions ?? this.filterConditions,
    sortBy: sortBy ?? this.sortBy,
    sortOrder: sortOrder ?? this.sortOrder,
    groupBy: groupBy ?? this.groupBy,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Perspective copyWithCompanion(PerspectivesCompanion data) {
    return Perspective(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      filterConditions: data.filterConditions.present
          ? data.filterConditions.value
          : this.filterConditions,
      sortBy: data.sortBy.present ? data.sortBy.value : this.sortBy,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      groupBy: data.groupBy.present ? data.groupBy.value : this.groupBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Perspective(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('filterConditions: $filterConditions, ')
          ..write('sortBy: $sortBy, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('groupBy: $groupBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    filterConditions,
    sortBy,
    sortOrder,
    groupBy,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Perspective &&
          other.id == this.id &&
          other.name == this.name &&
          other.filterConditions == this.filterConditions &&
          other.sortBy == this.sortBy &&
          other.sortOrder == this.sortOrder &&
          other.groupBy == this.groupBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PerspectivesCompanion extends UpdateCompanion<Perspective> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> filterConditions;
  final Value<String> sortBy;
  final Value<String> sortOrder;
  final Value<String> groupBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PerspectivesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.filterConditions = const Value.absent(),
    this.sortBy = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.groupBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PerspectivesCompanion.insert({
    required String id,
    required String name,
    required String filterConditions,
    this.sortBy = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.groupBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       filterConditions = Value(filterConditions);
  static Insertable<Perspective> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? filterConditions,
    Expression<String>? sortBy,
    Expression<String>? sortOrder,
    Expression<String>? groupBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (filterConditions != null) 'filter_conditions': filterConditions,
      if (sortBy != null) 'sort_by': sortBy,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (groupBy != null) 'group_by': groupBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PerspectivesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? filterConditions,
    Value<String>? sortBy,
    Value<String>? sortOrder,
    Value<String>? groupBy,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PerspectivesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      filterConditions: filterConditions ?? this.filterConditions,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
      groupBy: groupBy ?? this.groupBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (filterConditions.present) {
      map['filter_conditions'] = Variable<String>(filterConditions.value);
    }
    if (sortBy.present) {
      map['sort_by'] = Variable<String>(sortBy.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<String>(sortOrder.value);
    }
    if (groupBy.present) {
      map['group_by'] = Variable<String>(groupBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PerspectivesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('filterConditions: $filterConditions, ')
          ..write('sortBy: $sortBy, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('groupBy: $groupBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $ItemTreeTable itemTree = $ItemTreeTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $ItemTagsTable itemTags = $ItemTagsTable(this);
  late final $FocusSessionsTable focusSessions = $FocusSessionsTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $PerspectivesTable perspectives = $PerspectivesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    items,
    itemTree,
    tags,
    itemTags,
    focusSessions,
    reviews,
    settings,
    perspectives,
  ];
}

typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      required String id,
      required String type,
      required String content,
      Value<String> status,
      Value<DateTime?> deferAt,
      Value<DateTime?> dueAt,
      Value<bool> isFocused,
      Value<bool> isFlagged,
      Value<String?> recurrenceRule,
      Value<DateTime?> recurrenceEndDate,
      Value<DateTime?> lastReviewedAt,
      Value<int?> reviewIntervalDays,
      Value<int?> estimatedMinutes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<String> content,
      Value<String> status,
      Value<DateTime?> deferAt,
      Value<DateTime?> dueAt,
      Value<bool> isFocused,
      Value<bool> isFlagged,
      Value<String?> recurrenceRule,
      Value<DateTime?> recurrenceEndDate,
      Value<DateTime?> lastReviewedAt,
      Value<int?> reviewIntervalDays,
      Value<int?> estimatedMinutes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deferAt => $composableBuilder(
    column: $table.deferAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFocused => $composableBuilder(
    column: $table.isFocused,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFlagged => $composableBuilder(
    column: $table.isFlagged,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recurrenceEndDate => $composableBuilder(
    column: $table.recurrenceEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewIntervalDays => $composableBuilder(
    column: $table.reviewIntervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deferAt => $composableBuilder(
    column: $table.deferAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFocused => $composableBuilder(
    column: $table.isFocused,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFlagged => $composableBuilder(
    column: $table.isFlagged,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recurrenceEndDate => $composableBuilder(
    column: $table.recurrenceEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewIntervalDays => $composableBuilder(
    column: $table.reviewIntervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get deferAt =>
      $composableBuilder(column: $table.deferAt, builder: (column) => column);

  GeneratedColumn<DateTime> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<bool> get isFocused =>
      $composableBuilder(column: $table.isFocused, builder: (column) => column);

  GeneratedColumn<bool> get isFlagged =>
      $composableBuilder(column: $table.isFlagged, builder: (column) => column);

  GeneratedColumn<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recurrenceEndDate => $composableBuilder(
    column: $table.recurrenceEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reviewIntervalDays => $composableBuilder(
    column: $table.reviewIntervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          Item,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (Item, BaseReferences<_$AppDatabase, $ItemsTable, Item>),
          Item,
          PrefetchHooks Function()
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> deferAt = const Value.absent(),
                Value<DateTime?> dueAt = const Value.absent(),
                Value<bool> isFocused = const Value.absent(),
                Value<bool> isFlagged = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<DateTime?> recurrenceEndDate = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int?> reviewIntervalDays = const Value.absent(),
                Value<int?> estimatedMinutes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                type: type,
                content: content,
                status: status,
                deferAt: deferAt,
                dueAt: dueAt,
                isFocused: isFocused,
                isFlagged: isFlagged,
                recurrenceRule: recurrenceRule,
                recurrenceEndDate: recurrenceEndDate,
                lastReviewedAt: lastReviewedAt,
                reviewIntervalDays: reviewIntervalDays,
                estimatedMinutes: estimatedMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required String content,
                Value<String> status = const Value.absent(),
                Value<DateTime?> deferAt = const Value.absent(),
                Value<DateTime?> dueAt = const Value.absent(),
                Value<bool> isFocused = const Value.absent(),
                Value<bool> isFlagged = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<DateTime?> recurrenceEndDate = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int?> reviewIntervalDays = const Value.absent(),
                Value<int?> estimatedMinutes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                type: type,
                content: content,
                status: status,
                deferAt: deferAt,
                dueAt: dueAt,
                isFocused: isFocused,
                isFlagged: isFlagged,
                recurrenceRule: recurrenceRule,
                recurrenceEndDate: recurrenceEndDate,
                lastReviewedAt: lastReviewedAt,
                reviewIntervalDays: reviewIntervalDays,
                estimatedMinutes: estimatedMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      Item,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (Item, BaseReferences<_$AppDatabase, $ItemsTable, Item>),
      Item,
      PrefetchHooks Function()
    >;
typedef $$ItemTreeTableCreateCompanionBuilder =
    ItemTreeCompanion Function({
      required String parentId,
      required String childId,
      required int position,
      Value<int> rowid,
    });
typedef $$ItemTreeTableUpdateCompanionBuilder =
    ItemTreeCompanion Function({
      Value<String> parentId,
      Value<String> childId,
      Value<int> position,
      Value<int> rowid,
    });

class $$ItemTreeTableFilterComposer
    extends Composer<_$AppDatabase, $ItemTreeTable> {
  $$ItemTreeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemTreeTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemTreeTable> {
  $$ItemTreeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemTreeTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemTreeTable> {
  $$ItemTreeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$ItemTreeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemTreeTable,
          ItemTreeData,
          $$ItemTreeTableFilterComposer,
          $$ItemTreeTableOrderingComposer,
          $$ItemTreeTableAnnotationComposer,
          $$ItemTreeTableCreateCompanionBuilder,
          $$ItemTreeTableUpdateCompanionBuilder,
          (
            ItemTreeData,
            BaseReferences<_$AppDatabase, $ItemTreeTable, ItemTreeData>,
          ),
          ItemTreeData,
          PrefetchHooks Function()
        > {
  $$ItemTreeTableTableManager(_$AppDatabase db, $ItemTreeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemTreeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemTreeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemTreeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> parentId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemTreeCompanion(
                parentId: parentId,
                childId: childId,
                position: position,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String parentId,
                required String childId,
                required int position,
                Value<int> rowid = const Value.absent(),
              }) => ItemTreeCompanion.insert(
                parentId: parentId,
                childId: childId,
                position: position,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemTreeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemTreeTable,
      ItemTreeData,
      $$ItemTreeTableFilterComposer,
      $$ItemTreeTableOrderingComposer,
      $$ItemTreeTableAnnotationComposer,
      $$ItemTreeTableCreateCompanionBuilder,
      $$ItemTreeTableUpdateCompanionBuilder,
      (
        ItemTreeData,
        BaseReferences<_$AppDatabase, $ItemTreeTable, ItemTreeData>,
      ),
      ItemTreeData,
      PrefetchHooks Function()
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({
      required String id,
      required String name,
      Value<String?> parentId,
      Value<int> rowid,
    });
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> parentId,
      Value<int> rowid,
    });

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, BaseReferences<_$AppDatabase, $TagsTable, Tag>),
          Tag,
          PrefetchHooks Function()
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                name: name,
                parentId: parentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> parentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                name: name,
                parentId: parentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, BaseReferences<_$AppDatabase, $TagsTable, Tag>),
      Tag,
      PrefetchHooks Function()
    >;
typedef $$ItemTagsTableCreateCompanionBuilder =
    ItemTagsCompanion Function({
      required String itemId,
      required String tagId,
      Value<int> rowid,
    });
typedef $$ItemTagsTableUpdateCompanionBuilder =
    ItemTagsCompanion Function({
      Value<String> itemId,
      Value<String> tagId,
      Value<int> rowid,
    });

class $$ItemTagsTableFilterComposer
    extends Composer<_$AppDatabase, $ItemTagsTable> {
  $$ItemTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemTagsTable> {
  $$ItemTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemTagsTable> {
  $$ItemTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);
}

class $$ItemTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemTagsTable,
          ItemTag,
          $$ItemTagsTableFilterComposer,
          $$ItemTagsTableOrderingComposer,
          $$ItemTagsTableAnnotationComposer,
          $$ItemTagsTableCreateCompanionBuilder,
          $$ItemTagsTableUpdateCompanionBuilder,
          (ItemTag, BaseReferences<_$AppDatabase, $ItemTagsTable, ItemTag>),
          ItemTag,
          PrefetchHooks Function()
        > {
  $$ItemTagsTableTableManager(_$AppDatabase db, $ItemTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> itemId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  ItemTagsCompanion(itemId: itemId, tagId: tagId, rowid: rowid),
          createCompanionCallback:
              ({
                required String itemId,
                required String tagId,
                Value<int> rowid = const Value.absent(),
              }) => ItemTagsCompanion.insert(
                itemId: itemId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemTagsTable,
      ItemTag,
      $$ItemTagsTableFilterComposer,
      $$ItemTagsTableOrderingComposer,
      $$ItemTagsTableAnnotationComposer,
      $$ItemTagsTableCreateCompanionBuilder,
      $$ItemTagsTableUpdateCompanionBuilder,
      (ItemTag, BaseReferences<_$AppDatabase, $ItemTagsTable, ItemTag>),
      ItemTag,
      PrefetchHooks Function()
    >;
typedef $$FocusSessionsTableCreateCompanionBuilder =
    FocusSessionsCompanion Function({
      required String id,
      required String itemId,
      required DateTime startAt,
      Value<DateTime?> endAt,
      Value<int> depthScore,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$FocusSessionsTableUpdateCompanionBuilder =
    FocusSessionsCompanion Function({
      Value<String> id,
      Value<String> itemId,
      Value<DateTime> startAt,
      Value<DateTime?> endAt,
      Value<int> depthScore,
      Value<String?> note,
      Value<int> rowid,
    });

class $$FocusSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $FocusSessionsTable> {
  $$FocusSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get depthScore => $composableBuilder(
    column: $table.depthScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FocusSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FocusSessionsTable> {
  $$FocusSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get depthScore => $composableBuilder(
    column: $table.depthScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FocusSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FocusSessionsTable> {
  $$FocusSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);

  GeneratedColumn<int> get depthScore => $composableBuilder(
    column: $table.depthScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$FocusSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FocusSessionsTable,
          FocusSession,
          $$FocusSessionsTableFilterComposer,
          $$FocusSessionsTableOrderingComposer,
          $$FocusSessionsTableAnnotationComposer,
          $$FocusSessionsTableCreateCompanionBuilder,
          $$FocusSessionsTableUpdateCompanionBuilder,
          (
            FocusSession,
            BaseReferences<_$AppDatabase, $FocusSessionsTable, FocusSession>,
          ),
          FocusSession,
          PrefetchHooks Function()
        > {
  $$FocusSessionsTableTableManager(_$AppDatabase db, $FocusSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FocusSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FocusSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FocusSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> itemId = const Value.absent(),
                Value<DateTime> startAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
                Value<int> depthScore = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FocusSessionsCompanion(
                id: id,
                itemId: itemId,
                startAt: startAt,
                endAt: endAt,
                depthScore: depthScore,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String itemId,
                required DateTime startAt,
                Value<DateTime?> endAt = const Value.absent(),
                Value<int> depthScore = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FocusSessionsCompanion.insert(
                id: id,
                itemId: itemId,
                startAt: startAt,
                endAt: endAt,
                depthScore: depthScore,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FocusSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FocusSessionsTable,
      FocusSession,
      $$FocusSessionsTableFilterComposer,
      $$FocusSessionsTableOrderingComposer,
      $$FocusSessionsTableAnnotationComposer,
      $$FocusSessionsTableCreateCompanionBuilder,
      $$FocusSessionsTableUpdateCompanionBuilder,
      (
        FocusSession,
        BaseReferences<_$AppDatabase, $FocusSessionsTable, FocusSession>,
      ),
      FocusSession,
      PrefetchHooks Function()
    >;
typedef $$ReviewsTableCreateCompanionBuilder =
    ReviewsCompanion Function({
      required String id,
      required String type,
      Value<String?> targetId,
      required String content,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$ReviewsTableUpdateCompanionBuilder =
    ReviewsCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<String?> targetId,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ReviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewsTable,
          Review,
          $$ReviewsTableFilterComposer,
          $$ReviewsTableOrderingComposer,
          $$ReviewsTableAnnotationComposer,
          $$ReviewsTableCreateCompanionBuilder,
          $$ReviewsTableUpdateCompanionBuilder,
          (Review, BaseReferences<_$AppDatabase, $ReviewsTable, Review>),
          Review,
          PrefetchHooks Function()
        > {
  $$ReviewsTableTableManager(_$AppDatabase db, $ReviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> targetId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewsCompanion(
                id: id,
                type: type,
                targetId: targetId,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                Value<String?> targetId = const Value.absent(),
                required String content,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewsCompanion.insert(
                id: id,
                type: type,
                targetId: targetId,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewsTable,
      Review,
      $$ReviewsTableFilterComposer,
      $$ReviewsTableOrderingComposer,
      $$ReviewsTableAnnotationComposer,
      $$ReviewsTableCreateCompanionBuilder,
      $$ReviewsTableUpdateCompanionBuilder,
      (Review, BaseReferences<_$AppDatabase, $ReviewsTable, Review>),
      Review,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$PerspectivesTableCreateCompanionBuilder =
    PerspectivesCompanion Function({
      required String id,
      required String name,
      required String filterConditions,
      Value<String> sortBy,
      Value<String> sortOrder,
      Value<String> groupBy,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$PerspectivesTableUpdateCompanionBuilder =
    PerspectivesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> filterConditions,
      Value<String> sortBy,
      Value<String> sortOrder,
      Value<String> groupBy,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PerspectivesTableFilterComposer
    extends Composer<_$AppDatabase, $PerspectivesTable> {
  $$PerspectivesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filterConditions => $composableBuilder(
    column: $table.filterConditions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sortBy => $composableBuilder(
    column: $table.sortBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupBy => $composableBuilder(
    column: $table.groupBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PerspectivesTableOrderingComposer
    extends Composer<_$AppDatabase, $PerspectivesTable> {
  $$PerspectivesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filterConditions => $composableBuilder(
    column: $table.filterConditions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sortBy => $composableBuilder(
    column: $table.sortBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupBy => $composableBuilder(
    column: $table.groupBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PerspectivesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PerspectivesTable> {
  $$PerspectivesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get filterConditions => $composableBuilder(
    column: $table.filterConditions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sortBy =>
      $composableBuilder(column: $table.sortBy, builder: (column) => column);

  GeneratedColumn<String> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get groupBy =>
      $composableBuilder(column: $table.groupBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PerspectivesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PerspectivesTable,
          Perspective,
          $$PerspectivesTableFilterComposer,
          $$PerspectivesTableOrderingComposer,
          $$PerspectivesTableAnnotationComposer,
          $$PerspectivesTableCreateCompanionBuilder,
          $$PerspectivesTableUpdateCompanionBuilder,
          (
            Perspective,
            BaseReferences<_$AppDatabase, $PerspectivesTable, Perspective>,
          ),
          Perspective,
          PrefetchHooks Function()
        > {
  $$PerspectivesTableTableManager(_$AppDatabase db, $PerspectivesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PerspectivesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PerspectivesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PerspectivesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> filterConditions = const Value.absent(),
                Value<String> sortBy = const Value.absent(),
                Value<String> sortOrder = const Value.absent(),
                Value<String> groupBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PerspectivesCompanion(
                id: id,
                name: name,
                filterConditions: filterConditions,
                sortBy: sortBy,
                sortOrder: sortOrder,
                groupBy: groupBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String filterConditions,
                Value<String> sortBy = const Value.absent(),
                Value<String> sortOrder = const Value.absent(),
                Value<String> groupBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PerspectivesCompanion.insert(
                id: id,
                name: name,
                filterConditions: filterConditions,
                sortBy: sortBy,
                sortOrder: sortOrder,
                groupBy: groupBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PerspectivesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PerspectivesTable,
      Perspective,
      $$PerspectivesTableFilterComposer,
      $$PerspectivesTableOrderingComposer,
      $$PerspectivesTableAnnotationComposer,
      $$PerspectivesTableCreateCompanionBuilder,
      $$PerspectivesTableUpdateCompanionBuilder,
      (
        Perspective,
        BaseReferences<_$AppDatabase, $PerspectivesTable, Perspective>,
      ),
      Perspective,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$ItemTreeTableTableManager get itemTree =>
      $$ItemTreeTableTableManager(_db, _db.itemTree);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$ItemTagsTableTableManager get itemTags =>
      $$ItemTagsTableTableManager(_db, _db.itemTags);
  $$FocusSessionsTableTableManager get focusSessions =>
      $$FocusSessionsTableTableManager(_db, _db.focusSessions);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$PerspectivesTableTableManager get perspectives =>
      $$PerspectivesTableTableManager(_db, _db.perspectives);
}
