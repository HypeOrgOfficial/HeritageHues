import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PlacesSearchRecord extends FirestoreRecord {
  PlacesSearchRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "Name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  bool hasName() => _name != null;

  // "Location" field.
  List<String>? _location;
  List<String> get location => _location ?? const [];
  bool hasLocation() => _location != null;

  // "Rating" field.
  List<int>? _rating;
  List<int> get rating => _rating ?? const [];
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = getDataList(snapshotData['Name']);
    _location = getDataList(snapshotData['Location']);
    _rating = getDataList(snapshotData['Rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PlacesSearch');

  static Stream<PlacesSearchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesSearchRecord.fromSnapshot(s));

  static Future<PlacesSearchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesSearchRecord.fromSnapshot(s));

  static PlacesSearchRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlacesSearchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesSearchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesSearchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlacesSearchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesSearchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesSearchRecordData({
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlacesSearchRecordDocumentEquality
    implements Equality<PlacesSearchRecord> {
  const PlacesSearchRecordDocumentEquality();

  @override
  bool equals(PlacesSearchRecord? e1, PlacesSearchRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        listEquality.equals(e1?.name, e2?.name) &&
        listEquality.equals(e1?.location, e2?.location) &&
        listEquality.equals(e1?.rating, e2?.rating);
  }

  @override
  int hash(PlacesSearchRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.location, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is PlacesSearchRecord;
}
