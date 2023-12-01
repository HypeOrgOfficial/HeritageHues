// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesStruct extends FFFirebaseStruct {
  PlacesStruct({
    int? index,
    String? name,
    String? location,
    int? rating,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _index = index,
        _name = name,
        _location = location,
        _rating = rating,
        _image = image,
        super(firestoreUtilData);

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;
  void incrementRating(int amount) => _rating = rating + amount;
  bool hasRating() => _rating != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static PlacesStruct fromMap(Map<String, dynamic> data) => PlacesStruct(
        index: castToType<int>(data['index']),
        name: data['name'] as String?,
        location: data['location'] as String?,
        rating: castToType<int>(data['rating']),
        image: data['image'] as String?,
      );

  static PlacesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlacesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'name': _name,
        'location': _location,
        'rating': _rating,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlacesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlacesStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlacesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlacesStruct &&
        index == other.index &&
        name == other.name &&
        location == other.location &&
        rating == other.rating &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([index, name, location, rating, image]);
}

PlacesStruct createPlacesStruct({
  int? index,
  String? name,
  String? location,
  int? rating,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlacesStruct(
      index: index,
      name: name,
      location: location,
      rating: rating,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlacesStruct? updatePlacesStruct(
  PlacesStruct? places, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    places
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlacesStructData(
  Map<String, dynamic> firestoreData,
  PlacesStruct? places,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (places == null) {
    return;
  }
  if (places.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && places.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placesData = getPlacesFirestoreData(places, forFieldValue);
  final nestedData = placesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = places.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlacesFirestoreData(
  PlacesStruct? places, [
  bool forFieldValue = false,
]) {
  if (places == null) {
    return {};
  }
  final firestoreData = mapToFirestore(places.toMap());

  // Add any Firestore field values
  places.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlacesListFirestoreData(
  List<PlacesStruct>? placess,
) =>
    placess?.map((e) => getPlacesFirestoreData(e, true)).toList() ?? [];
