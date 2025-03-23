// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchNearbyResultsStruct extends FFFirebaseStruct {
  SearchNearbyResultsStruct({
    List<PlacesTypesStruct>? searchNearbySingleApiCallResult,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _searchNearbySingleApiCallResult = searchNearbySingleApiCallResult,
        super(firestoreUtilData);

  // "searchNearbySingleApiCallResult" field.
  List<PlacesTypesStruct>? _searchNearbySingleApiCallResult;
  List<PlacesTypesStruct> get searchNearbySingleApiCallResult =>
      _searchNearbySingleApiCallResult ?? const [];
  set searchNearbySingleApiCallResult(List<PlacesTypesStruct>? val) =>
      _searchNearbySingleApiCallResult = val;

  void updateSearchNearbySingleApiCallResult(
      Function(List<PlacesTypesStruct>) updateFn) {
    updateFn(_searchNearbySingleApiCallResult ??= []);
  }

  bool hasSearchNearbySingleApiCallResult() =>
      _searchNearbySingleApiCallResult != null;

  static SearchNearbyResultsStruct fromMap(Map<String, dynamic> data) =>
      SearchNearbyResultsStruct(
        searchNearbySingleApiCallResult: getStructList(
          data['searchNearbySingleApiCallResult'],
          PlacesTypesStruct.fromMap,
        ),
      );

  static SearchNearbyResultsStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchNearbyResultsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'searchNearbySingleApiCallResult':
            _searchNearbySingleApiCallResult?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'searchNearbySingleApiCallResult': serializeParam(
          _searchNearbySingleApiCallResult,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SearchNearbyResultsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchNearbyResultsStruct(
        searchNearbySingleApiCallResult:
            deserializeStructParam<PlacesTypesStruct>(
          data['searchNearbySingleApiCallResult'],
          ParamType.DataStruct,
          true,
          structBuilder: PlacesTypesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchNearbyResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SearchNearbyResultsStruct &&
        listEquality.equals(searchNearbySingleApiCallResult,
            other.searchNearbySingleApiCallResult);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([searchNearbySingleApiCallResult]);
}

SearchNearbyResultsStruct createSearchNearbyResultsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchNearbyResultsStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchNearbyResultsStruct? updateSearchNearbyResultsStruct(
  SearchNearbyResultsStruct? searchNearbyResults, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchNearbyResults
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchNearbyResultsStructData(
  Map<String, dynamic> firestoreData,
  SearchNearbyResultsStruct? searchNearbyResults,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchNearbyResults == null) {
    return;
  }
  if (searchNearbyResults.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchNearbyResults.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchNearbyResultsData =
      getSearchNearbyResultsFirestoreData(searchNearbyResults, forFieldValue);
  final nestedData =
      searchNearbyResultsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      searchNearbyResults.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchNearbyResultsFirestoreData(
  SearchNearbyResultsStruct? searchNearbyResults, [
  bool forFieldValue = false,
]) {
  if (searchNearbyResults == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchNearbyResults.toMap());

  // Add any Firestore field values
  searchNearbyResults.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchNearbyResultsListFirestoreData(
  List<SearchNearbyResultsStruct>? searchNearbyResultss,
) =>
    searchNearbyResultss
        ?.map((e) => getSearchNearbyResultsFirestoreData(e, true))
        .toList() ??
    [];
