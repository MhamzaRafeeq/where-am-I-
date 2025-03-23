// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkAddressInfoStruct extends FFFirebaseStruct {
  WorkAddressInfoStruct({
    String? workPlace,
    String? address,
    String? commutedTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _workPlace = workPlace,
        _address = address,
        _commutedTime = commutedTime,
        super(firestoreUtilData);

  // "workPlace" field.
  String? _workPlace;
  String get workPlace => _workPlace ?? '';
  set workPlace(String? val) => _workPlace = val;

  bool hasWorkPlace() => _workPlace != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "commutedTime" field.
  String? _commutedTime;
  String get commutedTime => _commutedTime ?? '';
  set commutedTime(String? val) => _commutedTime = val;

  bool hasCommutedTime() => _commutedTime != null;

  static WorkAddressInfoStruct fromMap(Map<String, dynamic> data) =>
      WorkAddressInfoStruct(
        workPlace: data['workPlace'] as String?,
        address: data['Address'] as String?,
        commutedTime: data['commutedTime'] as String?,
      );

  static WorkAddressInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkAddressInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'workPlace': _workPlace,
        'Address': _address,
        'commutedTime': _commutedTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'workPlace': serializeParam(
          _workPlace,
          ParamType.String,
        ),
        'Address': serializeParam(
          _address,
          ParamType.String,
        ),
        'commutedTime': serializeParam(
          _commutedTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkAddressInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkAddressInfoStruct(
        workPlace: deserializeParam(
          data['workPlace'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['Address'],
          ParamType.String,
          false,
        ),
        commutedTime: deserializeParam(
          data['commutedTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkAddressInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkAddressInfoStruct &&
        workPlace == other.workPlace &&
        address == other.address &&
        commutedTime == other.commutedTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([workPlace, address, commutedTime]);
}

WorkAddressInfoStruct createWorkAddressInfoStruct({
  String? workPlace,
  String? address,
  String? commutedTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkAddressInfoStruct(
      workPlace: workPlace,
      address: address,
      commutedTime: commutedTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkAddressInfoStruct? updateWorkAddressInfoStruct(
  WorkAddressInfoStruct? workAddressInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workAddressInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkAddressInfoStructData(
  Map<String, dynamic> firestoreData,
  WorkAddressInfoStruct? workAddressInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workAddressInfo == null) {
    return;
  }
  if (workAddressInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workAddressInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workAddressInfoData =
      getWorkAddressInfoFirestoreData(workAddressInfo, forFieldValue);
  final nestedData =
      workAddressInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workAddressInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkAddressInfoFirestoreData(
  WorkAddressInfoStruct? workAddressInfo, [
  bool forFieldValue = false,
]) {
  if (workAddressInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workAddressInfo.toMap());

  // Add any Firestore field values
  workAddressInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkAddressInfoListFirestoreData(
  List<WorkAddressInfoStruct>? workAddressInfos,
) =>
    workAddressInfos
        ?.map((e) => getWorkAddressInfoFirestoreData(e, true))
        .toList() ??
    [];
