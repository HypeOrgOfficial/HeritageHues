import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchCall {
  static Future<ApiCallResponse> call({
    String? searchString = 'a',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search',
      apiUrl:
          'https://waiargnrooltnzsilbkd.supabase.co/rest/v1/places?or=(Name.ilike.%$searchString%)',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndhaWFyZ25yb29sdG56c2lsYmtkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDExODcyMTcsImV4cCI6MjAxNjc2MzIxN30.g2XWdnLxc-pLgr_DgSzxdRcIbdd6YOdOpUJgNFq3_L8',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndhaWFyZ25yb29sdG56c2lsYmtkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDExODcyMTcsImV4cCI6MjAxNjc2MzIxN30.g2XWdnLxc-pLgr_DgSzxdRcIbdd6YOdOpUJgNFq3_L8',
      },
      params: {
        'SearchString': searchString,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
