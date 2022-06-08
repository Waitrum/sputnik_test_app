part of 'repositorieslist_bloc.dart';

abstract class RepositorieslistState extends Equatable {
  const RepositorieslistState();

  @override
  List<Object> get props => [];
}

class RepositorieslistLoadingState extends RepositorieslistState {}

class RepositorieslistSuccessState extends RepositorieslistState {
  final List<ReposModel> repos;

  const RepositorieslistSuccessState(this.repos);
}
