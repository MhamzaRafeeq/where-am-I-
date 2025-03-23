// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesTypesStruct extends FFFirebaseStruct {
  PlacesTypesStruct({
    List<String>? types,
    String? formattedAddress,
    LocationStruct? location,
    DisplayNameStruct? displayName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _types = types,
        _formattedAddress = formattedAddress,
        _location = location,
        _displayName = displayName,
        super(firestoreUtilData);

  // "types" field.
  List<String>? _types;
  List<String> get types => _types ?? const [];
  set types(List<String>? val) => _types = val;

  void updateTypes(Function(List<String>) updateFn) {
    updateFn(_types ??= []);
  }

  bool hasTypes() => _types != null;

  // "formattedAddress" field.
  String? _formattedAddress;
  String get formattedAddress => _formattedAddress ?? '';
  set formattedAddress(String? val) => _formattedAddress = val;

  bool hasFormattedAddress() => _formattedAddress != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  // "displayName" field.
  DisplayNameStruct? _displayName;
  DisplayNameStruct get displayName => _displayName ?? DisplayNameStruct();
  set displayName(DisplayNameStruct? val) => _displayName = val;

  void updateDisplayName(Function(DisplayNameStruct) updateFn) {
    updateFn(_displayName ??= DisplayNameStruct());
  }

  bool hasDisplayName() => _displayName != null;

  static PlacesTypesStruct fromMap(Map<String, dynamic> data) =>
      PlacesTypesStruct(
        types: getDataList(data['types']),
        formattedAddress: data['formattedAddress'] as String?,
        location: data['location'] is LocationStruct
            ? data['location']
            : LocationStruct.maybeFromMap(data['location']),
        displayName: data['displayName'] is DisplayNameStruct
            ? data['displayName']
            : DisplayNameStruct.maybeFromMap(data['displayName']),
      );

  static PlacesTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? PlacesTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'types': _types,
        'formattedAddress': _formattedAddress,
        'location': _location?.toMap(),
        'displayName': _displayName?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'types': serializeParam(
          _types,
          ParamType.String,
          isList: true,
        ),
        'formattedAddress': serializeParam(
          _formattedAddress,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PlacesTypesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlacesTypesStruct(
        types: deserializeParam<String>(
          data['types'],
          ParamType.String,
          true,
        ),
        formattedAddress: deserializeParam(
          data['formattedAddress'],
          ParamType.String,
          false,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        displayName: deserializeStructParam(
          data['displayName'],
          ParamType.DataStruct,
          false,
          structBuilder: DisplayNameStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PlacesTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlacesTypesStruct &&
        listEquality.equals(types, other.types) &&
        formattedAddress == other.formattedAddress &&
        location == other.location &&
        displayName == other.displayName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([types, formattedAddress, location, displayName]);
}

PlacesTypesStruct createPlacesTypesStruct({
  String? formattedAddress,
  LocationStruct? location,
  DisplayNameStruct? displayName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlacesTypesStruct(
      formattedAddress: formattedAddress,
      location: location ?? (clearUnsetFields ? LocationStruct() : null),
      displayName:
          displayName ?? (clearUnsetFields ? DisplayNameStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlacesTypesStruct? updatePlacesTypesStruct(
  PlacesTypesStruct? placesTypes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placesTypes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlacesTypesStructData(
  Map<String, dynamic> firestoreData,
  PlacesTypesStruct? placesTypes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placesTypes == null) {
    return;
  }
  if (placesTypes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placesTypes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placesTypesData =
      getPlacesTypesFirestoreData(placesTypes, forFieldValue);
  final nestedData =
      placesTypesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placesTypes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlacesTypesFirestoreData(
  PlacesTypesStruct? placesTypes, [
  bool forFieldValue = false,
]) {
  if (placesTypes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placesTypes.toMap());

  // Handle nested data for "location" field.
  addLocationStructData(
    firestoreData,
    placesTypes.hasLocation() ? placesTypes.location : null,
    'location',
    forFieldValue,
  );

  // Handle nested data for "displayName" field.
  addDisplayNameStructData(
    firestoreData,
    placesTypes.hasDisplayName() ? placesTypes.displayName : null,
    'displayName',
    forFieldValue,
  );

  // Add any Firestore field values
  placesTypes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlacesTypesListFirestoreData(
  List<PlacesTypesStruct>? placesTypess,
) =>
    placesTypess?.map((e) => getPlacesTypesFirestoreData(e, true)).toList() ??
    [];
