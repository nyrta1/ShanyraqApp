import '../database.dart';

class DocumentsTable extends SupabaseTable<DocumentsRow> {
  @override
  String get tableName => 'documents';

  @override
  DocumentsRow createRow(Map<String, dynamic> data) => DocumentsRow(data);
}

class DocumentsRow extends SupabaseDataRow {
  DocumentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DocumentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get uploadedBy => getField<String>('uploaded_by');
  set uploadedBy(String? value) => setField<String>('uploaded_by', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get fileUrl => getField<String>('file_url')!;
  set fileUrl(String value) => setField<String>('file_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
