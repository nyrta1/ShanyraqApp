import '../database.dart';

class SmartDevicesTable extends SupabaseTable<SmartDevicesRow> {
  @override
  String get tableName => 'smart_devices';

  @override
  SmartDevicesRow createRow(Map<String, dynamic> data) => SmartDevicesRow(data);
}

class SmartDevicesRow extends SupabaseDataRow {
  SmartDevicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SmartDevicesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get deviceType => getField<String>('device_type');
  set deviceType(String? value) => setField<String>('device_type', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
