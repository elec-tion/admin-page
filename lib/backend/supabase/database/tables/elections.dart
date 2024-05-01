import '../database.dart';

class ElectionsTable extends SupabaseTable<ElectionsRow> {
  @override
  String get tableName => 'elections';

  @override
  ElectionsRow createRow(Map<String, dynamic> data) => ElectionsRow(data);
}

class ElectionsRow extends SupabaseDataRow {
  ElectionsRow(super.data);

  @override
  SupabaseTable get table => ElectionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get detail => getField<String>('detail')!;
  set detail(String value) => setField<String>('detail', value);

  int get startDate => getField<int>('startDate')!;
  set startDate(int value) => setField<int>('startDate', value);

  int get endDate => getField<int>('endDate')!;
  set endDate(int value) => setField<int>('endDate', value);

  List<String> get committeeMembers =>
      getListField<String>('committee_members');
  set committeeMembers(List<String>? value) =>
      setListField<String>('committee_members', value);

  List<String> get candidatesWalletId =>
      getListField<String>('candidates_wallet_id');
  set candidatesWalletId(List<String>? value) =>
      setListField<String>('candidates_wallet_id', value);

  List<String> get votersWalletId => getListField<String>('voters_wallet_id');
  set votersWalletId(List<String>? value) =>
      setListField<String>('voters_wallet_id', value);
}
