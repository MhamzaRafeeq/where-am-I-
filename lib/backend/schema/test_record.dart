import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestRecord extends FirestoreRecord {
  TestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  // "Author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Order" field.
  double? _order;
  double get order => _order ?? 0.0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _quote = snapshotData['Quote'] as String?;
    _author = snapshotData['Author'] as String?;
    _category = snapshotData['Category'] as String?;
    _order = castToType<double>(snapshotData['Order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test');

  static Stream<TestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestRecord.fromSnapshot(s));

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestRecord.fromSnapshot(s));

  static TestRecord fromSnapshot(DocumentSnapshot snapshot) => TestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestRecordData({
  String? quote,
  String? author,
  String? category,
  double? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Quote': quote,
      'Author': author,
      'Category': category,
      'Order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestRecordDocumentEquality implements Equality<TestRecord> {
  const TestRecordDocumentEquality();

  @override
  bool equals(TestRecord? e1, TestRecord? e2) {
    return e1?.quote == e2?.quote &&
        e1?.author == e2?.author &&
        e1?.category == e2?.category &&
        e1?.order == e2?.order;
  }

  @override
  int hash(TestRecord? e) =>
      const ListEquality().hash([e?.quote, e?.author, e?.category, e?.order]);

  @override
  bool isValidKey(Object? o) => o is TestRecord;
}
