import '../database.dart';

class ChatRoomsTable extends SupabaseTable<ChatRoomsRow> {
  @override
  String get tableName => 'chat_rooms';

  @override
  ChatRoomsRow createRow(Map<String, dynamic> data) => ChatRoomsRow(data);
}

class ChatRoomsRow extends SupabaseDataRow {
  ChatRoomsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatRoomsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
