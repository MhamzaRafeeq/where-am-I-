// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressAndDurationStruct extends FFFirebaseStruct {
  AddressAndDurationStruct({
    String? name,
    String? travelDuration,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _travelDuration = travelDuration,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "travelDuration" field.
  String? _travelDuration;
  String get travelDuration => _travelDuration ?? '';
  set travelDuration(String? val) => _travelDuration = val;

  bool hasTravelDuration() => _travelDuration != null;

  static AddressAndDurationStruct fromMap(Map<String, dynamic> data) =>
      AddressAndDurationStruct(
        name: data['Name'] as String?,
        travelDuration: data['travelDuration'] as String?,
      );

  static AddressAndDurationStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressAndDurationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'travelDuration': _travelDuration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'travelDuration': serializeParam(
          _travelDuration,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressAndDurationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AddressAndDurationStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        travelDuration: deserializeParam(
          data['travelDuration'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressAndDurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressAndDurationStruct &&
        name == other.name &&
        travelDuration == other.travelDuration;
  }

  @override
  int get hashCode => const ListEquality().hash([name, travelDuration]);
}

AddressAndDurationStruct createAddressAndDurationStruct({
  String? name,
  String? travelDuration,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressAndDurationStruct(
      name: name,
      travelDuration: travelDuration,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressAndDurationStruct? updateAddressAndDurationStruct(
  AddressAndDurationStruct? addressAndDuration, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressAndDuration
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressAndDurationStructData(
  Map<String, dynamic> firestoreData,
  AddressAndDurationStruct? addressAndDuration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressAndDuration == null) {
    return;
  }
  if (addressAndDuration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressAndDuration.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressAndDurationData =
      getAddressAndDurationFirestoreData(addressAndDuration, forFieldValue);
  final nestedData =
      addressAndDurationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      addressAndDuration.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressAndDurationFirestoreData(
  AddressAndDurationStruct? addressAndDuration, [
  bool forFieldValue = false,
]) {
  if (addressAndDuration == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressAndDuration.toMap());

  // Add any Firestore field values
  addressAndDuration.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressAndDurationListFirestoreData(
  List<AddressAndDurationStruct>? addressAndDurations,
) =>
    addressAndDurations
        ?.map((e) => getAddressAndDurationFirestoreData(e, true))
        .toList() ??
    [];
