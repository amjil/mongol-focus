// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _perspectivesMeta = const VerificationMeta(
    'perspectives',
  );
  @override
  late final GeneratedColumn<String> perspectives = GeneratedColumn<String>(
    'perspectives',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _postponeCountMeta = const VerificationMeta(
    'postponeCount',
  );
  @override
  late final GeneratedColumn<int> postponeCount = GeneratedColumn<int>(
    'postpone_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _abandonedMeta = const VerificationMeta(
    'abandoned',
  );
  @override
  late final GeneratedColumn<bool> abandoned = GeneratedColumn<bool>(
    'abandoned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("abandoned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<int> dueAt = GeneratedColumn<int>(
    'due_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deferAtMeta = const VerificationMeta(
    'deferAt',
  );
  @override
  late final GeneratedColumn<int> deferAt = GeneratedColumn<int>(
    'defer_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    projectId,
    perspectives,
    completed,
    createdAt,
    priority,
    postponeCount,
    abandoned,
    dueAt,
    deferAt,
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
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    }
    if (data.containsKey('perspectives')) {
      context.handle(
        _perspectivesMeta,
        perspectives.isAcceptableOrUnknown(
          data['perspectives']!,
          _perspectivesMeta,
        ),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
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
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('postpone_count')) {
      context.handle(
        _postponeCountMeta,
        postponeCount.isAcceptableOrUnknown(
          data['postpone_count']!,
          _postponeCountMeta,
        ),
      );
    }
    if (data.containsKey('abandoned')) {
      context.handle(
        _abandonedMeta,
        abandoned.isAcceptableOrUnknown(data['abandoned']!, _abandonedMeta),
      );
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    }
    if (data.containsKey('defer_at')) {
      context.handle(
        _deferAtMeta,
        deferAt.isAcceptableOrUnknown(data['defer_at']!, _deferAtMeta),
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
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      ),
      perspectives: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}perspectives'],
      ),
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      postponeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}postpone_count'],
      )!,
      abandoned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}abandoned'],
      )!,
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_at'],
      ),
      deferAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}defer_at'],
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String title;
  final String? projectId;
  final String? perspectives;
  final bool completed;
  final int createdAt;
  final int priority;
  final int postponeCount;
  final bool abandoned;
  final int? dueAt;
  final int? deferAt;
  const Task({
    required this.id,
    required this.title,
    this.projectId,
    this.perspectives,
    required this.completed,
    required this.createdAt,
    required this.priority,
    required this.postponeCount,
    required this.abandoned,
    this.dueAt,
    this.deferAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || perspectives != null) {
      map['perspectives'] = Variable<String>(perspectives);
    }
    map['completed'] = Variable<bool>(completed);
    map['created_at'] = Variable<int>(createdAt);
    map['priority'] = Variable<int>(priority);
    map['postpone_count'] = Variable<int>(postponeCount);
    map['abandoned'] = Variable<bool>(abandoned);
    if (!nullToAbsent || dueAt != null) {
      map['due_at'] = Variable<int>(dueAt);
    }
    if (!nullToAbsent || deferAt != null) {
      map['defer_at'] = Variable<int>(deferAt);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      perspectives: perspectives == null && nullToAbsent
          ? const Value.absent()
          : Value(perspectives),
      completed: Value(completed),
      createdAt: Value(createdAt),
      priority: Value(priority),
      postponeCount: Value(postponeCount),
      abandoned: Value(abandoned),
      dueAt: dueAt == null && nullToAbsent
          ? const Value.absent()
          : Value(dueAt),
      deferAt: deferAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deferAt),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      perspectives: serializer.fromJson<String?>(json['perspectives']),
      completed: serializer.fromJson<bool>(json['completed']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      priority: serializer.fromJson<int>(json['priority']),
      postponeCount: serializer.fromJson<int>(json['postponeCount']),
      abandoned: serializer.fromJson<bool>(json['abandoned']),
      dueAt: serializer.fromJson<int?>(json['dueAt']),
      deferAt: serializer.fromJson<int?>(json['deferAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'projectId': serializer.toJson<String?>(projectId),
      'perspectives': serializer.toJson<String?>(perspectives),
      'completed': serializer.toJson<bool>(completed),
      'createdAt': serializer.toJson<int>(createdAt),
      'priority': serializer.toJson<int>(priority),
      'postponeCount': serializer.toJson<int>(postponeCount),
      'abandoned': serializer.toJson<bool>(abandoned),
      'dueAt': serializer.toJson<int?>(dueAt),
      'deferAt': serializer.toJson<int?>(deferAt),
    };
  }

  Task copyWith({
    String? id,
    String? title,
    Value<String?> projectId = const Value.absent(),
    Value<String?> perspectives = const Value.absent(),
    bool? completed,
    int? createdAt,
    int? priority,
    int? postponeCount,
    bool? abandoned,
    Value<int?> dueAt = const Value.absent(),
    Value<int?> deferAt = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    projectId: projectId.present ? projectId.value : this.projectId,
    perspectives: perspectives.present ? perspectives.value : this.perspectives,
    completed: completed ?? this.completed,
    createdAt: createdAt ?? this.createdAt,
    priority: priority ?? this.priority,
    postponeCount: postponeCount ?? this.postponeCount,
    abandoned: abandoned ?? this.abandoned,
    dueAt: dueAt.present ? dueAt.value : this.dueAt,
    deferAt: deferAt.present ? deferAt.value : this.deferAt,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      perspectives: data.perspectives.present
          ? data.perspectives.value
          : this.perspectives,
      completed: data.completed.present ? data.completed.value : this.completed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      priority: data.priority.present ? data.priority.value : this.priority,
      postponeCount: data.postponeCount.present
          ? data.postponeCount.value
          : this.postponeCount,
      abandoned: data.abandoned.present ? data.abandoned.value : this.abandoned,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      deferAt: data.deferAt.present ? data.deferAt.value : this.deferAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('projectId: $projectId, ')
          ..write('perspectives: $perspectives, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt, ')
          ..write('priority: $priority, ')
          ..write('postponeCount: $postponeCount, ')
          ..write('abandoned: $abandoned, ')
          ..write('dueAt: $dueAt, ')
          ..write('deferAt: $deferAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    projectId,
    perspectives,
    completed,
    createdAt,
    priority,
    postponeCount,
    abandoned,
    dueAt,
    deferAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.projectId == this.projectId &&
          other.perspectives == this.perspectives &&
          other.completed == this.completed &&
          other.createdAt == this.createdAt &&
          other.priority == this.priority &&
          other.postponeCount == this.postponeCount &&
          other.abandoned == this.abandoned &&
          other.dueAt == this.dueAt &&
          other.deferAt == this.deferAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> projectId;
  final Value<String?> perspectives;
  final Value<bool> completed;
  final Value<int> createdAt;
  final Value<int> priority;
  final Value<int> postponeCount;
  final Value<bool> abandoned;
  final Value<int?> dueAt;
  final Value<int?> deferAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.projectId = const Value.absent(),
    this.perspectives = const Value.absent(),
    this.completed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.priority = const Value.absent(),
    this.postponeCount = const Value.absent(),
    this.abandoned = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.deferAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String title,
    this.projectId = const Value.absent(),
    this.perspectives = const Value.absent(),
    this.completed = const Value.absent(),
    required int createdAt,
    this.priority = const Value.absent(),
    this.postponeCount = const Value.absent(),
    this.abandoned = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.deferAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? projectId,
    Expression<String>? perspectives,
    Expression<bool>? completed,
    Expression<int>? createdAt,
    Expression<int>? priority,
    Expression<int>? postponeCount,
    Expression<bool>? abandoned,
    Expression<int>? dueAt,
    Expression<int>? deferAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (projectId != null) 'project_id': projectId,
      if (perspectives != null) 'perspectives': perspectives,
      if (completed != null) 'completed': completed,
      if (createdAt != null) 'created_at': createdAt,
      if (priority != null) 'priority': priority,
      if (postponeCount != null) 'postpone_count': postponeCount,
      if (abandoned != null) 'abandoned': abandoned,
      if (dueAt != null) 'due_at': dueAt,
      if (deferAt != null) 'defer_at': deferAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? projectId,
    Value<String?>? perspectives,
    Value<bool>? completed,
    Value<int>? createdAt,
    Value<int>? priority,
    Value<int>? postponeCount,
    Value<bool>? abandoned,
    Value<int?>? dueAt,
    Value<int?>? deferAt,
    Value<int>? rowid,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      projectId: projectId ?? this.projectId,
      perspectives: perspectives ?? this.perspectives,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      priority: priority ?? this.priority,
      postponeCount: postponeCount ?? this.postponeCount,
      abandoned: abandoned ?? this.abandoned,
      dueAt: dueAt ?? this.dueAt,
      deferAt: deferAt ?? this.deferAt,
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
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (perspectives.present) {
      map['perspectives'] = Variable<String>(perspectives.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (postponeCount.present) {
      map['postpone_count'] = Variable<int>(postponeCount.value);
    }
    if (abandoned.present) {
      map['abandoned'] = Variable<bool>(abandoned.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<int>(dueAt.value);
    }
    if (deferAt.present) {
      map['defer_at'] = Variable<int>(deferAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('projectId: $projectId, ')
          ..write('perspectives: $perspectives, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt, ')
          ..write('priority: $priority, ')
          ..write('postponeCount: $postponeCount, ')
          ..write('abandoned: $abandoned, ')
          ..write('dueAt: $dueAt, ')
          ..write('deferAt: $deferAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ForecastsTable extends Forecasts
    with TableInfo<$ForecastsTable, Forecast> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ForecastsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledDateMeta = const VerificationMeta(
    'scheduledDate',
  );
  @override
  late final GeneratedColumn<int> scheduledDate = GeneratedColumn<int>(
    'scheduled_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _skippedMeta = const VerificationMeta(
    'skipped',
  );
  @override
  late final GeneratedColumn<bool> skipped = GeneratedColumn<bool>(
    'skipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("skipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(50),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<int> source = GeneratedColumn<int>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    taskId,
    scheduledDate,
    done,
    skipped,
    confidence,
    source,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'forecasts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Forecast> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('scheduled_date')) {
      context.handle(
        _scheduledDateMeta,
        scheduledDate.isAcceptableOrUnknown(
          data['scheduled_date']!,
          _scheduledDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledDateMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
    }
    if (data.containsKey('skipped')) {
      context.handle(
        _skippedMeta,
        skipped.isAcceptableOrUnknown(data['skipped']!, _skippedMeta),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
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
  Forecast map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Forecast(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      scheduledDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scheduled_date'],
      )!,
      done: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}done'],
      )!,
      skipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}skipped'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ForecastsTable createAlias(String alias) {
    return $ForecastsTable(attachedDatabase, alias);
  }
}

class Forecast extends DataClass implements Insertable<Forecast> {
  final String id;
  final String taskId;
  final int scheduledDate;
  final bool done;
  final bool skipped;
  final int confidence;
  final int source;
  final int createdAt;
  const Forecast({
    required this.id,
    required this.taskId,
    required this.scheduledDate,
    required this.done,
    required this.skipped,
    required this.confidence,
    required this.source,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['scheduled_date'] = Variable<int>(scheduledDate);
    map['done'] = Variable<bool>(done);
    map['skipped'] = Variable<bool>(skipped);
    map['confidence'] = Variable<int>(confidence);
    map['source'] = Variable<int>(source);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ForecastsCompanion toCompanion(bool nullToAbsent) {
    return ForecastsCompanion(
      id: Value(id),
      taskId: Value(taskId),
      scheduledDate: Value(scheduledDate),
      done: Value(done),
      skipped: Value(skipped),
      confidence: Value(confidence),
      source: Value(source),
      createdAt: Value(createdAt),
    );
  }

  factory Forecast.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Forecast(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      scheduledDate: serializer.fromJson<int>(json['scheduledDate']),
      done: serializer.fromJson<bool>(json['done']),
      skipped: serializer.fromJson<bool>(json['skipped']),
      confidence: serializer.fromJson<int>(json['confidence']),
      source: serializer.fromJson<int>(json['source']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'scheduledDate': serializer.toJson<int>(scheduledDate),
      'done': serializer.toJson<bool>(done),
      'skipped': serializer.toJson<bool>(skipped),
      'confidence': serializer.toJson<int>(confidence),
      'source': serializer.toJson<int>(source),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Forecast copyWith({
    String? id,
    String? taskId,
    int? scheduledDate,
    bool? done,
    bool? skipped,
    int? confidence,
    int? source,
    int? createdAt,
  }) => Forecast(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    scheduledDate: scheduledDate ?? this.scheduledDate,
    done: done ?? this.done,
    skipped: skipped ?? this.skipped,
    confidence: confidence ?? this.confidence,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
  );
  Forecast copyWithCompanion(ForecastsCompanion data) {
    return Forecast(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      scheduledDate: data.scheduledDate.present
          ? data.scheduledDate.value
          : this.scheduledDate,
      done: data.done.present ? data.done.value : this.done,
      skipped: data.skipped.present ? data.skipped.value : this.skipped,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Forecast(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('done: $done, ')
          ..write('skipped: $skipped, ')
          ..write('confidence: $confidence, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    taskId,
    scheduledDate,
    done,
    skipped,
    confidence,
    source,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Forecast &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.scheduledDate == this.scheduledDate &&
          other.done == this.done &&
          other.skipped == this.skipped &&
          other.confidence == this.confidence &&
          other.source == this.source &&
          other.createdAt == this.createdAt);
}

class ForecastsCompanion extends UpdateCompanion<Forecast> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<int> scheduledDate;
  final Value<bool> done;
  final Value<bool> skipped;
  final Value<int> confidence;
  final Value<int> source;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ForecastsCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.scheduledDate = const Value.absent(),
    this.done = const Value.absent(),
    this.skipped = const Value.absent(),
    this.confidence = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ForecastsCompanion.insert({
    required String id,
    required String taskId,
    required int scheduledDate,
    this.done = const Value.absent(),
    this.skipped = const Value.absent(),
    this.confidence = const Value.absent(),
    this.source = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       scheduledDate = Value(scheduledDate),
       createdAt = Value(createdAt);
  static Insertable<Forecast> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<int>? scheduledDate,
    Expression<bool>? done,
    Expression<bool>? skipped,
    Expression<int>? confidence,
    Expression<int>? source,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (scheduledDate != null) 'scheduled_date': scheduledDate,
      if (done != null) 'done': done,
      if (skipped != null) 'skipped': skipped,
      if (confidence != null) 'confidence': confidence,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ForecastsCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<int>? scheduledDate,
    Value<bool>? done,
    Value<bool>? skipped,
    Value<int>? confidence,
    Value<int>? source,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ForecastsCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      done: done ?? this.done,
      skipped: skipped ?? this.skipped,
      confidence: confidence ?? this.confidence,
      source: source ?? this.source,
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
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (scheduledDate.present) {
      map['scheduled_date'] = Variable<int>(scheduledDate.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (skipped.present) {
      map['skipped'] = Variable<bool>(skipped.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ForecastsCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('done: $done, ')
          ..write('skipped: $skipped, ')
          ..write('confidence: $confidence, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
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
  static const VerificationMeta _periodStartMeta = const VerificationMeta(
    'periodStart',
  );
  @override
  late final GeneratedColumn<int> periodStart = GeneratedColumn<int>(
    'period_start',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodEndMeta = const VerificationMeta(
    'periodEnd',
  );
  @override
  late final GeneratedColumn<int> periodEnd = GeneratedColumn<int>(
    'period_end',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedCountMeta = const VerificationMeta(
    'expectedCount',
  );
  @override
  late final GeneratedColumn<int> expectedCount = GeneratedColumn<int>(
    'expected_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualCountMeta = const VerificationMeta(
    'actualCount',
  );
  @override
  late final GeneratedColumn<int> actualCount = GeneratedColumn<int>(
    'actual_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedDurationMeta = const VerificationMeta(
    'expectedDuration',
  );
  @override
  late final GeneratedColumn<int> expectedDuration = GeneratedColumn<int>(
    'expected_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualDurationMeta = const VerificationMeta(
    'actualDuration',
  );
  @override
  late final GeneratedColumn<int> actualDuration = GeneratedColumn<int>(
    'actual_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodScoreMeta = const VerificationMeta(
    'moodScore',
  );
  @override
  late final GeneratedColumn<int> moodScore = GeneratedColumn<int>(
    'mood_score',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _focusScoreMeta = const VerificationMeta(
    'focusScore',
  );
  @override
  late final GeneratedColumn<int> focusScore = GeneratedColumn<int>(
    'focus_score',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    periodStart,
    periodEnd,
    expectedCount,
    actualCount,
    expectedDuration,
    actualDuration,
    moodScore,
    focusScore,
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
    if (data.containsKey('period_start')) {
      context.handle(
        _periodStartMeta,
        periodStart.isAcceptableOrUnknown(
          data['period_start']!,
          _periodStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_periodStartMeta);
    }
    if (data.containsKey('period_end')) {
      context.handle(
        _periodEndMeta,
        periodEnd.isAcceptableOrUnknown(data['period_end']!, _periodEndMeta),
      );
    } else if (isInserting) {
      context.missing(_periodEndMeta);
    }
    if (data.containsKey('expected_count')) {
      context.handle(
        _expectedCountMeta,
        expectedCount.isAcceptableOrUnknown(
          data['expected_count']!,
          _expectedCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expectedCountMeta);
    }
    if (data.containsKey('actual_count')) {
      context.handle(
        _actualCountMeta,
        actualCount.isAcceptableOrUnknown(
          data['actual_count']!,
          _actualCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actualCountMeta);
    }
    if (data.containsKey('expected_duration')) {
      context.handle(
        _expectedDurationMeta,
        expectedDuration.isAcceptableOrUnknown(
          data['expected_duration']!,
          _expectedDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expectedDurationMeta);
    }
    if (data.containsKey('actual_duration')) {
      context.handle(
        _actualDurationMeta,
        actualDuration.isAcceptableOrUnknown(
          data['actual_duration']!,
          _actualDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actualDurationMeta);
    }
    if (data.containsKey('mood_score')) {
      context.handle(
        _moodScoreMeta,
        moodScore.isAcceptableOrUnknown(data['mood_score']!, _moodScoreMeta),
      );
    }
    if (data.containsKey('focus_score')) {
      context.handle(
        _focusScoreMeta,
        focusScore.isAcceptableOrUnknown(data['focus_score']!, _focusScoreMeta),
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
  Review map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Review(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      periodStart: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period_start'],
      )!,
      periodEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period_end'],
      )!,
      expectedCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expected_count'],
      )!,
      actualCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}actual_count'],
      )!,
      expectedDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expected_duration'],
      )!,
      actualDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}actual_duration'],
      )!,
      moodScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood_score'],
      ),
      focusScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}focus_score'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
  final int periodStart;
  final int periodEnd;
  final int expectedCount;
  final int actualCount;
  final int expectedDuration;
  final int actualDuration;
  final int? moodScore;
  final int? focusScore;
  final int createdAt;
  const Review({
    required this.id,
    required this.periodStart,
    required this.periodEnd,
    required this.expectedCount,
    required this.actualCount,
    required this.expectedDuration,
    required this.actualDuration,
    this.moodScore,
    this.focusScore,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['period_start'] = Variable<int>(periodStart);
    map['period_end'] = Variable<int>(periodEnd);
    map['expected_count'] = Variable<int>(expectedCount);
    map['actual_count'] = Variable<int>(actualCount);
    map['expected_duration'] = Variable<int>(expectedDuration);
    map['actual_duration'] = Variable<int>(actualDuration);
    if (!nullToAbsent || moodScore != null) {
      map['mood_score'] = Variable<int>(moodScore);
    }
    if (!nullToAbsent || focusScore != null) {
      map['focus_score'] = Variable<int>(focusScore);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      periodStart: Value(periodStart),
      periodEnd: Value(periodEnd),
      expectedCount: Value(expectedCount),
      actualCount: Value(actualCount),
      expectedDuration: Value(expectedDuration),
      actualDuration: Value(actualDuration),
      moodScore: moodScore == null && nullToAbsent
          ? const Value.absent()
          : Value(moodScore),
      focusScore: focusScore == null && nullToAbsent
          ? const Value.absent()
          : Value(focusScore),
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
      periodStart: serializer.fromJson<int>(json['periodStart']),
      periodEnd: serializer.fromJson<int>(json['periodEnd']),
      expectedCount: serializer.fromJson<int>(json['expectedCount']),
      actualCount: serializer.fromJson<int>(json['actualCount']),
      expectedDuration: serializer.fromJson<int>(json['expectedDuration']),
      actualDuration: serializer.fromJson<int>(json['actualDuration']),
      moodScore: serializer.fromJson<int?>(json['moodScore']),
      focusScore: serializer.fromJson<int?>(json['focusScore']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'periodStart': serializer.toJson<int>(periodStart),
      'periodEnd': serializer.toJson<int>(periodEnd),
      'expectedCount': serializer.toJson<int>(expectedCount),
      'actualCount': serializer.toJson<int>(actualCount),
      'expectedDuration': serializer.toJson<int>(expectedDuration),
      'actualDuration': serializer.toJson<int>(actualDuration),
      'moodScore': serializer.toJson<int?>(moodScore),
      'focusScore': serializer.toJson<int?>(focusScore),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Review copyWith({
    String? id,
    int? periodStart,
    int? periodEnd,
    int? expectedCount,
    int? actualCount,
    int? expectedDuration,
    int? actualDuration,
    Value<int?> moodScore = const Value.absent(),
    Value<int?> focusScore = const Value.absent(),
    int? createdAt,
  }) => Review(
    id: id ?? this.id,
    periodStart: periodStart ?? this.periodStart,
    periodEnd: periodEnd ?? this.periodEnd,
    expectedCount: expectedCount ?? this.expectedCount,
    actualCount: actualCount ?? this.actualCount,
    expectedDuration: expectedDuration ?? this.expectedDuration,
    actualDuration: actualDuration ?? this.actualDuration,
    moodScore: moodScore.present ? moodScore.value : this.moodScore,
    focusScore: focusScore.present ? focusScore.value : this.focusScore,
    createdAt: createdAt ?? this.createdAt,
  );
  Review copyWithCompanion(ReviewsCompanion data) {
    return Review(
      id: data.id.present ? data.id.value : this.id,
      periodStart: data.periodStart.present
          ? data.periodStart.value
          : this.periodStart,
      periodEnd: data.periodEnd.present ? data.periodEnd.value : this.periodEnd,
      expectedCount: data.expectedCount.present
          ? data.expectedCount.value
          : this.expectedCount,
      actualCount: data.actualCount.present
          ? data.actualCount.value
          : this.actualCount,
      expectedDuration: data.expectedDuration.present
          ? data.expectedDuration.value
          : this.expectedDuration,
      actualDuration: data.actualDuration.present
          ? data.actualDuration.value
          : this.actualDuration,
      moodScore: data.moodScore.present ? data.moodScore.value : this.moodScore,
      focusScore: data.focusScore.present
          ? data.focusScore.value
          : this.focusScore,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Review(')
          ..write('id: $id, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('expectedCount: $expectedCount, ')
          ..write('actualCount: $actualCount, ')
          ..write('expectedDuration: $expectedDuration, ')
          ..write('actualDuration: $actualDuration, ')
          ..write('moodScore: $moodScore, ')
          ..write('focusScore: $focusScore, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    periodStart,
    periodEnd,
    expectedCount,
    actualCount,
    expectedDuration,
    actualDuration,
    moodScore,
    focusScore,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Review &&
          other.id == this.id &&
          other.periodStart == this.periodStart &&
          other.periodEnd == this.periodEnd &&
          other.expectedCount == this.expectedCount &&
          other.actualCount == this.actualCount &&
          other.expectedDuration == this.expectedDuration &&
          other.actualDuration == this.actualDuration &&
          other.moodScore == this.moodScore &&
          other.focusScore == this.focusScore &&
          other.createdAt == this.createdAt);
}

class ReviewsCompanion extends UpdateCompanion<Review> {
  final Value<String> id;
  final Value<int> periodStart;
  final Value<int> periodEnd;
  final Value<int> expectedCount;
  final Value<int> actualCount;
  final Value<int> expectedDuration;
  final Value<int> actualDuration;
  final Value<int?> moodScore;
  final Value<int?> focusScore;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.expectedCount = const Value.absent(),
    this.actualCount = const Value.absent(),
    this.expectedDuration = const Value.absent(),
    this.actualDuration = const Value.absent(),
    this.moodScore = const Value.absent(),
    this.focusScore = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewsCompanion.insert({
    required String id,
    required int periodStart,
    required int periodEnd,
    required int expectedCount,
    required int actualCount,
    required int expectedDuration,
    required int actualDuration,
    this.moodScore = const Value.absent(),
    this.focusScore = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       periodStart = Value(periodStart),
       periodEnd = Value(periodEnd),
       expectedCount = Value(expectedCount),
       actualCount = Value(actualCount),
       expectedDuration = Value(expectedDuration),
       actualDuration = Value(actualDuration),
       createdAt = Value(createdAt);
  static Insertable<Review> custom({
    Expression<String>? id,
    Expression<int>? periodStart,
    Expression<int>? periodEnd,
    Expression<int>? expectedCount,
    Expression<int>? actualCount,
    Expression<int>? expectedDuration,
    Expression<int>? actualDuration,
    Expression<int>? moodScore,
    Expression<int>? focusScore,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (expectedCount != null) 'expected_count': expectedCount,
      if (actualCount != null) 'actual_count': actualCount,
      if (expectedDuration != null) 'expected_duration': expectedDuration,
      if (actualDuration != null) 'actual_duration': actualDuration,
      if (moodScore != null) 'mood_score': moodScore,
      if (focusScore != null) 'focus_score': focusScore,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewsCompanion copyWith({
    Value<String>? id,
    Value<int>? periodStart,
    Value<int>? periodEnd,
    Value<int>? expectedCount,
    Value<int>? actualCount,
    Value<int>? expectedDuration,
    Value<int>? actualDuration,
    Value<int?>? moodScore,
    Value<int?>? focusScore,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ReviewsCompanion(
      id: id ?? this.id,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      expectedCount: expectedCount ?? this.expectedCount,
      actualCount: actualCount ?? this.actualCount,
      expectedDuration: expectedDuration ?? this.expectedDuration,
      actualDuration: actualDuration ?? this.actualDuration,
      moodScore: moodScore ?? this.moodScore,
      focusScore: focusScore ?? this.focusScore,
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
    if (periodStart.present) {
      map['period_start'] = Variable<int>(periodStart.value);
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<int>(periodEnd.value);
    }
    if (expectedCount.present) {
      map['expected_count'] = Variable<int>(expectedCount.value);
    }
    if (actualCount.present) {
      map['actual_count'] = Variable<int>(actualCount.value);
    }
    if (expectedDuration.present) {
      map['expected_duration'] = Variable<int>(expectedDuration.value);
    }
    if (actualDuration.present) {
      map['actual_duration'] = Variable<int>(actualDuration.value);
    }
    if (moodScore.present) {
      map['mood_score'] = Variable<int>(moodScore.value);
    }
    if (focusScore.present) {
      map['focus_score'] = Variable<int>(focusScore.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
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
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('expectedCount: $expectedCount, ')
          ..write('actualCount: $actualCount, ')
          ..write('expectedDuration: $expectedDuration, ')
          ..write('actualDuration: $actualDuration, ')
          ..write('moodScore: $moodScore, ')
          ..write('focusScore: $focusScore, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimelineEventsTable extends TimelineEvents
    with TableInfo<$TimelineEventsTable, TimelineEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimelineEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _perspectivesMeta = const VerificationMeta(
    'perspectives',
  );
  @override
  late final GeneratedColumn<String> perspectives = GeneratedColumn<String>(
    'perspectives',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    timestamp,
    type,
    entityType,
    entityId,
    title,
    duration,
    perspectives,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeline_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimelineEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('perspectives')) {
      context.handle(
        _perspectivesMeta,
        perspectives.isAcceptableOrUnknown(
          data['perspectives']!,
          _perspectivesMeta,
        ),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimelineEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimelineEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      perspectives: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}perspectives'],
      ),
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      ),
    );
  }

  @override
  $TimelineEventsTable createAlias(String alias) {
    return $TimelineEventsTable(attachedDatabase, alias);
  }
}

class TimelineEvent extends DataClass implements Insertable<TimelineEvent> {
  final String id;
  final int timestamp;
  final String type;
  final String entityType;
  final String? entityId;
  final String title;
  final int? duration;
  final String? perspectives;
  final String? payload;
  const TimelineEvent({
    required this.id,
    required this.timestamp,
    required this.type,
    required this.entityType,
    this.entityId,
    required this.title,
    this.duration,
    this.perspectives,
    this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['timestamp'] = Variable<int>(timestamp);
    map['type'] = Variable<String>(type);
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || perspectives != null) {
      map['perspectives'] = Variable<String>(perspectives);
    }
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    return map;
  }

  TimelineEventsCompanion toCompanion(bool nullToAbsent) {
    return TimelineEventsCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      type: Value(type),
      entityType: Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      title: Value(title),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      perspectives: perspectives == null && nullToAbsent
          ? const Value.absent()
          : Value(perspectives),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
    );
  }

  factory TimelineEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimelineEvent(
      id: serializer.fromJson<String>(json['id']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      type: serializer.fromJson<String>(json['type']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      title: serializer.fromJson<String>(json['title']),
      duration: serializer.fromJson<int?>(json['duration']),
      perspectives: serializer.fromJson<String?>(json['perspectives']),
      payload: serializer.fromJson<String?>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'timestamp': serializer.toJson<int>(timestamp),
      'type': serializer.toJson<String>(type),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String?>(entityId),
      'title': serializer.toJson<String>(title),
      'duration': serializer.toJson<int?>(duration),
      'perspectives': serializer.toJson<String?>(perspectives),
      'payload': serializer.toJson<String?>(payload),
    };
  }

  TimelineEvent copyWith({
    String? id,
    int? timestamp,
    String? type,
    String? entityType,
    Value<String?> entityId = const Value.absent(),
    String? title,
    Value<int?> duration = const Value.absent(),
    Value<String?> perspectives = const Value.absent(),
    Value<String?> payload = const Value.absent(),
  }) => TimelineEvent(
    id: id ?? this.id,
    timestamp: timestamp ?? this.timestamp,
    type: type ?? this.type,
    entityType: entityType ?? this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    title: title ?? this.title,
    duration: duration.present ? duration.value : this.duration,
    perspectives: perspectives.present ? perspectives.value : this.perspectives,
    payload: payload.present ? payload.value : this.payload,
  );
  TimelineEvent copyWithCompanion(TimelineEventsCompanion data) {
    return TimelineEvent(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      type: data.type.present ? data.type.value : this.type,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      title: data.title.present ? data.title.value : this.title,
      duration: data.duration.present ? data.duration.value : this.duration,
      perspectives: data.perspectives.present
          ? data.perspectives.value
          : this.perspectives,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEvent(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('title: $title, ')
          ..write('duration: $duration, ')
          ..write('perspectives: $perspectives, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    timestamp,
    type,
    entityType,
    entityId,
    title,
    duration,
    perspectives,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineEvent &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.type == this.type &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.title == this.title &&
          other.duration == this.duration &&
          other.perspectives == this.perspectives &&
          other.payload == this.payload);
}

class TimelineEventsCompanion extends UpdateCompanion<TimelineEvent> {
  final Value<String> id;
  final Value<int> timestamp;
  final Value<String> type;
  final Value<String> entityType;
  final Value<String?> entityId;
  final Value<String> title;
  final Value<int?> duration;
  final Value<String?> perspectives;
  final Value<String?> payload;
  final Value<int> rowid;
  const TimelineEventsCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.title = const Value.absent(),
    this.duration = const Value.absent(),
    this.perspectives = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimelineEventsCompanion.insert({
    required String id,
    required int timestamp,
    required String type,
    required String entityType,
    this.entityId = const Value.absent(),
    required String title,
    this.duration = const Value.absent(),
    this.perspectives = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       timestamp = Value(timestamp),
       type = Value(type),
       entityType = Value(entityType),
       title = Value(title);
  static Insertable<TimelineEvent> custom({
    Expression<String>? id,
    Expression<int>? timestamp,
    Expression<String>? type,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? title,
    Expression<int>? duration,
    Expression<String>? perspectives,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (type != null) 'type': type,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (title != null) 'title': title,
      if (duration != null) 'duration': duration,
      if (perspectives != null) 'perspectives': perspectives,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimelineEventsCompanion copyWith({
    Value<String>? id,
    Value<int>? timestamp,
    Value<String>? type,
    Value<String>? entityType,
    Value<String?>? entityId,
    Value<String>? title,
    Value<int?>? duration,
    Value<String?>? perspectives,
    Value<String?>? payload,
    Value<int>? rowid,
  }) {
    return TimelineEventsCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      perspectives: perspectives ?? this.perspectives,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (perspectives.present) {
      map['perspectives'] = Variable<String>(perspectives.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEventsCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('title: $title, ')
          ..write('duration: $duration, ')
          ..write('perspectives: $perspectives, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewAtMeta = const VerificationMeta(
    'reviewAt',
  );
  @override
  late final GeneratedColumn<int> reviewAt = GeneratedColumn<int>(
    'review_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    createdAt,
    reviewAt,
    completed,
    status,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('review_at')) {
      context.handle(
        _reviewAtMeta,
        reviewAt.isAcceptableOrUnknown(data['review_at']!, _reviewAtMeta),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      reviewAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_at'],
      ),
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final String id;
  final String title;
  final int createdAt;
  final int? reviewAt;
  final bool completed;
  final String status;
  final String? notes;
  const Project({
    required this.id,
    required this.title,
    required this.createdAt,
    this.reviewAt,
    required this.completed,
    required this.status,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || reviewAt != null) {
      map['review_at'] = Variable<int>(reviewAt);
    }
    map['completed'] = Variable<bool>(completed);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
      reviewAt: reviewAt == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewAt),
      completed: Value(completed),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      reviewAt: serializer.fromJson<int?>(json['reviewAt']),
      completed: serializer.fromJson<bool>(json['completed']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<int>(createdAt),
      'reviewAt': serializer.toJson<int?>(reviewAt),
      'completed': serializer.toJson<bool>(completed),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Project copyWith({
    String? id,
    String? title,
    int? createdAt,
    Value<int?> reviewAt = const Value.absent(),
    bool? completed,
    String? status,
    Value<String?> notes = const Value.absent(),
  }) => Project(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    reviewAt: reviewAt.present ? reviewAt.value : this.reviewAt,
    completed: completed ?? this.completed,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      reviewAt: data.reviewAt.present ? data.reviewAt.value : this.reviewAt,
      completed: data.completed.present ? data.completed.value : this.completed,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('reviewAt: $reviewAt, ')
          ..write('completed: $completed, ')
          ..write('status: $status, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, createdAt, reviewAt, completed, status, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.reviewAt == this.reviewAt &&
          other.completed == this.completed &&
          other.status == this.status &&
          other.notes == this.notes);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> createdAt;
  final Value<int?> reviewAt;
  final Value<bool> completed;
  final Value<String> status;
  final Value<String?> notes;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.reviewAt = const Value.absent(),
    this.completed = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String title,
    required int createdAt,
    this.reviewAt = const Value.absent(),
    this.completed = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? createdAt,
    Expression<int>? reviewAt,
    Expression<bool>? completed,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
      if (reviewAt != null) 'review_at': reviewAt,
      if (completed != null) 'completed': completed,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? createdAt,
    Value<int?>? reviewAt,
    Value<bool>? completed,
    Value<String>? status,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      reviewAt: reviewAt ?? this.reviewAt,
      completed: completed ?? this.completed,
      status: status ?? this.status,
      notes: notes ?? this.notes,
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
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (reviewAt.present) {
      map['review_at'] = Variable<int>(reviewAt.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('reviewAt: $reviewAt, ')
          ..write('completed: $completed, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.5),
  );
  static const VerificationMeta _weightHistoryMeta = const VerificationMeta(
    'weightHistory',
  );
  @override
  late final GeneratedColumn<String> weightHistory = GeneratedColumn<String>(
    'weight_history',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rulesMeta = const VerificationMeta('rules');
  @override
  late final GeneratedColumn<String> rules = GeneratedColumn<String>(
    'rules',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    weight,
    weightHistory,
    createdAt,
    updatedAt,
    rules,
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('weight_history')) {
      context.handle(
        _weightHistoryMeta,
        weightHistory.isAcceptableOrUnknown(
          data['weight_history']!,
          _weightHistoryMeta,
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('rules')) {
      context.handle(
        _rulesMeta,
        rules.isAcceptableOrUnknown(data['rules']!, _rulesMeta),
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
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      weightHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight_history'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      rules: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rules'],
      ),
    );
  }

  @override
  $PerspectivesTable createAlias(String alias) {
    return $PerspectivesTable(attachedDatabase, alias);
  }
}

class Perspective extends DataClass implements Insertable<Perspective> {
  final String id;
  final String title;
  final double weight;
  final String? weightHistory;
  final int createdAt;
  final int updatedAt;
  final String? rules;
  const Perspective({
    required this.id,
    required this.title,
    required this.weight,
    this.weightHistory,
    required this.createdAt,
    required this.updatedAt,
    this.rules,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || weightHistory != null) {
      map['weight_history'] = Variable<String>(weightHistory);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || rules != null) {
      map['rules'] = Variable<String>(rules);
    }
    return map;
  }

  PerspectivesCompanion toCompanion(bool nullToAbsent) {
    return PerspectivesCompanion(
      id: Value(id),
      title: Value(title),
      weight: Value(weight),
      weightHistory: weightHistory == null && nullToAbsent
          ? const Value.absent()
          : Value(weightHistory),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      rules: rules == null && nullToAbsent
          ? const Value.absent()
          : Value(rules),
    );
  }

  factory Perspective.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Perspective(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      weight: serializer.fromJson<double>(json['weight']),
      weightHistory: serializer.fromJson<String?>(json['weightHistory']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      rules: serializer.fromJson<String?>(json['rules']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'weight': serializer.toJson<double>(weight),
      'weightHistory': serializer.toJson<String?>(weightHistory),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'rules': serializer.toJson<String?>(rules),
    };
  }

  Perspective copyWith({
    String? id,
    String? title,
    double? weight,
    Value<String?> weightHistory = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<String?> rules = const Value.absent(),
  }) => Perspective(
    id: id ?? this.id,
    title: title ?? this.title,
    weight: weight ?? this.weight,
    weightHistory: weightHistory.present
        ? weightHistory.value
        : this.weightHistory,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    rules: rules.present ? rules.value : this.rules,
  );
  Perspective copyWithCompanion(PerspectivesCompanion data) {
    return Perspective(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      weight: data.weight.present ? data.weight.value : this.weight,
      weightHistory: data.weightHistory.present
          ? data.weightHistory.value
          : this.weightHistory,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      rules: data.rules.present ? data.rules.value : this.rules,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Perspective(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('weight: $weight, ')
          ..write('weightHistory: $weightHistory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rules: $rules')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    weight,
    weightHistory,
    createdAt,
    updatedAt,
    rules,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Perspective &&
          other.id == this.id &&
          other.title == this.title &&
          other.weight == this.weight &&
          other.weightHistory == this.weightHistory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.rules == this.rules);
}

class PerspectivesCompanion extends UpdateCompanion<Perspective> {
  final Value<String> id;
  final Value<String> title;
  final Value<double> weight;
  final Value<String?> weightHistory;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String?> rules;
  final Value<int> rowid;
  const PerspectivesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.weight = const Value.absent(),
    this.weightHistory = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rules = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PerspectivesCompanion.insert({
    required String id,
    required String title,
    this.weight = const Value.absent(),
    this.weightHistory = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rules = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Perspective> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<double>? weight,
    Expression<String>? weightHistory,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? rules,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (weight != null) 'weight': weight,
      if (weightHistory != null) 'weight_history': weightHistory,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rules != null) 'rules': rules,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PerspectivesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<double>? weight,
    Value<String?>? weightHistory,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String?>? rules,
    Value<int>? rowid,
  }) {
    return PerspectivesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      weight: weight ?? this.weight,
      weightHistory: weightHistory ?? this.weightHistory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rules: rules ?? this.rules,
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
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (weightHistory.present) {
      map['weight_history'] = Variable<String>(weightHistory.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rules.present) {
      map['rules'] = Variable<String>(rules.value);
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
          ..write('title: $title, ')
          ..write('weight: $weight, ')
          ..write('weightHistory: $weightHistory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rules: $rules, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InboxItemsTable extends InboxItems
    with TableInfo<$InboxItemsTable, InboxItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InboxItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _processedMeta = const VerificationMeta(
    'processed',
  );
  @override
  late final GeneratedColumn<bool> processed = GeneratedColumn<bool>(
    'processed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("processed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    content,
    source,
    processed,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inbox_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InboxItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('processed')) {
      context.handle(
        _processedMeta,
        processed.isAcceptableOrUnknown(data['processed']!, _processedMeta),
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
  InboxItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InboxItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      processed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}processed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $InboxItemsTable createAlias(String alias) {
    return $InboxItemsTable(attachedDatabase, alias);
  }
}

class InboxItem extends DataClass implements Insertable<InboxItem> {
  final String id;
  final String content;
  final String? source;
  final bool processed;
  final int createdAt;
  const InboxItem({
    required this.id,
    required this.content,
    this.source,
    required this.processed,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['processed'] = Variable<bool>(processed);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  InboxItemsCompanion toCompanion(bool nullToAbsent) {
    return InboxItemsCompanion(
      id: Value(id),
      content: Value(content),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      processed: Value(processed),
      createdAt: Value(createdAt),
    );
  }

  factory InboxItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InboxItem(
      id: serializer.fromJson<String>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      source: serializer.fromJson<String?>(json['source']),
      processed: serializer.fromJson<bool>(json['processed']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'content': serializer.toJson<String>(content),
      'source': serializer.toJson<String?>(source),
      'processed': serializer.toJson<bool>(processed),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  InboxItem copyWith({
    String? id,
    String? content,
    Value<String?> source = const Value.absent(),
    bool? processed,
    int? createdAt,
  }) => InboxItem(
    id: id ?? this.id,
    content: content ?? this.content,
    source: source.present ? source.value : this.source,
    processed: processed ?? this.processed,
    createdAt: createdAt ?? this.createdAt,
  );
  InboxItem copyWithCompanion(InboxItemsCompanion data) {
    return InboxItem(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      source: data.source.present ? data.source.value : this.source,
      processed: data.processed.present ? data.processed.value : this.processed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InboxItem(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('source: $source, ')
          ..write('processed: $processed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, source, processed, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InboxItem &&
          other.id == this.id &&
          other.content == this.content &&
          other.source == this.source &&
          other.processed == this.processed &&
          other.createdAt == this.createdAt);
}

class InboxItemsCompanion extends UpdateCompanion<InboxItem> {
  final Value<String> id;
  final Value<String> content;
  final Value<String?> source;
  final Value<bool> processed;
  final Value<int> createdAt;
  final Value<int> rowid;
  const InboxItemsCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.source = const Value.absent(),
    this.processed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InboxItemsCompanion.insert({
    required String id,
    required String content,
    this.source = const Value.absent(),
    this.processed = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<InboxItem> custom({
    Expression<String>? id,
    Expression<String>? content,
    Expression<String>? source,
    Expression<bool>? processed,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (source != null) 'source': source,
      if (processed != null) 'processed': processed,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InboxItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? content,
    Value<String?>? source,
    Value<bool>? processed,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return InboxItemsCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      source: source ?? this.source,
      processed: processed ?? this.processed,
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
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (processed.present) {
      map['processed'] = Variable<bool>(processed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InboxItemsCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('source: $source, ')
          ..write('processed: $processed, ')
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
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
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
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
  final int updatedAt;
  const Setting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Setting copyWith({String? key, String? value, int? updatedAt}) => Setting(
    key: key ?? this.key,
    value: value ?? this.value,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ForecastCalibrationsTable extends ForecastCalibrations
    with TableInfo<$ForecastCalibrationsTable, ForecastCalibration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ForecastCalibrationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodTypeMeta = const VerificationMeta(
    'periodType',
  );
  @override
  late final GeneratedColumn<String> periodType = GeneratedColumn<String>(
    'period_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetCountMeta = const VerificationMeta(
    'targetCount',
  );
  @override
  late final GeneratedColumn<double> targetCount = GeneratedColumn<double>(
    'target_count',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetDurationMeta = const VerificationMeta(
    'targetDuration',
  );
  @override
  late final GeneratedColumn<double> targetDuration = GeneratedColumn<double>(
    'target_duration',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _volatilityMeta = const VerificationMeta(
    'volatility',
  );
  @override
  late final GeneratedColumn<double> volatility = GeneratedColumn<double>(
    'volatility',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    periodType,
    targetCount,
    targetDuration,
    confidence,
    volatility,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'forecast_calibrations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ForecastCalibration> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('period_type')) {
      context.handle(
        _periodTypeMeta,
        periodType.isAcceptableOrUnknown(data['period_type']!, _periodTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_periodTypeMeta);
    }
    if (data.containsKey('target_count')) {
      context.handle(
        _targetCountMeta,
        targetCount.isAcceptableOrUnknown(
          data['target_count']!,
          _targetCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetCountMeta);
    }
    if (data.containsKey('target_duration')) {
      context.handle(
        _targetDurationMeta,
        targetDuration.isAcceptableOrUnknown(
          data['target_duration']!,
          _targetDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetDurationMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('volatility')) {
      context.handle(
        _volatilityMeta,
        volatility.isAcceptableOrUnknown(data['volatility']!, _volatilityMeta),
      );
    } else if (isInserting) {
      context.missing(_volatilityMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ForecastCalibration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ForecastCalibration(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      periodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_type'],
      )!,
      targetCount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_count'],
      )!,
      targetDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_duration'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      volatility: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volatility'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ForecastCalibrationsTable createAlias(String alias) {
    return $ForecastCalibrationsTable(attachedDatabase, alias);
  }
}

class ForecastCalibration extends DataClass
    implements Insertable<ForecastCalibration> {
  final String id;
  final String periodType;
  final double targetCount;
  final double targetDuration;
  final double confidence;
  final double volatility;
  final int updatedAt;
  const ForecastCalibration({
    required this.id,
    required this.periodType,
    required this.targetCount,
    required this.targetDuration,
    required this.confidence,
    required this.volatility,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['period_type'] = Variable<String>(periodType);
    map['target_count'] = Variable<double>(targetCount);
    map['target_duration'] = Variable<double>(targetDuration);
    map['confidence'] = Variable<double>(confidence);
    map['volatility'] = Variable<double>(volatility);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ForecastCalibrationsCompanion toCompanion(bool nullToAbsent) {
    return ForecastCalibrationsCompanion(
      id: Value(id),
      periodType: Value(periodType),
      targetCount: Value(targetCount),
      targetDuration: Value(targetDuration),
      confidence: Value(confidence),
      volatility: Value(volatility),
      updatedAt: Value(updatedAt),
    );
  }

  factory ForecastCalibration.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ForecastCalibration(
      id: serializer.fromJson<String>(json['id']),
      periodType: serializer.fromJson<String>(json['periodType']),
      targetCount: serializer.fromJson<double>(json['targetCount']),
      targetDuration: serializer.fromJson<double>(json['targetDuration']),
      confidence: serializer.fromJson<double>(json['confidence']),
      volatility: serializer.fromJson<double>(json['volatility']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'periodType': serializer.toJson<String>(periodType),
      'targetCount': serializer.toJson<double>(targetCount),
      'targetDuration': serializer.toJson<double>(targetDuration),
      'confidence': serializer.toJson<double>(confidence),
      'volatility': serializer.toJson<double>(volatility),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  ForecastCalibration copyWith({
    String? id,
    String? periodType,
    double? targetCount,
    double? targetDuration,
    double? confidence,
    double? volatility,
    int? updatedAt,
  }) => ForecastCalibration(
    id: id ?? this.id,
    periodType: periodType ?? this.periodType,
    targetCount: targetCount ?? this.targetCount,
    targetDuration: targetDuration ?? this.targetDuration,
    confidence: confidence ?? this.confidence,
    volatility: volatility ?? this.volatility,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ForecastCalibration copyWithCompanion(ForecastCalibrationsCompanion data) {
    return ForecastCalibration(
      id: data.id.present ? data.id.value : this.id,
      periodType: data.periodType.present
          ? data.periodType.value
          : this.periodType,
      targetCount: data.targetCount.present
          ? data.targetCount.value
          : this.targetCount,
      targetDuration: data.targetDuration.present
          ? data.targetDuration.value
          : this.targetDuration,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      volatility: data.volatility.present
          ? data.volatility.value
          : this.volatility,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ForecastCalibration(')
          ..write('id: $id, ')
          ..write('periodType: $periodType, ')
          ..write('targetCount: $targetCount, ')
          ..write('targetDuration: $targetDuration, ')
          ..write('confidence: $confidence, ')
          ..write('volatility: $volatility, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    periodType,
    targetCount,
    targetDuration,
    confidence,
    volatility,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ForecastCalibration &&
          other.id == this.id &&
          other.periodType == this.periodType &&
          other.targetCount == this.targetCount &&
          other.targetDuration == this.targetDuration &&
          other.confidence == this.confidence &&
          other.volatility == this.volatility &&
          other.updatedAt == this.updatedAt);
}

class ForecastCalibrationsCompanion
    extends UpdateCompanion<ForecastCalibration> {
  final Value<String> id;
  final Value<String> periodType;
  final Value<double> targetCount;
  final Value<double> targetDuration;
  final Value<double> confidence;
  final Value<double> volatility;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const ForecastCalibrationsCompanion({
    this.id = const Value.absent(),
    this.periodType = const Value.absent(),
    this.targetCount = const Value.absent(),
    this.targetDuration = const Value.absent(),
    this.confidence = const Value.absent(),
    this.volatility = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ForecastCalibrationsCompanion.insert({
    required String id,
    required String periodType,
    required double targetCount,
    required double targetDuration,
    required double confidence,
    required double volatility,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       periodType = Value(periodType),
       targetCount = Value(targetCount),
       targetDuration = Value(targetDuration),
       confidence = Value(confidence),
       volatility = Value(volatility),
       updatedAt = Value(updatedAt);
  static Insertable<ForecastCalibration> custom({
    Expression<String>? id,
    Expression<String>? periodType,
    Expression<double>? targetCount,
    Expression<double>? targetDuration,
    Expression<double>? confidence,
    Expression<double>? volatility,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodType != null) 'period_type': periodType,
      if (targetCount != null) 'target_count': targetCount,
      if (targetDuration != null) 'target_duration': targetDuration,
      if (confidence != null) 'confidence': confidence,
      if (volatility != null) 'volatility': volatility,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ForecastCalibrationsCompanion copyWith({
    Value<String>? id,
    Value<String>? periodType,
    Value<double>? targetCount,
    Value<double>? targetDuration,
    Value<double>? confidence,
    Value<double>? volatility,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return ForecastCalibrationsCompanion(
      id: id ?? this.id,
      periodType: periodType ?? this.periodType,
      targetCount: targetCount ?? this.targetCount,
      targetDuration: targetDuration ?? this.targetDuration,
      confidence: confidence ?? this.confidence,
      volatility: volatility ?? this.volatility,
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
    if (periodType.present) {
      map['period_type'] = Variable<String>(periodType.value);
    }
    if (targetCount.present) {
      map['target_count'] = Variable<double>(targetCount.value);
    }
    if (targetDuration.present) {
      map['target_duration'] = Variable<double>(targetDuration.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (volatility.present) {
      map['volatility'] = Variable<double>(volatility.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ForecastCalibrationsCompanion(')
          ..write('id: $id, ')
          ..write('periodType: $periodType, ')
          ..write('targetCount: $targetCount, ')
          ..write('targetDuration: $targetDuration, ')
          ..write('confidence: $confidence, ')
          ..write('volatility: $volatility, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $ForecastsTable forecasts = $ForecastsTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final $TimelineEventsTable timelineEvents = $TimelineEventsTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $PerspectivesTable perspectives = $PerspectivesTable(this);
  late final $InboxItemsTable inboxItems = $InboxItemsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $ForecastCalibrationsTable forecastCalibrations =
      $ForecastCalibrationsTable(this);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  late final ForecastDao forecastDao = ForecastDao(this as AppDatabase);
  late final ReviewDao reviewDao = ReviewDao(this as AppDatabase);
  late final TimelineDao timelineDao = TimelineDao(this as AppDatabase);
  late final ProjectDao projectDao = ProjectDao(this as AppDatabase);
  late final PerspectiveDao perspectiveDao = PerspectiveDao(
    this as AppDatabase,
  );
  late final InboxDao inboxDao = InboxDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  late final ForecastCalibrationDao forecastCalibrationDao =
      ForecastCalibrationDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tasks,
    forecasts,
    reviews,
    timelineEvents,
    projects,
    perspectives,
    inboxItems,
    settings,
    forecastCalibrations,
  ];
}

typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      required String id,
      required String title,
      Value<String?> projectId,
      Value<String?> perspectives,
      Value<bool> completed,
      required int createdAt,
      Value<int> priority,
      Value<int> postponeCount,
      Value<bool> abandoned,
      Value<int?> dueAt,
      Value<int?> deferAt,
      Value<int> rowid,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> projectId,
      Value<String?> perspectives,
      Value<bool> completed,
      Value<int> createdAt,
      Value<int> priority,
      Value<int> postponeCount,
      Value<bool> abandoned,
      Value<int?> dueAt,
      Value<int?> deferAt,
      Value<int> rowid,
    });

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
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

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get perspectives => $composableBuilder(
    column: $table.perspectives,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get postponeCount => $composableBuilder(
    column: $table.postponeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get abandoned => $composableBuilder(
    column: $table.abandoned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deferAt => $composableBuilder(
    column: $table.deferAt,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get perspectives => $composableBuilder(
    column: $table.perspectives,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get postponeCount => $composableBuilder(
    column: $table.postponeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get abandoned => $composableBuilder(
    column: $table.abandoned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deferAt => $composableBuilder(
    column: $table.deferAt,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get perspectives => $composableBuilder(
    column: $table.perspectives,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get postponeCount => $composableBuilder(
    column: $table.postponeCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get abandoned =>
      $composableBuilder(column: $table.abandoned, builder: (column) => column);

  GeneratedColumn<int> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<int> get deferAt =>
      $composableBuilder(column: $table.deferAt, builder: (column) => column);
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
          (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
          Task,
          PrefetchHooks Function()
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
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> projectId = const Value.absent(),
                Value<String?> perspectives = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int> postponeCount = const Value.absent(),
                Value<bool> abandoned = const Value.absent(),
                Value<int?> dueAt = const Value.absent(),
                Value<int?> deferAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                title: title,
                projectId: projectId,
                perspectives: perspectives,
                completed: completed,
                createdAt: createdAt,
                priority: priority,
                postponeCount: postponeCount,
                abandoned: abandoned,
                dueAt: dueAt,
                deferAt: deferAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> projectId = const Value.absent(),
                Value<String?> perspectives = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                required int createdAt,
                Value<int> priority = const Value.absent(),
                Value<int> postponeCount = const Value.absent(),
                Value<bool> abandoned = const Value.absent(),
                Value<int?> dueAt = const Value.absent(),
                Value<int?> deferAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                projectId: projectId,
                perspectives: perspectives,
                completed: completed,
                createdAt: createdAt,
                priority: priority,
                postponeCount: postponeCount,
                abandoned: abandoned,
                dueAt: dueAt,
                deferAt: deferAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;
typedef $$ForecastsTableCreateCompanionBuilder =
    ForecastsCompanion Function({
      required String id,
      required String taskId,
      required int scheduledDate,
      Value<bool> done,
      Value<bool> skipped,
      Value<int> confidence,
      Value<int> source,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ForecastsTableUpdateCompanionBuilder =
    ForecastsCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<int> scheduledDate,
      Value<bool> done,
      Value<bool> skipped,
      Value<int> confidence,
      Value<int> source,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$ForecastsTableFilterComposer
    extends Composer<_$AppDatabase, $ForecastsTable> {
  $$ForecastsTableFilterComposer({
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

  ColumnFilters<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduledDate => $composableBuilder(
    column: $table.scheduledDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ForecastsTableOrderingComposer
    extends Composer<_$AppDatabase, $ForecastsTable> {
  $$ForecastsTableOrderingComposer({
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

  ColumnOrderings<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduledDate => $composableBuilder(
    column: $table.scheduledDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ForecastsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ForecastsTable> {
  $$ForecastsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<int> get scheduledDate => $composableBuilder(
    column: $table.scheduledDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<bool> get skipped =>
      $composableBuilder(column: $table.skipped, builder: (column) => column);

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ForecastsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ForecastsTable,
          Forecast,
          $$ForecastsTableFilterComposer,
          $$ForecastsTableOrderingComposer,
          $$ForecastsTableAnnotationComposer,
          $$ForecastsTableCreateCompanionBuilder,
          $$ForecastsTableUpdateCompanionBuilder,
          (Forecast, BaseReferences<_$AppDatabase, $ForecastsTable, Forecast>),
          Forecast,
          PrefetchHooks Function()
        > {
  $$ForecastsTableTableManager(_$AppDatabase db, $ForecastsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ForecastsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ForecastsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ForecastsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<int> scheduledDate = const Value.absent(),
                Value<bool> done = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
                Value<int> confidence = const Value.absent(),
                Value<int> source = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ForecastsCompanion(
                id: id,
                taskId: taskId,
                scheduledDate: scheduledDate,
                done: done,
                skipped: skipped,
                confidence: confidence,
                source: source,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required int scheduledDate,
                Value<bool> done = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
                Value<int> confidence = const Value.absent(),
                Value<int> source = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ForecastsCompanion.insert(
                id: id,
                taskId: taskId,
                scheduledDate: scheduledDate,
                done: done,
                skipped: skipped,
                confidence: confidence,
                source: source,
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

typedef $$ForecastsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ForecastsTable,
      Forecast,
      $$ForecastsTableFilterComposer,
      $$ForecastsTableOrderingComposer,
      $$ForecastsTableAnnotationComposer,
      $$ForecastsTableCreateCompanionBuilder,
      $$ForecastsTableUpdateCompanionBuilder,
      (Forecast, BaseReferences<_$AppDatabase, $ForecastsTable, Forecast>),
      Forecast,
      PrefetchHooks Function()
    >;
typedef $$ReviewsTableCreateCompanionBuilder =
    ReviewsCompanion Function({
      required String id,
      required int periodStart,
      required int periodEnd,
      required int expectedCount,
      required int actualCount,
      required int expectedDuration,
      required int actualDuration,
      Value<int?> moodScore,
      Value<int?> focusScore,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ReviewsTableUpdateCompanionBuilder =
    ReviewsCompanion Function({
      Value<String> id,
      Value<int> periodStart,
      Value<int> periodEnd,
      Value<int> expectedCount,
      Value<int> actualCount,
      Value<int> expectedDuration,
      Value<int> actualDuration,
      Value<int?> moodScore,
      Value<int?> focusScore,
      Value<int> createdAt,
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

  ColumnFilters<int> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expectedCount => $composableBuilder(
    column: $table.expectedCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actualCount => $composableBuilder(
    column: $table.actualCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expectedDuration => $composableBuilder(
    column: $table.expectedDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actualDuration => $composableBuilder(
    column: $table.actualDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moodScore => $composableBuilder(
    column: $table.moodScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get focusScore => $composableBuilder(
    column: $table.focusScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
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

  ColumnOrderings<int> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expectedCount => $composableBuilder(
    column: $table.expectedCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actualCount => $composableBuilder(
    column: $table.actualCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expectedDuration => $composableBuilder(
    column: $table.expectedDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actualDuration => $composableBuilder(
    column: $table.actualDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moodScore => $composableBuilder(
    column: $table.moodScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get focusScore => $composableBuilder(
    column: $table.focusScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
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

  GeneratedColumn<int> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => column,
  );

  GeneratedColumn<int> get periodEnd =>
      $composableBuilder(column: $table.periodEnd, builder: (column) => column);

  GeneratedColumn<int> get expectedCount => $composableBuilder(
    column: $table.expectedCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actualCount => $composableBuilder(
    column: $table.actualCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get expectedDuration => $composableBuilder(
    column: $table.expectedDuration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actualDuration => $composableBuilder(
    column: $table.actualDuration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get moodScore =>
      $composableBuilder(column: $table.moodScore, builder: (column) => column);

  GeneratedColumn<int> get focusScore => $composableBuilder(
    column: $table.focusScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
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
                Value<int> periodStart = const Value.absent(),
                Value<int> periodEnd = const Value.absent(),
                Value<int> expectedCount = const Value.absent(),
                Value<int> actualCount = const Value.absent(),
                Value<int> expectedDuration = const Value.absent(),
                Value<int> actualDuration = const Value.absent(),
                Value<int?> moodScore = const Value.absent(),
                Value<int?> focusScore = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewsCompanion(
                id: id,
                periodStart: periodStart,
                periodEnd: periodEnd,
                expectedCount: expectedCount,
                actualCount: actualCount,
                expectedDuration: expectedDuration,
                actualDuration: actualDuration,
                moodScore: moodScore,
                focusScore: focusScore,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int periodStart,
                required int periodEnd,
                required int expectedCount,
                required int actualCount,
                required int expectedDuration,
                required int actualDuration,
                Value<int?> moodScore = const Value.absent(),
                Value<int?> focusScore = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ReviewsCompanion.insert(
                id: id,
                periodStart: periodStart,
                periodEnd: periodEnd,
                expectedCount: expectedCount,
                actualCount: actualCount,
                expectedDuration: expectedDuration,
                actualDuration: actualDuration,
                moodScore: moodScore,
                focusScore: focusScore,
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
typedef $$TimelineEventsTableCreateCompanionBuilder =
    TimelineEventsCompanion Function({
      required String id,
      required int timestamp,
      required String type,
      required String entityType,
      Value<String?> entityId,
      required String title,
      Value<int?> duration,
      Value<String?> perspectives,
      Value<String?> payload,
      Value<int> rowid,
    });
typedef $$TimelineEventsTableUpdateCompanionBuilder =
    TimelineEventsCompanion Function({
      Value<String> id,
      Value<int> timestamp,
      Value<String> type,
      Value<String> entityType,
      Value<String?> entityId,
      Value<String> title,
      Value<int?> duration,
      Value<String?> perspectives,
      Value<String?> payload,
      Value<int> rowid,
    });

class $$TimelineEventsTableFilterComposer
    extends Composer<_$AppDatabase, $TimelineEventsTable> {
  $$TimelineEventsTableFilterComposer({
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

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get perspectives => $composableBuilder(
    column: $table.perspectives,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TimelineEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimelineEventsTable> {
  $$TimelineEventsTableOrderingComposer({
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

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get perspectives => $composableBuilder(
    column: $table.perspectives,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TimelineEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimelineEventsTable> {
  $$TimelineEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get perspectives => $composableBuilder(
    column: $table.perspectives,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$TimelineEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimelineEventsTable,
          TimelineEvent,
          $$TimelineEventsTableFilterComposer,
          $$TimelineEventsTableOrderingComposer,
          $$TimelineEventsTableAnnotationComposer,
          $$TimelineEventsTableCreateCompanionBuilder,
          $$TimelineEventsTableUpdateCompanionBuilder,
          (
            TimelineEvent,
            BaseReferences<_$AppDatabase, $TimelineEventsTable, TimelineEvent>,
          ),
          TimelineEvent,
          PrefetchHooks Function()
        > {
  $$TimelineEventsTableTableManager(
    _$AppDatabase db,
    $TimelineEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimelineEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimelineEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimelineEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<String?> perspectives = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimelineEventsCompanion(
                id: id,
                timestamp: timestamp,
                type: type,
                entityType: entityType,
                entityId: entityId,
                title: title,
                duration: duration,
                perspectives: perspectives,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int timestamp,
                required String type,
                required String entityType,
                Value<String?> entityId = const Value.absent(),
                required String title,
                Value<int?> duration = const Value.absent(),
                Value<String?> perspectives = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimelineEventsCompanion.insert(
                id: id,
                timestamp: timestamp,
                type: type,
                entityType: entityType,
                entityId: entityId,
                title: title,
                duration: duration,
                perspectives: perspectives,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TimelineEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimelineEventsTable,
      TimelineEvent,
      $$TimelineEventsTableFilterComposer,
      $$TimelineEventsTableOrderingComposer,
      $$TimelineEventsTableAnnotationComposer,
      $$TimelineEventsTableCreateCompanionBuilder,
      $$TimelineEventsTableUpdateCompanionBuilder,
      (
        TimelineEvent,
        BaseReferences<_$AppDatabase, $TimelineEventsTable, TimelineEvent>,
      ),
      TimelineEvent,
      PrefetchHooks Function()
    >;
typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      required String id,
      required String title,
      required int createdAt,
      Value<int?> reviewAt,
      Value<bool> completed,
      Value<String> status,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> createdAt,
      Value<int?> reviewAt,
      Value<bool> completed,
      Value<String> status,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
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

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewAt => $composableBuilder(
    column: $table.reviewAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
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

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewAt => $composableBuilder(
    column: $table.reviewAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
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

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get reviewAt =>
      $composableBuilder(column: $table.reviewAt, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, BaseReferences<_$AppDatabase, $ProjectsTable, Project>),
          Project,
          PrefetchHooks Function()
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> reviewAt = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                title: title,
                createdAt: createdAt,
                reviewAt: reviewAt,
                completed: completed,
                status: status,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int createdAt,
                Value<int?> reviewAt = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                title: title,
                createdAt: createdAt,
                reviewAt: reviewAt,
                completed: completed,
                status: status,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, BaseReferences<_$AppDatabase, $ProjectsTable, Project>),
      Project,
      PrefetchHooks Function()
    >;
typedef $$PerspectivesTableCreateCompanionBuilder =
    PerspectivesCompanion Function({
      required String id,
      required String title,
      Value<double> weight,
      Value<String?> weightHistory,
      required int createdAt,
      required int updatedAt,
      Value<String?> rules,
      Value<int> rowid,
    });
typedef $$PerspectivesTableUpdateCompanionBuilder =
    PerspectivesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<double> weight,
      Value<String?> weightHistory,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String?> rules,
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weightHistory => $composableBuilder(
    column: $table.weightHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rules => $composableBuilder(
    column: $table.rules,
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weightHistory => $composableBuilder(
    column: $table.weightHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rules => $composableBuilder(
    column: $table.rules,
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get weightHistory => $composableBuilder(
    column: $table.weightHistory,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get rules =>
      $composableBuilder(column: $table.rules, builder: (column) => column);
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
                Value<String> title = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<String?> weightHistory = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String?> rules = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PerspectivesCompanion(
                id: id,
                title: title,
                weight: weight,
                weightHistory: weightHistory,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rules: rules,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<double> weight = const Value.absent(),
                Value<String?> weightHistory = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<String?> rules = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PerspectivesCompanion.insert(
                id: id,
                title: title,
                weight: weight,
                weightHistory: weightHistory,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rules: rules,
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
typedef $$InboxItemsTableCreateCompanionBuilder =
    InboxItemsCompanion Function({
      required String id,
      required String content,
      Value<String?> source,
      Value<bool> processed,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$InboxItemsTableUpdateCompanionBuilder =
    InboxItemsCompanion Function({
      Value<String> id,
      Value<String> content,
      Value<String?> source,
      Value<bool> processed,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$InboxItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InboxItemsTable> {
  $$InboxItemsTableFilterComposer({
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

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get processed => $composableBuilder(
    column: $table.processed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InboxItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InboxItemsTable> {
  $$InboxItemsTableOrderingComposer({
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

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get processed => $composableBuilder(
    column: $table.processed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InboxItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InboxItemsTable> {
  $$InboxItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<bool> get processed =>
      $composableBuilder(column: $table.processed, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$InboxItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InboxItemsTable,
          InboxItem,
          $$InboxItemsTableFilterComposer,
          $$InboxItemsTableOrderingComposer,
          $$InboxItemsTableAnnotationComposer,
          $$InboxItemsTableCreateCompanionBuilder,
          $$InboxItemsTableUpdateCompanionBuilder,
          (
            InboxItem,
            BaseReferences<_$AppDatabase, $InboxItemsTable, InboxItem>,
          ),
          InboxItem,
          PrefetchHooks Function()
        > {
  $$InboxItemsTableTableManager(_$AppDatabase db, $InboxItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InboxItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InboxItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InboxItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<bool> processed = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InboxItemsCompanion(
                id: id,
                content: content,
                source: source,
                processed: processed,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String content,
                Value<String?> source = const Value.absent(),
                Value<bool> processed = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => InboxItemsCompanion.insert(
                id: id,
                content: content,
                source: source,
                processed: processed,
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

typedef $$InboxItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InboxItemsTable,
      InboxItem,
      $$InboxItemsTableFilterComposer,
      $$InboxItemsTableOrderingComposer,
      $$InboxItemsTableAnnotationComposer,
      $$InboxItemsTableCreateCompanionBuilder,
      $$InboxItemsTableUpdateCompanionBuilder,
      (InboxItem, BaseReferences<_$AppDatabase, $InboxItemsTable, InboxItem>),
      InboxItem,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> updatedAt,
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

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
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

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
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

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
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
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
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
typedef $$ForecastCalibrationsTableCreateCompanionBuilder =
    ForecastCalibrationsCompanion Function({
      required String id,
      required String periodType,
      required double targetCount,
      required double targetDuration,
      required double confidence,
      required double volatility,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$ForecastCalibrationsTableUpdateCompanionBuilder =
    ForecastCalibrationsCompanion Function({
      Value<String> id,
      Value<String> periodType,
      Value<double> targetCount,
      Value<double> targetDuration,
      Value<double> confidence,
      Value<double> volatility,
      Value<int> updatedAt,
      Value<int> rowid,
    });

class $$ForecastCalibrationsTableFilterComposer
    extends Composer<_$AppDatabase, $ForecastCalibrationsTable> {
  $$ForecastCalibrationsTableFilterComposer({
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

  ColumnFilters<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetDuration => $composableBuilder(
    column: $table.targetDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volatility => $composableBuilder(
    column: $table.volatility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ForecastCalibrationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ForecastCalibrationsTable> {
  $$ForecastCalibrationsTableOrderingComposer({
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

  ColumnOrderings<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetDuration => $composableBuilder(
    column: $table.targetDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volatility => $composableBuilder(
    column: $table.volatility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ForecastCalibrationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ForecastCalibrationsTable> {
  $$ForecastCalibrationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetDuration => $composableBuilder(
    column: $table.targetDuration,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<double> get volatility => $composableBuilder(
    column: $table.volatility,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ForecastCalibrationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ForecastCalibrationsTable,
          ForecastCalibration,
          $$ForecastCalibrationsTableFilterComposer,
          $$ForecastCalibrationsTableOrderingComposer,
          $$ForecastCalibrationsTableAnnotationComposer,
          $$ForecastCalibrationsTableCreateCompanionBuilder,
          $$ForecastCalibrationsTableUpdateCompanionBuilder,
          (
            ForecastCalibration,
            BaseReferences<
              _$AppDatabase,
              $ForecastCalibrationsTable,
              ForecastCalibration
            >,
          ),
          ForecastCalibration,
          PrefetchHooks Function()
        > {
  $$ForecastCalibrationsTableTableManager(
    _$AppDatabase db,
    $ForecastCalibrationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ForecastCalibrationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ForecastCalibrationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ForecastCalibrationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> periodType = const Value.absent(),
                Value<double> targetCount = const Value.absent(),
                Value<double> targetDuration = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<double> volatility = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ForecastCalibrationsCompanion(
                id: id,
                periodType: periodType,
                targetCount: targetCount,
                targetDuration: targetDuration,
                confidence: confidence,
                volatility: volatility,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String periodType,
                required double targetCount,
                required double targetDuration,
                required double confidence,
                required double volatility,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ForecastCalibrationsCompanion.insert(
                id: id,
                periodType: periodType,
                targetCount: targetCount,
                targetDuration: targetDuration,
                confidence: confidence,
                volatility: volatility,
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

typedef $$ForecastCalibrationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ForecastCalibrationsTable,
      ForecastCalibration,
      $$ForecastCalibrationsTableFilterComposer,
      $$ForecastCalibrationsTableOrderingComposer,
      $$ForecastCalibrationsTableAnnotationComposer,
      $$ForecastCalibrationsTableCreateCompanionBuilder,
      $$ForecastCalibrationsTableUpdateCompanionBuilder,
      (
        ForecastCalibration,
        BaseReferences<
          _$AppDatabase,
          $ForecastCalibrationsTable,
          ForecastCalibration
        >,
      ),
      ForecastCalibration,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$ForecastsTableTableManager get forecasts =>
      $$ForecastsTableTableManager(_db, _db.forecasts);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
  $$TimelineEventsTableTableManager get timelineEvents =>
      $$TimelineEventsTableTableManager(_db, _db.timelineEvents);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$PerspectivesTableTableManager get perspectives =>
      $$PerspectivesTableTableManager(_db, _db.perspectives);
  $$InboxItemsTableTableManager get inboxItems =>
      $$InboxItemsTableTableManager(_db, _db.inboxItems);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$ForecastCalibrationsTableTableManager get forecastCalibrations =>
      $$ForecastCalibrationsTableTableManager(_db, _db.forecastCalibrations);
}
