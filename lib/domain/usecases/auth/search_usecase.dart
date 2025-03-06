import 'package:cubit_bloc/domain/repositories/search/search_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/search_data.dart';

class SearchUseCase{
  final SearchRepository searchRepository;
  SearchUseCase(this.searchRepository);
  Future<Either<Failure, SearchData>> search({required Map<String,dynamic>values}){
    return searchRepository.search(values: values);
  }
}