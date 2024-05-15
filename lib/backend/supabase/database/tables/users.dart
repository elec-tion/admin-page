import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get passwordFirst => getField<String>('password_first')!;
  set passwordFirst(String value) => setField<String>('password_first', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String get passwordOther => getField<String>('password_other')!;
  set passwordOther(String value) => setField<String>('password_other', value);

  String get walletIdVoter => getField<String>('wallet_id_voter')!;
  set walletIdVoter(String value) => setField<String>('wallet_id_voter', value);

  String get walletIdElectionCommittee =>
      getField<String>('wallet_id_election_committee')!;
  set walletIdElectionCommittee(String value) =>
      setField<String>('wallet_id_election_committee', value);

  List<String> get districts => getListField<String>('districts');
  set districts(List<String>? value) =>
      setListField<String>('districts', value);

  String get photoUrl => getField<String>('photo_url')!;
  set photoUrl(String value) => setField<String>('photo_url', value);

  String? get key => getField<String>('key');
  set key(String? value) => setField<String>('key', value);
}
