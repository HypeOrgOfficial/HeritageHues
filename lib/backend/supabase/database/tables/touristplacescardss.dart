import '../database.dart';

class TouristplacescardssTable extends SupabaseTable<TouristplacescardssRow> {
  @override
  String get tableName => 'touristplacescardss';

  @override
  TouristplacescardssRow createRow(Map<String, dynamic> data) =>
      TouristplacescardssRow(data);
}

class TouristplacescardssRow extends SupabaseDataRow {
  TouristplacescardssRow(super.data);

  @override
  SupabaseTable get table => TouristplacescardssTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get tpindex => getField<int>('tpindex')!;
  set tpindex(int value) => setField<int>('tpindex', value);

  String? get placename => getField<String>('placename');
  set placename(String? value) => setField<String>('placename', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get history => getField<String>('history');
  set history(String? value) => setField<String>('history', value);

  String? get imageurl => getField<String>('imageurl');
  set imageurl(String? value) => setField<String>('imageurl', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
