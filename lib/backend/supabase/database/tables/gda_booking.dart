import '../database.dart';

class GdaBookingTable extends SupabaseTable<GdaBookingRow> {
  @override
  String get tableName => 'gda_booking';

  @override
  GdaBookingRow createRow(Map<String, dynamic> data) => GdaBookingRow(data);
}

class GdaBookingRow extends SupabaseDataRow {
  GdaBookingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GdaBookingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get bookingNumber => getField<String>('booking_number')!;
  set bookingNumber(String value) => setField<String>('booking_number', value);

  int get numberOfGuests => getField<int>('number_of_guests')!;
  set numberOfGuests(int value) => setField<int>('number_of_guests', value);

  DateTime get bookingCheckInDate =>
      getField<DateTime>('booking_check_in_date')!;
  set bookingCheckInDate(DateTime value) =>
      setField<DateTime>('booking_check_in_date', value);

  String get mainGuest => getField<String>('main_guest')!;
  set mainGuest(String value) => setField<String>('main_guest', value);

  bool get isCheckedIn => getField<bool>('is_checked_in')!;
  set isCheckedIn(bool value) => setField<bool>('is_checked_in', value);

  DateTime get bookingCheckOutDate =>
      getField<DateTime>('booking_check_out_date')!;
  set bookingCheckOutDate(DateTime value) =>
      setField<DateTime>('booking_check_out_date', value);
}
