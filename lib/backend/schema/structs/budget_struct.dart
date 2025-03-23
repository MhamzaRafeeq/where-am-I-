// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BudgetStruct extends FFFirebaseStruct {
  BudgetStruct({
    String? minimum,
    String? maximum,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _minimum = minimum,
        _maximum = maximum,
        super(firestoreUtilData);

  // "minimum" field.
  String? _minimum;
  String get minimum => _minimum ?? '';
  set minimum(String? val) => _minimum = val;

  bool hasMinimum() => _minimum != null;

  // "maximum" field.
  String? _maximum;
  String get maximum => _maximum ?? '';
  set maximum(String? val) => _maximum = val;

  bool hasMaximum() => _maximum != null;

  static BudgetStruct fromMap(Map<String, dynamic> data) => BudgetStruct(
        minimum: data['minimum'] as String?,
        maximum: data['maximum'] as String?,
      );

  static BudgetStruct? maybeFromMap(dynamic data) =>
      data is Map ? BudgetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'minimum': _minimum,
        'maximum': _maximum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'minimum': serializeParam(
          _minimum,
          ParamType.String,
        ),
        'maximum': serializeParam(
          _maximum,
          ParamType.String,
        ),
      }.withoutNulls;

  static BudgetStruct fromSerializableMap(Map<String, dynamic> data) =>
      BudgetStruct(
        minimum: deserializeParam(
          data['minimum'],
          ParamType.String,
          false,
        ),
        maximum: deserializeParam(
          data['maximum'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BudgetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BudgetStruct &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode => const ListEquality().hash([minimum, maximum]);
}

BudgetStruct createBudgetStruct({
  String? minimum,
  String? maximum,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BudgetStruct(
      minimum: minimum,
      maximum: maximum,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BudgetStruct? updateBudgetStruct(
  BudgetStruct? budget, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    budget
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBudgetStructData(
  Map<String, dynamic> firestoreData,
  BudgetStruct? budget,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (budget == null) {
    return;
  }
  if (budget.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && budget.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final budgetData = getBudgetFirestoreData(budget, forFieldValue);
  final nestedData = budgetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = budget.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBudgetFirestoreData(
  BudgetStruct? budget, [
  bool forFieldValue = false,
]) {
  if (budget == null) {
    return {};
  }
  final firestoreData = mapToFirestore(budget.toMap());

  // Add any Firestore field values
  budget.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBudgetListFirestoreData(
  List<BudgetStruct>? budgets,
) =>
    budgets?.map((e) => getBudgetFirestoreData(e, true)).toList() ?? [];
