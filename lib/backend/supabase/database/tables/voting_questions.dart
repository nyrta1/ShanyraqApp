import '../database.dart';

class VotingQuestionsTable extends SupabaseTable<VotingQuestionsRow> {
  @override
  String get tableName => 'voting_questions';

  @override
  VotingQuestionsRow createRow(Map<String, dynamic> data) =>
      VotingQuestionsRow(data);
}

class VotingQuestionsRow extends SupabaseDataRow {
  VotingQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VotingQuestionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get votingId => getField<int>('voting_id');
  set votingId(int? value) => setField<int>('voting_id', value);

  String get question => getField<String>('question')!;
  set question(String value) => setField<String>('question', value);
}
