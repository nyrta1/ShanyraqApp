import '../database.dart';

class VotingsTable extends SupabaseTable<VotingsRow> {
  @override
  String get tableName => 'votings';

  @override
  VotingsRow createRow(Map<String, dynamic> data) => VotingsRow(data);
}

class VotingsRow extends SupabaseDataRow {
  VotingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VotingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
