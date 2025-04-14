// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestStruct extends BaseStruct {
  GuestStruct({
    int? id,
    String? name,
    DateTime? dob,
    String? passportNumber,
    Countries? countryOfResidency,
    Countries? nationality,
  })  : _id = id,
        _name = name,
        _dob = dob,
        _passportNumber = passportNumber,
        _countryOfResidency = countryOfResidency,
        _nationality = nationality;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "passportNumber" field.
  String? _passportNumber;
  String get passportNumber => _passportNumber ?? '';
  set passportNumber(String? val) => _passportNumber = val;

  bool hasPassportNumber() => _passportNumber != null;

  // "countryOfResidency" field.
  Countries? _countryOfResidency;
  Countries? get countryOfResidency => _countryOfResidency;
  set countryOfResidency(Countries? val) => _countryOfResidency = val;

  bool hasCountryOfResidency() => _countryOfResidency != null;

  // "nationality" field.
  Countries? _nationality;
  Countries? get nationality => _nationality;
  set nationality(Countries? val) => _nationality = val;

  bool hasNationality() => _nationality != null;

  static GuestStruct fromMap(Map<String, dynamic> data) => GuestStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        dob: data['dob'] as DateTime?,
        passportNumber: data['passportNumber'] as String?,
        countryOfResidency: data['countryOfResidency'] is Countries
            ? data['countryOfResidency']
            : deserializeEnum<Countries>(data['countryOfResidency']),
        nationality: data['nationality'] is Countries
            ? data['nationality']
            : deserializeEnum<Countries>(data['nationality']),
      );

  static GuestStruct? maybeFromMap(dynamic data) =>
      data is Map ? GuestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'dob': _dob,
        'passportNumber': _passportNumber,
        'countryOfResidency': _countryOfResidency?.serialize(),
        'nationality': _nationality?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.DateTime,
        ),
        'passportNumber': serializeParam(
          _passportNumber,
          ParamType.String,
        ),
        'countryOfResidency': serializeParam(
          _countryOfResidency,
          ParamType.Enum,
        ),
        'nationality': serializeParam(
          _nationality,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static GuestStruct fromSerializableMap(Map<String, dynamic> data) =>
      GuestStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.DateTime,
          false,
        ),
        passportNumber: deserializeParam(
          data['passportNumber'],
          ParamType.String,
          false,
        ),
        countryOfResidency: deserializeParam<Countries>(
          data['countryOfResidency'],
          ParamType.Enum,
          false,
        ),
        nationality: deserializeParam<Countries>(
          data['nationality'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'GuestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GuestStruct &&
        id == other.id &&
        name == other.name &&
        dob == other.dob &&
        passportNumber == other.passportNumber &&
        countryOfResidency == other.countryOfResidency &&
        nationality == other.nationality;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, dob, passportNumber, countryOfResidency, nationality]);
}

GuestStruct createGuestStruct({
  int? id,
  String? name,
  DateTime? dob,
  String? passportNumber,
  Countries? countryOfResidency,
  Countries? nationality,
}) =>
    GuestStruct(
      id: id,
      name: name,
      dob: dob,
      passportNumber: passportNumber,
      countryOfResidency: countryOfResidency,
      nationality: nationality,
    );
