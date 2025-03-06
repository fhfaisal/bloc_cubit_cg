import 'package:cubit_bloc/domain/entities/search_data.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

/// Abstract class representing the various states for authentication.
abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

/// Initial state when no action has been taken.
class SearchInitial extends SearchState {}

/// Loading state while an authentication action is in progress.
class SearchLoading extends SearchState {}

/// State when the user has been successfully authenticated.
class SearchSuccess extends SearchState {
  final SearchData searchData;

  const SearchSuccess({required this.searchData});

  @override
  List<Object?> get props => [searchData];
}

/// State when an error occurs during an authentication operation.
class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
