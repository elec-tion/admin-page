import '../database.dart';

class AdminsTable extends SupabaseTable<AdminsRow> {
  @override
  String get tableName => 'admins';

  @override
  AdminsRow createRow(Map<String, dynamic> data) => AdminsRow(data);
}

class AdminsRow extends SupabaseDataRow {
  AdminsRow(super.data);

  @override
  SupabaseTable get table => AdminsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get surname => getField<String>('surname')!;
  set surname(String value) => setField<String>('surname', value);

  String get walletId => getField<String>('wallet_id')!;
  set walletId(String value) => setField<String>('wallet_id', value);

  String get password => getField<String>('password')!;
  set password(String value) => setField<String>('password', value);
}
