import 'package:cubit_bloc/domain/entities/search_data.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchData>> search({required Map<String,dynamic>values});
}