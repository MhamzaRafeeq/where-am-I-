import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveysRecord extends FirestoreRecord {
  SurveysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lookingFor" field.
  String? _lookingFor;
  String get lookingFor => _lookingFor ?? '';
  bool hasLookingFor() => _lookingFor != null;

  // "householdSize" field.
  HouseholdSizeStruct? _householdSize;
  HouseholdSizeStruct get householdSize =>
      _householdSize ?? HouseholdSizeStruct();
  bool hasHouseholdSize() => _householdSize != null;

  // "wantedProfessionals" field.
  List<String>? _wantedProfessionals;
  List<String> get wantedProfessionals => _wantedProfessionals ?? const [];
  bool hasWantedProfessionals() => _wantedProfessionals != null;

  // "thingsWantedInNewHome" field.
  List<String>? _thingsWantedInNewHome;
  List<String> get thingsWantedInNewHome => _thingsWantedInNewHome ?? const [];
  bool hasThingsWantedInNewHome() => _thingsWantedInNewHome != null;

  // "currentAddress" field.
  String? _currentAddress;
  String get currentAddress => _currentAddress ?? '';
  bool hasCurrentAddress() => _currentAddress != null;

  // "currentAddressRating" field.
  String? _currentAddressRating;
  String get currentAddressRating => _currentAddressRating ?? '';
  bool hasCurrentAddressRating() => _currentAddressRating != null;

  // "importantameneties" field.
  List<String>? _importantameneties;
  List<String> get importantameneties => _importantameneties ?? const [];
  bool hasImportantameneties() => _importantameneties != null;

  // "idealNeighbourhood" field.
  String? _idealNeighbourhood;
  String get idealNeighbourhood => _idealNeighbourhood ?? '';
  bool hasIdealNeighbourhood() => _idealNeighbourhood != null;

  // "timeline" field.
  String? _timeline;
  String get timeline => _timeline ?? '';
  bool hasTimeline() => _timeline != null;

  // "budget" field.
  BudgetStruct? _budget;
  BudgetStruct get budget => _budget ?? BudgetStruct();
  bool hasBudget() => _budget != null;

  void _initializeFields() {
    _lookingFor = snapshotData['lookingFor'] as String?;
    _householdSize = snapshotData['householdSize'] is HouseholdSizeStruct
        ? snapshotData['householdSize']
        : HouseholdSizeStruct.maybeFromMap(snapshotData['householdSize']);
    _wantedProfessionals = getDataList(snapshotData['wantedProfessionals']);
    _thingsWantedInNewHome = getDataList(snapshotData['thingsWantedInNewHome']);
    _currentAddress = snapshotData['currentAddress'] as String?;
    _currentAddressRating = snapshotData['currentAddressRating'] as String?;
    _importantameneties = getDataList(snapshotData['importantameneties']);
    _idealNeighbourhood = snapshotData['idealNeighbourhood'] as String?;
    _timeline = snapshotData['timeline'] as String?;
    _budget = snapshotData['budget'] is BudgetStruct
        ? snapshotData['budget']
        : BudgetStruct.maybeFromMap(snapshotData['budget']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveys');

  static Stream<SurveysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveysRecord.fromSnapshot(s));

  static Future<SurveysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveysRecord.fromSnapshot(s));

  static SurveysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveysRecordData({
  String? lookingFor,
  HouseholdSizeStruct? householdSize,
  String? currentAddress,
  String? currentAddressRating,
  String? idealNeighbourhood,
  String? timeline,
  BudgetStruct? budget,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lookingFor': lookingFor,
      'householdSize': HouseholdSizeStruct().toMap(),
      'currentAddress': currentAddress,
      'currentAddressRating': currentAddressRating,
      'idealNeighbourhood': idealNeighbourhood,
      'timeline': timeline,
      'budget': BudgetStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "householdSize" field.
  addHouseholdSizeStructData(firestoreData, householdSize, 'householdSize');

  // Handle nested data for "budget" field.
  addBudgetStructData(firestoreData, budget, 'budget');

  return firestoreData;
}

class SurveysRecordDocumentEquality implements Equality<SurveysRecord> {
  const SurveysRecordDocumentEquality();

  @override
  bool equals(SurveysRecord? e1, SurveysRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lookingFor == e2?.lookingFor &&
        e1?.householdSize == e2?.householdSize &&
        listEquality.equals(e1?.wantedProfessionals, e2?.wantedProfessionals) &&
        listEquality.equals(
            e1?.thingsWantedInNewHome, e2?.thingsWantedInNewHome) &&
        e1?.currentAddress == e2?.currentAddress &&
        e1?.currentAddressRating == e2?.currentAddressRating &&
        listEquality.equals(e1?.importantameneties, e2?.importantameneties) &&
        e1?.idealNeighbourhood == e2?.idealNeighbourhood &&
        e1?.timeline == e2?.timeline &&
        e1?.budget == e2?.budget;
  }

  @override
  int hash(SurveysRecord? e) => const ListEquality().hash([
        e?.lookingFor,
        e?.householdSize,
        e?.wantedProfessionals,
        e?.thingsWantedInNewHome,
        e?.currentAddress,
        e?.currentAddressRating,
        e?.importantameneties,
        e?.idealNeighbourhood,
        e?.timeline,
        e?.budget
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveysRecord;
}
