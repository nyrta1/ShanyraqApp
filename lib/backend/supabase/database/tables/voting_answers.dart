import '../database.dart';

class VotingAnswersTable extends SupabaseTable<VotingAnswersRow> {
  @override
  String get tableName => 'voting_answers';

  @override
  VotingAnswersRow createRow(Map<String, dynamic> data) =>
      VotingAnswersRow(data);
}

class VotingAnswersRow extends SupabaseDataRow {
  VotingAnswersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VotingAnswersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get questionId => getField<int>('question_id');
  set questionId(int? value) => setField<int>('question_id', value);

  String get answer => getField<String>('answer')!;
  set answer(String value) => setField<String>('answer', value);
}
