// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceSearchStruct extends FFFirebaseStruct {
  PlaceSearchStruct({
    int? id,
    List<String>? name,
    List<String>? location,
    List<int>? rating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _location = location,
        _rating = rating,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "Name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  set name(List<String>? val) => _name = val;
  void updateName(Function(List<String>) updateFn) => updateFn(_name ??= []);
  bool hasName() => _name != null;

  // "Location" field.
  List<String>? _location;
  List<String> get location => _location ?? const [];
  set location(List<String>? val) => _location = val;
  void updateLocation(Function(List<String>) updateFn) =>
      updateFn(_location ??= []);
  bool hasLocation() => _location != null;

  // "Rating" field.
  List<int>? _rating;
  List<int> get rating => _rating ?? const [];
  set rating(List<int>? val) => _rating = val;
  void updateRating(Function(List<int>) updateFn) => updateFn(_rating ??= []);
  bool hasRating() => _rating != null;

  static PlaceSearchStruct fromMap(Map<String, dynamic> data) =>
      PlaceSearchStruct(
        id: castToType<int>(data['id']),
        name: getDataList(data['Name']),
        location: getDataList(data['Location']),
        rating: getDataList(data['Rating']),
      );

  static PlaceSearchStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlaceSearchStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'Name': _name,
        'Location': _location,
        'Rating': _rating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
          true,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
          true,
        ),
        'Rating': serializeParam(
          _rating,
          ParamType.int,
          true,
        ),
      }.withoutNulls;

  static PlaceSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceSearchStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam<String>(
          data['Name'],
          ParamType.String,
          true,
        ),
        location: deserializeParam<String>(
          data['Location'],
          ParamType.String,
          true,
        ),
        rating: deserializeParam<int>(
          data['Rating'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PlaceSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaceSearchStruct &&
        id == other.id &&
        listEquality.equals(name, other.name) &&
        listEquality.equals(location, other.location) &&
        listEquality.equals(rating, other.rating);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, location, rating]);
}

PlaceSearchStruct createPlaceSearchStruct({
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceSearchStruct(
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceSearchStruct? updatePlaceSearchStruct(
  PlaceSearchStruct? placeSearch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeSearch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceSearchStructData(
  Map<String, dynamic> firestoreData,
  PlaceSearchStruct? placeSearch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeSearch == null) {
    return;
  }
  if (placeSearch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeSearch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeSearchData =
      getPlaceSearchFirestoreData(placeSearch, forFieldValue);
  final nestedData =
      placeSearchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeSearch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceSearchFirestoreData(
  PlaceSearchStruct? placeSearch, [
  bool forFieldValue = false,
]) {
  if (placeSearch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeSearch.toMap());

  // Add any Firestore field values
  placeSearch.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceSearchListFirestoreData(
  List<PlaceSearchStruct>? placeSearchs,
) =>
    placeSearchs?.map((e) => getPlaceSearchFirestoreData(e, true)).toList() ??
    [];
