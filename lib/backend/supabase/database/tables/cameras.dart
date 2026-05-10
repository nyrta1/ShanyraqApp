import '../database.dart';

class CamerasTable extends SupabaseTable<CamerasRow> {
  @override
  String get tableName => 'cameras';

  @override
  CamerasRow createRow(Map<String, dynamic> data) => CamerasRow(data);
}

class CamerasRow extends SupabaseDataRow {
  CamerasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CamerasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get streamUrl => getField<String>('stream_url')!;
  set streamUrl(String value) => setField<String>('stream_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
