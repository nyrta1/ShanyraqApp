import '../database.dart';

class UserVotesTable extends SupabaseTable<UserVotesRow> {
  @override
  String get tableName => 'user_votes';

  @override
  UserVotesRow createRow(Map<String, dynamic> data) => UserVotesRow(data);
}

class UserVotesRow extends SupabaseDataRow {
  UserVotesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserVotesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get questionId => getField<int>('question_id');
  set questionId(int? value) => setField<int>('question_id', value);

  int? get answerId => getField<int>('answer_id');
  set answerId(int? value) => setField<int>('answer_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
