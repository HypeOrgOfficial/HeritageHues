import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TouristplacesRecord extends FirestoreRecord {
  TouristplacesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tpindex" field.
  DocumentReference? _tpindex;
  DocumentReference? get tpindex => _tpindex;
  bool hasTpindex() => _tpindex != null;

  // "place" field.
  DocumentReference? _place;
  DocumentReference? get place => _place;
  bool hasPlace() => _place != null;

  // "location" field.
  DocumentReference? _location;
  DocumentReference? get location => _location;
  bool hasLocation() => _location != null;

  // "image" field.
  DocumentReference? _image;
  DocumentReference? get image => _image;
  bool hasImage() => _image != null;

  // "history" field.
  DocumentReference? _history;
  DocumentReference? get history => _history;
  bool hasHistory() => _history != null;

  // "image2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  void _initializeFields() {
    _tpindex = snapshotData['tpindex'] as DocumentReference?;
    _place = snapshotData['place'] as DocumentReference?;
    _location = snapshotData['location'] as DocumentReference?;
    _image = snapshotData['image'] as DocumentReference?;
    _history = snapshotData['history'] as DocumentReference?;
    _image2 = snapshotData['image2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('touristplaces');

  static Stream<TouristplacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TouristplacesRecord.fromSnapshot(s));

  static Future<TouristplacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TouristplacesRecord.fromSnapshot(s));

  static TouristplacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TouristplacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TouristplacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TouristplacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TouristplacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TouristplacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTouristplacesRecordData({
  DocumentReference? tpindex,
  DocumentReference? place,
  DocumentReference? location,
  DocumentReference? image,
  DocumentReference? history,
  String? image2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tpindex': tpindex,
      'place': place,
      'location': location,
      'image': image,
      'history': history,
      'image2': image2,
    }.withoutNulls,
  );

  return firestoreData;
}

class TouristplacesRecordDocumentEquality
    implements Equality<TouristplacesRecord> {
  const TouristplacesRecordDocumentEquality();

  @override
  bool equals(TouristplacesRecord? e1, TouristplacesRecord? e2) {
    return e1?.tpindex == e2?.tpindex &&
        e1?.place == e2?.place &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image &&
        e1?.history == e2?.history &&
        e1?.image2 == e2?.image2;
  }

  @override
  int hash(TouristplacesRecord? e) => const ListEquality().hash(
      [e?.tpindex, e?.place, e?.location, e?.image, e?.history, e?.image2]);

  @override
  bool isValidKey(Object? o) => o is TouristplacesRecord;
}
