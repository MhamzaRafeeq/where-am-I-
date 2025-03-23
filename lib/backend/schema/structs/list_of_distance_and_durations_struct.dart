// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListOfDistanceAndDurationsStruct extends FFFirebaseStruct {
  ListOfDistanceAndDurationsStruct({
    List<String>? distances,
    List<String>? durations,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _distances = distances,
        _durations = durations,
        super(firestoreUtilData);

  // "distances" field.
  List<String>? _distances;
  List<String> get distances => _distances ?? const [];
  set distances(List<String>? val) => _distances = val;

  void updateDistances(Function(List<String>) updateFn) {
    updateFn(_distances ??= []);
  }

  bool hasDistances() => _distances != null;

  // "durations" field.
  List<String>? _durations;
  List<String> get durations => _durations ?? const [];
  set durations(List<String>? val) => _durations = val;

  void updateDurations(Function(List<String>) updateFn) {
    updateFn(_durations ??= []);
  }

  bool hasDurations() => _durations != null;

  static ListOfDistanceAndDurationsStruct fromMap(Map<String, dynamic> data) =>
      ListOfDistanceAndDurationsStruct(
        distances: getDataList(data['distances']),
        durations: getDataList(data['durations']),
      );

  static ListOfDistanceAndDurationsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ListOfDistanceAndDurationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'distances': _distances,
        'durations': _durations,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'distances': serializeParam(
          _distances,
          ParamType.String,
          isList: true,
        ),
        'durations': serializeParam(
          _durations,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ListOfDistanceAndDurationsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListOfDistanceAndDurationsStruct(
        distances: deserializeParam<String>(
          data['distances'],
          ParamType.String,
          true,
        ),
        durations: deserializeParam<String>(
          data['durations'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ListOfDistanceAndDurationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListOfDistanceAndDurationsStruct &&
        listEquality.equals(distances, other.distances) &&
        listEquality.equals(durations, other.durations);
  }

  @override
  int get hashCode => const ListEquality().hash([distances, durations]);
}

ListOfDistanceAndDurationsStruct createListOfDistanceAndDurationsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ListOfDistanceAndDurationsStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ListOfDistanceAndDurationsStruct? updateListOfDistanceAndDurationsStruct(
  ListOfDistanceAndDurationsStruct? listOfDistanceAndDurations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    listOfDistanceAndDurations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addListOfDistanceAndDurationsStructData(
  Map<String, dynamic> firestoreData,
  ListOfDistanceAndDurationsStruct? listOfDistanceAndDurations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (listOfDistanceAndDurations == null) {
    return;
  }
  if (listOfDistanceAndDurations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      listOfDistanceAndDurations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final listOfDistanceAndDurationsData =
      getListOfDistanceAndDurationsFirestoreData(
          listOfDistanceAndDurations, forFieldValue);
  final nestedData = listOfDistanceAndDurationsData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      listOfDistanceAndDurations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getListOfDistanceAndDurationsFirestoreData(
  ListOfDistanceAndDurationsStruct? listOfDistanceAndDurations, [
  bool forFieldValue = false,
]) {
  if (listOfDistanceAndDurations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(listOfDistanceAndDurations.toMap());

  // Add any Firestore field values
  listOfDistanceAndDurations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getListOfDistanceAndDurationsListFirestoreData(
  List<ListOfDistanceAndDurationsStruct>? listOfDistanceAndDurationss,
) =>
    listOfDistanceAndDurationss
        ?.map((e) => getListOfDistanceAndDurationsFirestoreData(e, true))
        .toList() ??
    [];
