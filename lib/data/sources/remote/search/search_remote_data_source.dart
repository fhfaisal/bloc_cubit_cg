import 'package:cubit_bloc/data/models/search_model.dart';

abstract class SearchRemoteDataSource {
  /// Sends a sign in request and returns a [UserModel] on success.
  Future<SearchModel> search({required Map<String,dynamic>values});
}