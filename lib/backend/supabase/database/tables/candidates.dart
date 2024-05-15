import '../database.dart';

class CandidatesTable extends SupabaseTable<CandidatesRow> {
  @override
  String get tableName => 'candidates';

  @override
  CandidatesRow createRow(Map<String, dynamic> data) => CandidatesRow(data);
}

class CandidatesRow extends SupabaseDataRow {
  CandidatesRow(super.data);

  @override
  SupabaseTable get table => CandidatesTable();

  String get walletId => getField<String>('wallet_id')!;
  set walletId(String value) => setField<String>('wallet_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get districtId => getField<String>('district_id');
  set districtId(String? value) => setField<String>('district_id', value);

  String? get electionId => getField<String>('election_id');
  set electionId(String? value) => setField<String>('election_id', value);
}
