import '../database.dart';

class RequestCommentsTable extends SupabaseTable<RequestCommentsRow> {
  @override
  String get tableName => 'request_comments';

  @override
  RequestCommentsRow createRow(Map<String, dynamic> data) =>
      RequestCommentsRow(data);
}

class RequestCommentsRow extends SupabaseDataRow {
  RequestCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RequestCommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get requestId => getField<int>('request_id');
  set requestId(int? value) => setField<int>('request_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get comment => getField<String>('comment')!;
  set comment(String value) => setField<String>('comment', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
