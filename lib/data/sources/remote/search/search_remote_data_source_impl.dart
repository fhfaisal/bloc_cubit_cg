
import 'package:cubit_bloc/data/models/search_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  final DioClient _dioClient;

  SearchRemoteDataSourceImpl(this._dioClient);
  
  @override
  Future<SearchModel> search({required Map<String,dynamic>values}) async {
    try {
      final response = await _dioClient.get(ApiConstants.search, queryParameters: values);
      final model = SearchModel.fromJson(response.data);
      return model;
    } catch (_) {
      rethrow;
    }
  }
}