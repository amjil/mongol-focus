// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _iconCodeMeta = const VerificationMeta(
    'iconCode',
  );
  @override
  late final GeneratedColumn<int> iconCode = GeneratedColumn<int>(
    'icon_code',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, iconCode, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_code')) {
      context.handle(
        _iconCodeMeta,
        iconCode.isAcceptableOrUnknown(data['icon_code']!, _iconCodeMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      iconCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_code'],
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int? iconCode;
  final int position;
  const Category({
    required this.id,
    required this.name,
    this.iconCode,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || iconCode != null) {
      map['icon_code'] = Variable<int>(iconCode);
    }
    map['position'] = Variable<int>(position);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      iconCode: iconCode == null && nullToAbsent
          ? const Value.absent()
          : Value(iconCode),
      position: Value(position),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconCode: serializer.fromJson<int?>(json['iconCode']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconCode': serializer.toJson<int?>(iconCode),
      'position': serializer.toJson<int>(position),
    };
  }

  Category copyWith({
    int? id,
    String? name,
    Value<int?> iconCode = const Value.absent(),
    int? position,
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    iconCode: iconCode.present ? iconCode.value : this.iconCode,
    position: position ?? this.position,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconCode: data.iconCode.present ? data.iconCode.value : this.iconCode,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconCode: $iconCode, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconCode, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconCode == this.iconCode &&
          other.position == this.position);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> iconCode;
  final Value<int> position;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconCode = const Value.absent(),
    this.position = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.iconCode = const Value.absent(),
    this.position = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? iconCode,
    Expression<int>? position,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconCode != null) 'icon_code': iconCode,
      if (position != null) 'position': position,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? iconCode,
    Value<int>? position,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconCode: iconCode ?? this.iconCode,
      position: position ?? this.position,
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
    if (iconCode.present) {
      map['icon_code'] = Variable<int>(iconCode.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconCode: $iconCode, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 1000,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recurrenceModeMeta = const VerificationMeta(
    'recurrenceMode',
  );
  @override
  late final GeneratedColumn<int> recurrenceMode = GeneratedColumn<int>(
    'recurrence_mode',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderAtMeta = const VerificationMeta(
    'reminderAt',
  );
  @override
  late final GeneratedColumn<DateTime> reminderAt = GeneratedColumn<DateTime>(
    'reminder_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
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
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<double> displayOrder = GeneratedColumn<double>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    notes,
    isDone,
    recurrenceMode,
    dueDate,
    reminderAt,
    createdAt,
    completedAt,
    priority,
    categoryId,
    parentId,
    displayOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('recurrence_mode')) {
      context.handle(
        _recurrenceModeMeta,
        recurrenceMode.isAcceptableOrUnknown(
          data['recurrence_mode']!,
          _recurrenceModeMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('reminder_at')) {
      context.handle(
        _reminderAtMeta,
        reminderAt.isAcceptableOrUnknown(data['reminder_at']!, _reminderAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      recurrenceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recurrence_mode'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      reminderAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reminder_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      ),
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}display_order'],
      )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final String? notes;
  final bool isDone;
  final int recurrenceMode;
  final DateTime? dueDate;
  final DateTime? reminderAt;
  final DateTime createdAt;
  final DateTime? completedAt;
  final int priority;
  final int? categoryId;
  final int? parentId;
  final double displayOrder;
  const Task({
    required this.id,
    required this.title,
    this.notes,
    required this.isDone,
    required this.recurrenceMode,
    this.dueDate,
    this.reminderAt,
    required this.createdAt,
    this.completedAt,
    required this.priority,
    this.categoryId,
    this.parentId,
    required this.displayOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_done'] = Variable<bool>(isDone);
    map['recurrence_mode'] = Variable<int>(recurrenceMode);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || reminderAt != null) {
      map['reminder_at'] = Variable<DateTime>(reminderAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['display_order'] = Variable<double>(displayOrder);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isDone: Value(isDone),
      recurrenceMode: Value(recurrenceMode),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      reminderAt: reminderAt == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderAt),
      createdAt: Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      priority: Value(priority),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      displayOrder: Value(displayOrder),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      notes: serializer.fromJson<String?>(json['notes']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      recurrenceMode: serializer.fromJson<int>(json['recurrenceMode']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      reminderAt: serializer.fromJson<DateTime?>(json['reminderAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      priority: serializer.fromJson<int>(json['priority']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      displayOrder: serializer.fromJson<double>(json['displayOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'notes': serializer.toJson<String?>(notes),
      'isDone': serializer.toJson<bool>(isDone),
      'recurrenceMode': serializer.toJson<int>(recurrenceMode),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'reminderAt': serializer.toJson<DateTime?>(reminderAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'priority': serializer.toJson<int>(priority),
      'categoryId': serializer.toJson<int?>(categoryId),
      'parentId': serializer.toJson<int?>(parentId),
      'displayOrder': serializer.toJson<double>(displayOrder),
    };
  }

  Task copyWith({
    int? id,
    String? title,
    Value<String?> notes = const Value.absent(),
    bool? isDone,
    int? recurrenceMode,
    Value<DateTime?> dueDate = const Value.absent(),
    Value<DateTime?> reminderAt = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> completedAt = const Value.absent(),
    int? priority,
    Value<int?> categoryId = const Value.absent(),
    Value<int?> parentId = const Value.absent(),
    double? displayOrder,
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    notes: notes.present ? notes.value : this.notes,
    isDone: isDone ?? this.isDone,
    recurrenceMode: recurrenceMode ?? this.recurrenceMode,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    reminderAt: reminderAt.present ? reminderAt.value : this.reminderAt,
    createdAt: createdAt ?? this.createdAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    priority: priority ?? this.priority,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    parentId: parentId.present ? parentId.value : this.parentId,
    displayOrder: displayOrder ?? this.displayOrder,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      notes: data.notes.present ? data.notes.value : this.notes,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      recurrenceMode: data.recurrenceMode.present
          ? data.recurrenceMode.value
          : this.recurrenceMode,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      reminderAt: data.reminderAt.present
          ? data.reminderAt.value
          : this.reminderAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      priority: data.priority.present ? data.priority.value : this.priority,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('notes: $notes, ')
          ..write('isDone: $isDone, ')
          ..write('recurrenceMode: $recurrenceMode, ')
          ..write('dueDate: $dueDate, ')
          ..write('reminderAt: $reminderAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('priority: $priority, ')
          ..write('categoryId: $categoryId, ')
          ..write('parentId: $parentId, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    notes,
    isDone,
    recurrenceMode,
    dueDate,
    reminderAt,
    createdAt,
    completedAt,
    priority,
    categoryId,
    parentId,
    displayOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.notes == this.notes &&
          other.isDone == this.isDone &&
          other.recurrenceMode == this.recurrenceMode &&
          other.dueDate == this.dueDate &&
          other.reminderAt == this.reminderAt &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt &&
          other.priority == this.priority &&
          other.categoryId == this.categoryId &&
          other.parentId == this.parentId &&
          other.displayOrder == this.displayOrder);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> notes;
  final Value<bool> isDone;
  final Value<int> recurrenceMode;
  final Value<DateTime?> dueDate;
  final Value<DateTime?> reminderAt;
  final Value<DateTime> createdAt;
  final Value<DateTime?> completedAt;
  final Value<int> priority;
  final Value<int?> categoryId;
  final Value<int?> parentId;
  final Value<double> displayOrder;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.notes = const Value.absent(),
    this.isDone = const Value.absent(),
    this.recurrenceMode = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.reminderAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.priority = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.displayOrder = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.notes = const Value.absent(),
    this.isDone = const Value.absent(),
    this.recurrenceMode = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.reminderAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.priority = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.displayOrder = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? notes,
    Expression<bool>? isDone,
    Expression<int>? recurrenceMode,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? reminderAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? completedAt,
    Expression<int>? priority,
    Expression<int>? categoryId,
    Expression<int>? parentId,
    Expression<double>? displayOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (notes != null) 'notes': notes,
      if (isDone != null) 'is_done': isDone,
      if (recurrenceMode != null) 'recurrence_mode': recurrenceMode,
      if (dueDate != null) 'due_date': dueDate,
      if (reminderAt != null) 'reminder_at': reminderAt,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (priority != null) 'priority': priority,
      if (categoryId != null) 'category_id': categoryId,
      if (parentId != null) 'parent_id': parentId,
      if (displayOrder != null) 'display_order': displayOrder,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? notes,
    Value<bool>? isDone,
    Value<int>? recurrenceMode,
    Value<DateTime?>? dueDate,
    Value<DateTime?>? reminderAt,
    Value<DateTime>? createdAt,
    Value<DateTime?>? completedAt,
    Value<int>? priority,
    Value<int?>? categoryId,
    Value<int?>? parentId,
    Value<double>? displayOrder,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      isDone: isDone ?? this.isDone,
      recurrenceMode: recurrenceMode ?? this.recurrenceMode,
      dueDate: dueDate ?? this.dueDate,
      reminderAt: reminderAt ?? this.reminderAt,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      priority: priority ?? this.priority,
      categoryId: categoryId ?? this.categoryId,
      parentId: parentId ?? this.parentId,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (recurrenceMode.present) {
      map['recurrence_mode'] = Variable<int>(recurrenceMode.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (reminderAt.present) {
      map['reminder_at'] = Variable<DateTime>(reminderAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<double>(displayOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('notes: $notes, ')
          ..write('isDone: $isDone, ')
          ..write('recurrenceMode: $recurrenceMode, ')
          ..write('dueDate: $dueDate, ')
          ..write('reminderAt: $reminderAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('priority: $priority, ')
          ..write('categoryId: $categoryId, ')
          ..write('parentId: $parentId, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }
}

class $AnniversariesTable extends Anniversaries
    with TableInfo<$AnniversariesTable, Anniversary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnniversariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
    requiredDuringInsert: false,
    defaultValue: const Constant('birthday'),
  );
  static const VerificationMeta _isSolarMeta = const VerificationMeta(
    'isSolar',
  );
  @override
  late final GeneratedColumn<bool> isSolar = GeneratedColumn<bool>(
    'is_solar',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_solar" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
    'month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lunarYearMeta = const VerificationMeta(
    'lunarYear',
  );
  @override
  late final GeneratedColumn<int> lunarYear = GeneratedColumn<int>(
    'lunar_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lunarMonthMeta = const VerificationMeta(
    'lunarMonth',
  );
  @override
  late final GeneratedColumn<int> lunarMonth = GeneratedColumn<int>(
    'lunar_month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lunarDayMeta = const VerificationMeta(
    'lunarDay',
  );
  @override
  late final GeneratedColumn<int> lunarDay = GeneratedColumn<int>(
    'lunar_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLeapMonthMeta = const VerificationMeta(
    'isLeapMonth',
  );
  @override
  late final GeneratedColumn<bool> isLeapMonth = GeneratedColumn<bool>(
    'is_leap_month',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_leap_month" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _advanceDaysMeta = const VerificationMeta(
    'advanceDays',
  );
  @override
  late final GeneratedColumn<int> advanceDays = GeneratedColumn<int>(
    'advance_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
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
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    type,
    isSolar,
    month,
    day,
    lunarYear,
    lunarMonth,
    lunarDay,
    isLeapMonth,
    advanceDays,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anniversaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Anniversary> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('is_solar')) {
      context.handle(
        _isSolarMeta,
        isSolar.isAcceptableOrUnknown(data['is_solar']!, _isSolarMeta),
      );
    }
    if (data.containsKey('month')) {
      context.handle(
        _monthMeta,
        month.isAcceptableOrUnknown(data['month']!, _monthMeta),
      );
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    }
    if (data.containsKey('lunar_year')) {
      context.handle(
        _lunarYearMeta,
        lunarYear.isAcceptableOrUnknown(data['lunar_year']!, _lunarYearMeta),
      );
    }
    if (data.containsKey('lunar_month')) {
      context.handle(
        _lunarMonthMeta,
        lunarMonth.isAcceptableOrUnknown(data['lunar_month']!, _lunarMonthMeta),
      );
    } else if (isInserting) {
      context.missing(_lunarMonthMeta);
    }
    if (data.containsKey('lunar_day')) {
      context.handle(
        _lunarDayMeta,
        lunarDay.isAcceptableOrUnknown(data['lunar_day']!, _lunarDayMeta),
      );
    } else if (isInserting) {
      context.missing(_lunarDayMeta);
    }
    if (data.containsKey('is_leap_month')) {
      context.handle(
        _isLeapMonthMeta,
        isLeapMonth.isAcceptableOrUnknown(
          data['is_leap_month']!,
          _isLeapMonthMeta,
        ),
      );
    }
    if (data.containsKey('advance_days')) {
      context.handle(
        _advanceDaysMeta,
        advanceDays.isAcceptableOrUnknown(
          data['advance_days']!,
          _advanceDaysMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Anniversary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Anniversary(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isSolar: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_solar'],
      )!,
      month: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}month'],
      )!,
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
      lunarYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lunar_year'],
      ),
      lunarMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lunar_month'],
      )!,
      lunarDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lunar_day'],
      )!,
      isLeapMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_leap_month'],
      )!,
      advanceDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}advance_days'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AnniversariesTable createAlias(String alias) {
    return $AnniversariesTable(attachedDatabase, alias);
  }
}

class Anniversary extends DataClass implements Insertable<Anniversary> {
  final String id;
  final String title;
  final String type;
  final bool isSolar;
  final int month;
  final int day;
  final int? lunarYear;
  final int lunarMonth;
  final int lunarDay;
  final bool isLeapMonth;
  final int advanceDays;
  final DateTime createdAt;
  const Anniversary({
    required this.id,
    required this.title,
    required this.type,
    required this.isSolar,
    required this.month,
    required this.day,
    this.lunarYear,
    required this.lunarMonth,
    required this.lunarDay,
    required this.isLeapMonth,
    required this.advanceDays,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['is_solar'] = Variable<bool>(isSolar);
    map['month'] = Variable<int>(month);
    map['day'] = Variable<int>(day);
    if (!nullToAbsent || lunarYear != null) {
      map['lunar_year'] = Variable<int>(lunarYear);
    }
    map['lunar_month'] = Variable<int>(lunarMonth);
    map['lunar_day'] = Variable<int>(lunarDay);
    map['is_leap_month'] = Variable<bool>(isLeapMonth);
    map['advance_days'] = Variable<int>(advanceDays);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AnniversariesCompanion toCompanion(bool nullToAbsent) {
    return AnniversariesCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      isSolar: Value(isSolar),
      month: Value(month),
      day: Value(day),
      lunarYear: lunarYear == null && nullToAbsent
          ? const Value.absent()
          : Value(lunarYear),
      lunarMonth: Value(lunarMonth),
      lunarDay: Value(lunarDay),
      isLeapMonth: Value(isLeapMonth),
      advanceDays: Value(advanceDays),
      createdAt: Value(createdAt),
    );
  }

  factory Anniversary.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Anniversary(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      isSolar: serializer.fromJson<bool>(json['isSolar']),
      month: serializer.fromJson<int>(json['month']),
      day: serializer.fromJson<int>(json['day']),
      lunarYear: serializer.fromJson<int?>(json['lunarYear']),
      lunarMonth: serializer.fromJson<int>(json['lunarMonth']),
      lunarDay: serializer.fromJson<int>(json['lunarDay']),
      isLeapMonth: serializer.fromJson<bool>(json['isLeapMonth']),
      advanceDays: serializer.fromJson<int>(json['advanceDays']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'isSolar': serializer.toJson<bool>(isSolar),
      'month': serializer.toJson<int>(month),
      'day': serializer.toJson<int>(day),
      'lunarYear': serializer.toJson<int?>(lunarYear),
      'lunarMonth': serializer.toJson<int>(lunarMonth),
      'lunarDay': serializer.toJson<int>(lunarDay),
      'isLeapMonth': serializer.toJson<bool>(isLeapMonth),
      'advanceDays': serializer.toJson<int>(advanceDays),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Anniversary copyWith({
    String? id,
    String? title,
    String? type,
    bool? isSolar,
    int? month,
    int? day,
    Value<int?> lunarYear = const Value.absent(),
    int? lunarMonth,
    int? lunarDay,
    bool? isLeapMonth,
    int? advanceDays,
    DateTime? createdAt,
  }) => Anniversary(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    isSolar: isSolar ?? this.isSolar,
    month: month ?? this.month,
    day: day ?? this.day,
    lunarYear: lunarYear.present ? lunarYear.value : this.lunarYear,
    lunarMonth: lunarMonth ?? this.lunarMonth,
    lunarDay: lunarDay ?? this.lunarDay,
    isLeapMonth: isLeapMonth ?? this.isLeapMonth,
    advanceDays: advanceDays ?? this.advanceDays,
    createdAt: createdAt ?? this.createdAt,
  );
  Anniversary copyWithCompanion(AnniversariesCompanion data) {
    return Anniversary(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      isSolar: data.isSolar.present ? data.isSolar.value : this.isSolar,
      month: data.month.present ? data.month.value : this.month,
      day: data.day.present ? data.day.value : this.day,
      lunarYear: data.lunarYear.present ? data.lunarYear.value : this.lunarYear,
      lunarMonth: data.lunarMonth.present
          ? data.lunarMonth.value
          : this.lunarMonth,
      lunarDay: data.lunarDay.present ? data.lunarDay.value : this.lunarDay,
      isLeapMonth: data.isLeapMonth.present
          ? data.isLeapMonth.value
          : this.isLeapMonth,
      advanceDays: data.advanceDays.present
          ? data.advanceDays.value
          : this.advanceDays,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Anniversary(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('isSolar: $isSolar, ')
          ..write('month: $month, ')
          ..write('day: $day, ')
          ..write('lunarYear: $lunarYear, ')
          ..write('lunarMonth: $lunarMonth, ')
          ..write('lunarDay: $lunarDay, ')
          ..write('isLeapMonth: $isLeapMonth, ')
          ..write('advanceDays: $advanceDays, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    type,
    isSolar,
    month,
    day,
    lunarYear,
    lunarMonth,
    lunarDay,
    isLeapMonth,
    advanceDays,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Anniversary &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.isSolar == this.isSolar &&
          other.month == this.month &&
          other.day == this.day &&
          other.lunarYear == this.lunarYear &&
          other.lunarMonth == this.lunarMonth &&
          other.lunarDay == this.lunarDay &&
          other.isLeapMonth == this.isLeapMonth &&
          other.advanceDays == this.advanceDays &&
          other.createdAt == this.createdAt);
}

class AnniversariesCompanion extends UpdateCompanion<Anniversary> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> type;
  final Value<bool> isSolar;
  final Value<int> month;
  final Value<int> day;
  final Value<int?> lunarYear;
  final Value<int> lunarMonth;
  final Value<int> lunarDay;
  final Value<bool> isLeapMonth;
  final Value<int> advanceDays;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AnniversariesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.isSolar = const Value.absent(),
    this.month = const Value.absent(),
    this.day = const Value.absent(),
    this.lunarYear = const Value.absent(),
    this.lunarMonth = const Value.absent(),
    this.lunarDay = const Value.absent(),
    this.isLeapMonth = const Value.absent(),
    this.advanceDays = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnniversariesCompanion.insert({
    required String id,
    required String title,
    this.type = const Value.absent(),
    this.isSolar = const Value.absent(),
    this.month = const Value.absent(),
    this.day = const Value.absent(),
    this.lunarYear = const Value.absent(),
    required int lunarMonth,
    required int lunarDay,
    this.isLeapMonth = const Value.absent(),
    this.advanceDays = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       lunarMonth = Value(lunarMonth),
       lunarDay = Value(lunarDay),
       createdAt = Value(createdAt);
  static Insertable<Anniversary> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<bool>? isSolar,
    Expression<int>? month,
    Expression<int>? day,
    Expression<int>? lunarYear,
    Expression<int>? lunarMonth,
    Expression<int>? lunarDay,
    Expression<bool>? isLeapMonth,
    Expression<int>? advanceDays,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (isSolar != null) 'is_solar': isSolar,
      if (month != null) 'month': month,
      if (day != null) 'day': day,
      if (lunarYear != null) 'lunar_year': lunarYear,
      if (lunarMonth != null) 'lunar_month': lunarMonth,
      if (lunarDay != null) 'lunar_day': lunarDay,
      if (isLeapMonth != null) 'is_leap_month': isLeapMonth,
      if (advanceDays != null) 'advance_days': advanceDays,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnniversariesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? type,
    Value<bool>? isSolar,
    Value<int>? month,
    Value<int>? day,
    Value<int?>? lunarYear,
    Value<int>? lunarMonth,
    Value<int>? lunarDay,
    Value<bool>? isLeapMonth,
    Value<int>? advanceDays,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AnniversariesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      isSolar: isSolar ?? this.isSolar,
      month: month ?? this.month,
      day: day ?? this.day,
      lunarYear: lunarYear ?? this.lunarYear,
      lunarMonth: lunarMonth ?? this.lunarMonth,
      lunarDay: lunarDay ?? this.lunarDay,
      isLeapMonth: isLeapMonth ?? this.isLeapMonth,
      advanceDays: advanceDays ?? this.advanceDays,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isSolar.present) {
      map['is_solar'] = Variable<bool>(isSolar.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (lunarYear.present) {
      map['lunar_year'] = Variable<int>(lunarYear.value);
    }
    if (lunarMonth.present) {
      map['lunar_month'] = Variable<int>(lunarMonth.value);
    }
    if (lunarDay.present) {
      map['lunar_day'] = Variable<int>(lunarDay.value);
    }
    if (isLeapMonth.present) {
      map['is_leap_month'] = Variable<bool>(isLeapMonth.value);
    }
    if (advanceDays.present) {
      map['advance_days'] = Variable<int>(advanceDays.value);
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
    return (StringBuffer('AnniversariesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('isSolar: $isSolar, ')
          ..write('month: $month, ')
          ..write('day: $day, ')
          ..write('lunarYear: $lunarYear, ')
          ..write('lunarMonth: $lunarMonth, ')
          ..write('lunarDay: $lunarDay, ')
          ..write('isLeapMonth: $isLeapMonth, ')
          ..write('advanceDays: $advanceDays, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $AnniversariesTable anniversaries = $AnniversariesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    tasks,
    anniversaries,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tasks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tasks', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> iconCode,
      Value<int> position,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> iconCode,
      Value<int> position,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.categories.id, db.tasks.categoryId),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconCode => $composableBuilder(
    column: $table.iconCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconCode => $composableBuilder(
    column: $table.iconCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
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

  GeneratedColumn<int> get iconCode =>
      $composableBuilder(column: $table.iconCode, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool tasksRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> iconCode = const Value.absent(),
                Value<int> position = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                iconCode: iconCode,
                position: position,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> iconCode = const Value.absent(),
                Value<int> position = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                iconCode: iconCode,
                position: position,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksRefs) db.tasks],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedData<Category, $CategoriesTable, Task>(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._tasksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(db, table, p0).tasksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool tasksRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> notes,
      Value<bool> isDone,
      Value<int> recurrenceMode,
      Value<DateTime?> dueDate,
      Value<DateTime?> reminderAt,
      Value<DateTime> createdAt,
      Value<DateTime?> completedAt,
      Value<int> priority,
      Value<int?> categoryId,
      Value<int?> parentId,
      Value<double> displayOrder,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> notes,
      Value<bool> isDone,
      Value<int> recurrenceMode,
      Value<DateTime?> dueDate,
      Value<DateTime?> reminderAt,
      Value<DateTime> createdAt,
      Value<DateTime?> completedAt,
      Value<int> priority,
      Value<int?> categoryId,
      Value<int?> parentId,
      Value<double> displayOrder,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) => db.categories
      .createAlias($_aliasNameGenerator(db.tasks.categoryId, db.categories.id));

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<int>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TasksTable _parentIdTable(_$AppDatabase db) => db.tasks.createAlias(
    $_aliasNameGenerator(db.tasks.parentId, db.tasks.id),
  );

  $$TasksTableProcessedTableManager? get parentId {
    final $_column = $_itemColumn<int>('parent_id');
    if ($_column == null) return null;
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recurrenceMode => $composableBuilder(
    column: $table.recurrenceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reminderAt => $composableBuilder(
    column: $table.reminderAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableFilterComposer get parentId {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recurrenceMode => $composableBuilder(
    column: $table.recurrenceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reminderAt => $composableBuilder(
    column: $table.reminderAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableOrderingComposer get parentId {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<int> get recurrenceMode => $composableBuilder(
    column: $table.recurrenceMode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get reminderAt => $composableBuilder(
    column: $table.reminderAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<double> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableAnnotationComposer get parentId {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({bool categoryId, bool parentId})
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<int> recurrenceMode = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime?> reminderAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<double> displayOrder = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                title: title,
                notes: notes,
                isDone: isDone,
                recurrenceMode: recurrenceMode,
                dueDate: dueDate,
                reminderAt: reminderAt,
                createdAt: createdAt,
                completedAt: completedAt,
                priority: priority,
                categoryId: categoryId,
                parentId: parentId,
                displayOrder: displayOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> notes = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<int> recurrenceMode = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime?> reminderAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<double> displayOrder = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                notes: notes,
                isDone: isDone,
                recurrenceMode: recurrenceMode,
                dueDate: dueDate,
                reminderAt: reminderAt,
                createdAt: createdAt,
                completedAt: completedAt,
                priority: priority,
                categoryId: categoryId,
                parentId: parentId,
                displayOrder: displayOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TasksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false, parentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$TasksTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (parentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parentId,
                                referencedTable: $$TasksTableReferences
                                    ._parentIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._parentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({bool categoryId, bool parentId})
    >;
typedef $$AnniversariesTableCreateCompanionBuilder =
    AnniversariesCompanion Function({
      required String id,
      required String title,
      Value<String> type,
      Value<bool> isSolar,
      Value<int> month,
      Value<int> day,
      Value<int?> lunarYear,
      required int lunarMonth,
      required int lunarDay,
      Value<bool> isLeapMonth,
      Value<int> advanceDays,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AnniversariesTableUpdateCompanionBuilder =
    AnniversariesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> type,
      Value<bool> isSolar,
      Value<int> month,
      Value<int> day,
      Value<int?> lunarYear,
      Value<int> lunarMonth,
      Value<int> lunarDay,
      Value<bool> isLeapMonth,
      Value<int> advanceDays,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$AnniversariesTableFilterComposer
    extends Composer<_$AppDatabase, $AnniversariesTable> {
  $$AnniversariesTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSolar => $composableBuilder(
    column: $table.isSolar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lunarYear => $composableBuilder(
    column: $table.lunarYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lunarMonth => $composableBuilder(
    column: $table.lunarMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lunarDay => $composableBuilder(
    column: $table.lunarDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLeapMonth => $composableBuilder(
    column: $table.isLeapMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get advanceDays => $composableBuilder(
    column: $table.advanceDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnniversariesTableOrderingComposer
    extends Composer<_$AppDatabase, $AnniversariesTable> {
  $$AnniversariesTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSolar => $composableBuilder(
    column: $table.isSolar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lunarYear => $composableBuilder(
    column: $table.lunarYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lunarMonth => $composableBuilder(
    column: $table.lunarMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lunarDay => $composableBuilder(
    column: $table.lunarDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLeapMonth => $composableBuilder(
    column: $table.isLeapMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get advanceDays => $composableBuilder(
    column: $table.advanceDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnniversariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnniversariesTable> {
  $$AnniversariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isSolar =>
      $composableBuilder(column: $table.isSolar, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get lunarYear =>
      $composableBuilder(column: $table.lunarYear, builder: (column) => column);

  GeneratedColumn<int> get lunarMonth => $composableBuilder(
    column: $table.lunarMonth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lunarDay =>
      $composableBuilder(column: $table.lunarDay, builder: (column) => column);

  GeneratedColumn<bool> get isLeapMonth => $composableBuilder(
    column: $table.isLeapMonth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get advanceDays => $composableBuilder(
    column: $table.advanceDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AnniversariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnniversariesTable,
          Anniversary,
          $$AnniversariesTableFilterComposer,
          $$AnniversariesTableOrderingComposer,
          $$AnniversariesTableAnnotationComposer,
          $$AnniversariesTableCreateCompanionBuilder,
          $$AnniversariesTableUpdateCompanionBuilder,
          (
            Anniversary,
            BaseReferences<_$AppDatabase, $AnniversariesTable, Anniversary>,
          ),
          Anniversary,
          PrefetchHooks Function()
        > {
  $$AnniversariesTableTableManager(_$AppDatabase db, $AnniversariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnniversariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnniversariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnniversariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isSolar = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<int> day = const Value.absent(),
                Value<int?> lunarYear = const Value.absent(),
                Value<int> lunarMonth = const Value.absent(),
                Value<int> lunarDay = const Value.absent(),
                Value<bool> isLeapMonth = const Value.absent(),
                Value<int> advanceDays = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnniversariesCompanion(
                id: id,
                title: title,
                type: type,
                isSolar: isSolar,
                month: month,
                day: day,
                lunarYear: lunarYear,
                lunarMonth: lunarMonth,
                lunarDay: lunarDay,
                isLeapMonth: isLeapMonth,
                advanceDays: advanceDays,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String> type = const Value.absent(),
                Value<bool> isSolar = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<int> day = const Value.absent(),
                Value<int?> lunarYear = const Value.absent(),
                required int lunarMonth,
                required int lunarDay,
                Value<bool> isLeapMonth = const Value.absent(),
                Value<int> advanceDays = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AnniversariesCompanion.insert(
                id: id,
                title: title,
                type: type,
                isSolar: isSolar,
                month: month,
                day: day,
                lunarYear: lunarYear,
                lunarMonth: lunarMonth,
                lunarDay: lunarDay,
                isLeapMonth: isLeapMonth,
                advanceDays: advanceDays,
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

typedef $$AnniversariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnniversariesTable,
      Anniversary,
      $$AnniversariesTableFilterComposer,
      $$AnniversariesTableOrderingComposer,
      $$AnniversariesTableAnnotationComposer,
      $$AnniversariesTableCreateCompanionBuilder,
      $$AnniversariesTableUpdateCompanionBuilder,
      (
        Anniversary,
        BaseReferences<_$AppDatabase, $AnniversariesTable, Anniversary>,
      ),
      Anniversary,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$AnniversariesTableTableManager get anniversaries =>
      $$AnniversariesTableTableManager(_db, _db.anniversaries);
}
