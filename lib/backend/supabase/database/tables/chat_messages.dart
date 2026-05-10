import '../database.dart';

class ChatMessagesTable extends SupabaseTable<ChatMessagesRow> {
  @override
  String get tableName => 'chat_messages';

  @override
  ChatMessagesRow createRow(Map<String, dynamic> data) => ChatMessagesRow(data);
}

class ChatMessagesRow extends SupabaseDataRow {
  ChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get roomId => getField<int>('room_id');
  set roomId(int? value) => setField<int>('room_id', value);

  String? get senderId => getField<String>('sender_id');
  set senderId(String? value) => setField<String>('sender_id', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
