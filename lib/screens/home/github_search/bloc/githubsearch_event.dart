part of 'githubsearch_bloc.dart';

abstract class GithubsearchEvent extends Equatable {
  const GithubsearchEvent();

  @override
  List<Object> get props => [];
}

class GithubsearchSearchedEvent extends GithubsearchEvent {}

class GithubsearchCrashedEvent extends GithubsearchEvent {}
