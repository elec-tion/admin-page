import '../database.dart';

class DistrictsTable extends SupabaseTable<DistrictsRow> {
  @override
  String get tableName => 'districts';

  @override
  DistrictsRow createRow(Map<String, dynamic> data) => DistrictsRow(data);
}

class DistrictsRow extends SupabaseDataRow {
  DistrictsRow(super.data);

  @override
  SupabaseTable get table => DistrictsTable();

  String get districtID => getField<String>('districtID')!;
  set districtID(String value) => setField<String>('districtID', value);

  String get districtName => getField<String>('districtName')!;
  set districtName(String value) => setField<String>('districtName', value);

  int? get lengthOfID => getField<int>('lengthOfID');
  set lengthOfID(int? value) => setField<int>('lengthOfID', value);
}
