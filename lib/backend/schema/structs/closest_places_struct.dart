// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ClosestPlacesStruct extends FFFirebaseStruct {
  ClosestPlacesStruct({
    String? place,
    String? duration,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _place = place,
        _duration = duration,
        super(firestoreUtilData);

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  set place(String? val) => _place = val;

  bool hasPlace() => _place != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  static ClosestPlacesStruct fromMap(Map<String, dynamic> data) =>
      ClosestPlacesStruct(
        place: data['place'] as String?,
        duration: data['duration'] as String?,
      );

  static ClosestPlacesStruct? maybeFromMap(dynamic data) => data is Map
      ? ClosestPlacesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'place': _place,
        'duration': _duration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'place': serializeParam(
          _place,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClosestPlacesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClosestPlacesStruct(
        place: deserializeParam(
          data['place'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClosestPlacesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClosestPlacesStruct &&
        place == other.place &&
        duration == other.duration;
  }

  @override
  int get hashCode => const ListEquality().hash([place, duration]);
}

ClosestPlacesStruct createClosestPlacesStruct({
  String? place,
  String? duration,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClosestPlacesStruct(
      place: place,
      duration: duration,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClosestPlacesStruct? updateClosestPlacesStruct(
  ClosestPlacesStruct? closestPlaces, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    closestPlaces
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClosestPlacesStructData(
  Map<String, dynamic> firestoreData,
  ClosestPlacesStruct? closestPlaces,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (closestPlaces == null) {
    return;
  }
  if (closestPlaces.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && closestPlaces.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final closestPlacesData =
      getClosestPlacesFirestoreData(closestPlaces, forFieldValue);
  final nestedData =
      closestPlacesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = closestPlaces.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClosestPlacesFirestoreData(
  ClosestPlacesStruct? closestPlaces, [
  bool forFieldValue = false,
]) {
  if (closestPlaces == null) {
    return {};
  }
  final firestoreData = mapToFirestore(closestPlaces.toMap());

  // Add any Firestore field values
  closestPlaces.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClosestPlacesListFirestoreData(
  List<ClosestPlacesStruct>? closestPlacess,
) =>
    closestPlacess
        ?.map((e) => getClosestPlacesFirestoreData(e, true))
        .toList() ??
    [];
