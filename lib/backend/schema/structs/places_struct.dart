// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesStruct extends FFFirebaseStruct {
  PlacesStruct({
    List<PlacesTypesStruct>? places,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _places = places,
        super(firestoreUtilData);

  // "places" field.
  List<PlacesTypesStruct>? _places;
  List<PlacesTypesStruct> get places => _places ?? const [];
  set places(List<PlacesTypesStruct>? val) => _places = val;

  void updatePlaces(Function(List<PlacesTypesStruct>) updateFn) {
    updateFn(_places ??= []);
  }

  bool hasPlaces() => _places != null;

  static PlacesStruct fromMap(Map<String, dynamic> data) => PlacesStruct(
        places: getStructList(
          data['places'],
          PlacesTypesStruct.fromMap,
        ),
      );

  static PlacesStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlacesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'places': _places?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'places': serializeParam(
          _places,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PlacesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlacesStruct(
        places: deserializeStructParam<PlacesTypesStruct>(
          data['places'],
          ParamType.DataStruct,
          true,
          structBuilder: PlacesTypesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PlacesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlacesStruct && listEquality.equals(places, other.places);
  }

  @override
  int get hashCode => const ListEquality().hash([places]);
}

PlacesStruct createPlacesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlacesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlacesStruct? updatePlacesStruct(
  PlacesStruct? placesStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placesStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlacesStructData(
  Map<String, dynamic> firestoreData,
  PlacesStruct? placesStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placesStruct == null) {
    return;
  }
  if (placesStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placesStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placesStructData = getPlacesFirestoreData(placesStruct, forFieldValue);
  final nestedData =
      placesStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placesStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlacesFirestoreData(
  PlacesStruct? placesStruct, [
  bool forFieldValue = false,
]) {
  if (placesStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placesStruct.toMap());

  // Add any Firestore field values
  placesStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlacesListFirestoreData(
  List<PlacesStruct>? placesStructs,
) =>
    placesStructs?.map((e) => getPlacesFirestoreData(e, true)).toList() ?? [];
