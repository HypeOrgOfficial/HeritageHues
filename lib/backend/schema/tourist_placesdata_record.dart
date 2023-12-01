import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TouristPlacesdataRecord extends FirestoreRecord {
  TouristPlacesdataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tpindex" field.
  int? _tpindex;
  int get tpindex => _tpindex ?? 0;
  bool hasTpindex() => _tpindex != null;

  // "placename" field.
  String? _placename;
  String get placename => _placename ?? '';
  bool hasPlacename() => _placename != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "history" field.
  String? _history;
  String get history => _history ?? '';
  bool hasHistory() => _history != null;

  // "imageurl" field.
  String? _imageurl;
  String get imageurl => _imageurl ?? '';
  bool hasImageurl() => _imageurl != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

  void _initializeFields() {
    _tpindex = castToType<int>(snapshotData['tpindex']);
    _placename = snapshotData['placename'] as String?;
    _location = snapshotData['location'] as String?;
    _history = snapshotData['history'] as String?;
    _imageurl = snapshotData['imageurl'] as String?;
    _discription = snapshotData['discription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TouristPlacesdata');

  static Stream<TouristPlacesdataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TouristPlacesdataRecord.fromSnapshot(s));

  static Future<TouristPlacesdataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TouristPlacesdataRecord.fromSnapshot(s));

  static TouristPlacesdataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TouristPlacesdataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TouristPlacesdataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TouristPlacesdataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TouristPlacesdataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TouristPlacesdataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTouristPlacesdataRecordData({
  int? tpindex,
  String? placename,
  String? location,
  String? history,
  String? imageurl,
  String? discription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tpindex': tpindex,
      'placename': placename,
      'location': location,
      'history': history,
      'imageurl': imageurl,
      'discription': discription,
    }.withoutNulls,
  );

  return firestoreData;
}

class TouristPlacesdataRecordDocumentEquality
    implements Equality<TouristPlacesdataRecord> {
  const TouristPlacesdataRecordDocumentEquality();

  @override
  bool equals(TouristPlacesdataRecord? e1, TouristPlacesdataRecord? e2) {
    return e1?.tpindex == e2?.tpindex &&
        e1?.placename == e2?.placename &&
        e1?.location == e2?.location &&
        e1?.history == e2?.history &&
        e1?.imageurl == e2?.imageurl &&
        e1?.discription == e2?.discription;
  }

  @override
  int hash(TouristPlacesdataRecord? e) => const ListEquality().hash([
        e?.tpindex,
        e?.placename,
        e?.location,
        e?.history,
        e?.imageurl,
        e?.discription
      ]);

  @override
  bool isValidKey(Object? o) => o is TouristPlacesdataRecord;
}
