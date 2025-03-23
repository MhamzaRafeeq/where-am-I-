import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressReportRecord extends FirestoreRecord {
  AddressReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "convenience" field.
  List<AddressAndDurationStruct>? _convenience;
  List<AddressAndDurationStruct> get convenience => _convenience ?? const [];
  bool hasConvenience() => _convenience != null;

  // "Safety" field.
  List<AddressAndDurationStruct>? _safety;
  List<AddressAndDurationStruct> get safety => _safety ?? const [];
  bool hasSafety() => _safety != null;

  // "QualityOfLIfe" field.
  List<AddressAndDurationStruct>? _qualityOfLIfe;
  List<AddressAndDurationStruct> get qualityOfLIfe =>
      _qualityOfLIfe ?? const [];
  bool hasQualityOfLIfe() => _qualityOfLIfe != null;

  // "reportPlace" field.
  LatLng? _reportPlace;
  LatLng? get reportPlace => _reportPlace;
  bool hasReportPlace() => _reportPlace != null;

  // "reportplaceAddress" field.
  String? _reportplaceAddress;
  String get reportplaceAddress => _reportplaceAddress ?? '';
  bool hasReportplaceAddress() => _reportplaceAddress != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "convenienceResult" field.
  List<Color>? _convenienceResult;
  List<Color> get convenienceResult => _convenienceResult ?? const [];
  bool hasConvenienceResult() => _convenienceResult != null;

  // "safetyResult" field.
  List<Color>? _safetyResult;
  List<Color> get safetyResult => _safetyResult ?? const [];
  bool hasSafetyResult() => _safetyResult != null;

  // "qualityResult" field.
  List<Color>? _qualityResult;
  List<Color> get qualityResult => _qualityResult ?? const [];
  bool hasQualityResult() => _qualityResult != null;

  // "finalResult" field.
  List<Color>? _finalResult;
  List<Color> get finalResult => _finalResult ?? const [];
  bool hasFinalResult() => _finalResult != null;

  void _initializeFields() {
    _convenience = getStructList(
      snapshotData['convenience'],
      AddressAndDurationStruct.fromMap,
    );
    _safety = getStructList(
      snapshotData['Safety'],
      AddressAndDurationStruct.fromMap,
    );
    _qualityOfLIfe = getStructList(
      snapshotData['QualityOfLIfe'],
      AddressAndDurationStruct.fromMap,
    );
    _reportPlace = snapshotData['reportPlace'] as LatLng?;
    _reportplaceAddress = snapshotData['reportplaceAddress'] as String?;
    _uid = snapshotData['uid'] as String?;
    _convenienceResult = getColorsList(snapshotData['convenienceResult']);
    _safetyResult = getColorsList(snapshotData['safetyResult']);
    _qualityResult = getColorsList(snapshotData['qualityResult']);
    _finalResult = getColorsList(snapshotData['finalResult']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('addressReport');

  static Stream<AddressReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddressReportRecord.fromSnapshot(s));

  static Future<AddressReportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddressReportRecord.fromSnapshot(s));

  static AddressReportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddressReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddressReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddressReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddressReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddressReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddressReportRecordData({
  LatLng? reportPlace,
  String? reportplaceAddress,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportPlace': reportPlace,
      'reportplaceAddress': reportplaceAddress,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddressReportRecordDocumentEquality
    implements Equality<AddressReportRecord> {
  const AddressReportRecordDocumentEquality();

  @override
  bool equals(AddressReportRecord? e1, AddressReportRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.convenience, e2?.convenience) &&
        listEquality.equals(e1?.safety, e2?.safety) &&
        listEquality.equals(e1?.qualityOfLIfe, e2?.qualityOfLIfe) &&
        e1?.reportPlace == e2?.reportPlace &&
        e1?.reportplaceAddress == e2?.reportplaceAddress &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.convenienceResult, e2?.convenienceResult) &&
        listEquality.equals(e1?.safetyResult, e2?.safetyResult) &&
        listEquality.equals(e1?.qualityResult, e2?.qualityResult) &&
        listEquality.equals(e1?.finalResult, e2?.finalResult);
  }

  @override
  int hash(AddressReportRecord? e) => const ListEquality().hash([
        e?.convenience,
        e?.safety,
        e?.qualityOfLIfe,
        e?.reportPlace,
        e?.reportplaceAddress,
        e?.uid,
        e?.convenienceResult,
        e?.safetyResult,
        e?.qualityResult,
        e?.finalResult
      ]);

  @override
  bool isValidKey(Object? o) => o is AddressReportRecord;
}
