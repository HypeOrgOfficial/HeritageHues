import '../database.dart';

class TouristplacescardsTable extends SupabaseTable<TouristplacescardsRow> {
  @override
  String get tableName => 'touristplacescards';

  @override
  TouristplacescardsRow createRow(Map<String, dynamic> data) =>
      TouristplacescardsRow(data);
}

class TouristplacescardsRow extends SupabaseDataRow {
  TouristplacescardsRow(super.data);

  @override
  SupabaseTable get table => TouristplacescardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get tpindex => getField<int>('tpindex');
  set tpindex(int? value) => setField<int>('tpindex', value);
}
