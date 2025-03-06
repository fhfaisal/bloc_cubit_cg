
import 'package:cubit_bloc/domain/usecases/auth/search_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;

  SearchCubit(this.searchUseCase) : super(SearchInitial());
  Future<void> search({required String text}) async {
    Map<String,dynamic>values={};
    values['lat']='23.7812685';
    values['long']='90.4128795';
    values['text_search']=text;
    values['catSubCat']=null;
    values['business_name']=null;
    emit(SearchLoading());
    final result = await searchUseCase.search(values: values);
    result.fold(
          (failure) => emit(SearchError(failure.message)),
          (success) => emit(SearchSuccess(searchData: success)),
    );
  }
}
