import '../database.dart';

class GdaGuestTable extends SupabaseTable<GdaGuestRow> {
  @override
  String get tableName => 'gda_guest';

  @override
  GdaGuestRow createRow(Map<String, dynamic> data) => GdaGuestRow(data);
}

class GdaGuestRow extends SupabaseDataRow {
  GdaGuestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GdaGuestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get bookingId => getField<int>('booking_id')!;
  set bookingId(int value) => setField<int>('booking_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  DateTime? get dob => getField<DateTime>('dob');
  set dob(DateTime? value) => setField<DateTime>('dob', value);

  String? get countryOfResidency => getField<String>('country_of_residency');
  set countryOfResidency(String? value) =>
      setField<String>('country_of_residency', value);

  String? get countryOfBirth => getField<String>('country_of_birth');
  set countryOfBirth(String? value) =>
      setField<String>('country_of_birth', value);

  bool get isPortuguese => getField<bool>('is_portuguese')!;
  set isPortuguese(bool value) => setField<bool>('is_portuguese', value);

  String get passportOrId => getField<String>('passport_or_id')!;
  set passportOrId(String value) => setField<String>('passport_or_id', value);
}
