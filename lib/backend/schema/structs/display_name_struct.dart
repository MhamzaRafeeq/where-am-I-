// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DisplayNameStruct extends FFFirebaseStruct {
  DisplayNameStruct({
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static DisplayNameStruct fromMap(Map<String, dynamic> data) =>
      DisplayNameStruct(
        text: data['text'] as String?,
      );

  static DisplayNameStruct? maybeFromMap(dynamic data) => data is Map
      ? DisplayNameStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static DisplayNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      DisplayNameStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DisplayNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisplayNameStruct && text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([text]);
}

DisplayNameStruct createDisplayNameStruct({
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DisplayNameStruct(
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DisplayNameStruct? updateDisplayNameStruct(
  DisplayNameStruct? displayName, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    displayName
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDisplayNameStructData(
  Map<String, dynamic> firestoreData,
  DisplayNameStruct? displayName,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (displayName == null) {
    return;
  }
  if (displayName.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && displayName.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final displayNameData =
      getDisplayNameFirestoreData(displayName, forFieldValue);
  final nestedData =
      displayNameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = displayName.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDisplayNameFirestoreData(
  DisplayNameStruct? displayName, [
  bool forFieldValue = false,
]) {
  if (displayName == null) {
    return {};
  }
  final firestoreData = mapToFirestore(displayName.toMap());

  // Add any Firestore field values
  displayName.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDisplayNameListFirestoreData(
  List<DisplayNameStruct>? displayNames,
) =>
    displayNames?.map((e) => getDisplayNameFirestoreData(e, true)).toList() ??
    [];
