import '../database.dart';

class ServiceRequestsTable extends SupabaseTable<ServiceRequestsRow> {
  @override
  String get tableName => 'service_requests';

  @override
  ServiceRequestsRow createRow(Map<String, dynamic> data) =>
      ServiceRequestsRow(data);
}

class ServiceRequestsRow extends SupabaseDataRow {
  ServiceRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceRequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
