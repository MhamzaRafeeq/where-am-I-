// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HouseholdSizeStruct extends FFFirebaseStruct {
  HouseholdSizeStruct({
    int? adults,
    int? children,
    String? dogs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _adults = adults,
        _children = children,
        _dogs = dogs,
        super(firestoreUtilData);

  // "Adults" field.
  int? _adults;
  int get adults => _adults ?? 0;
  set adults(int? val) => _adults = val;

  void incrementAdults(int amount) => adults = adults + amount;

  bool hasAdults() => _adults != null;

  // "children" field.
  int? _children;
  int get children => _children ?? 0;
  set children(int? val) => _children = val;

  void incrementChildren(int amount) => children = children + amount;

  bool hasChildren() => _children != null;

  // "dogs" field.
  String? _dogs;
  String get dogs => _dogs ?? '';
  set dogs(String? val) => _dogs = val;

  bool hasDogs() => _dogs != null;

  static HouseholdSizeStruct fromMap(Map<String, dynamic> data) =>
      HouseholdSizeStruct(
        adults: castToType<int>(data['Adults']),
        children: castToType<int>(data['children']),
        dogs: data['dogs'] as String?,
      );

  static HouseholdSizeStruct? maybeFromMap(dynamic data) => data is Map
      ? HouseholdSizeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Adults': _adults,
        'children': _children,
        'dogs': _dogs,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Adults': serializeParam(
          _adults,
          ParamType.int,
        ),
        'children': serializeParam(
          _children,
          ParamType.int,
        ),
        'dogs': serializeParam(
          _dogs,
          ParamType.String,
        ),
      }.withoutNulls;

  static HouseholdSizeStruct fromSerializableMap(Map<String, dynamic> data) =>
      HouseholdSizeStruct(
        adults: deserializeParam(
          data['Adults'],
          ParamType.int,
          false,
        ),
        children: deserializeParam(
          data['children'],
          ParamType.int,
          false,
        ),
        dogs: deserializeParam(
          data['dogs'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HouseholdSizeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HouseholdSizeStruct &&
        adults == other.adults &&
        children == other.children &&
        dogs == other.dogs;
  }

  @override
  int get hashCode => const ListEquality().hash([adults, children, dogs]);
}

HouseholdSizeStruct createHouseholdSizeStruct({
  int? adults,
  int? children,
  String? dogs,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HouseholdSizeStruct(
      adults: adults,
      children: children,
      dogs: dogs,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HouseholdSizeStruct? updateHouseholdSizeStruct(
  HouseholdSizeStruct? householdSize, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    householdSize
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHouseholdSizeStructData(
  Map<String, dynamic> firestoreData,
  HouseholdSizeStruct? householdSize,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (householdSize == null) {
    return;
  }
  if (householdSize.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && householdSize.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final householdSizeData =
      getHouseholdSizeFirestoreData(householdSize, forFieldValue);
  final nestedData =
      householdSizeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = householdSize.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHouseholdSizeFirestoreData(
  HouseholdSizeStruct? householdSize, [
  bool forFieldValue = false,
]) {
  if (householdSize == null) {
    return {};
  }
  final firestoreData = mapToFirestore(householdSize.toMap());

  // Add any Firestore field values
  householdSize.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHouseholdSizeListFirestoreData(
  List<HouseholdSizeStruct>? householdSizes,
) =>
    householdSizes
        ?.map((e) => getHouseholdSizeFirestoreData(e, true))
        .toList() ??
    [];
