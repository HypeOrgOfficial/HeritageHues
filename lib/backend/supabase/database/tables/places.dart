import '../database.dart';

class PlacesTable extends SupabaseTable<PlacesRow> {
  @override
  String get tableName => 'places';

  @override
  PlacesRow createRow(Map<String, dynamic> data) => PlacesRow(data);
}

class PlacesRow extends SupabaseDataRow {
  PlacesRow(super.data);

  @override
  SupabaseTable get table => PlacesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('Name ');
  set name(String? value) => setField<String>('Name ', value);

  String? get location => getField<String>('Location');
  set location(String? value) => setField<String>('Location', value);

  double? get rating => getField<double>('Rating');
  set rating(double? value) => setField<double>('Rating', value);

  String? get imageurl => getField<String>('imageurl');
  set imageurl(String? value) => setField<String>('imageurl', value);
}
