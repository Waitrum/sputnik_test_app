part of 'followinglist_bloc.dart';

abstract class FollowinglistState extends Equatable {
  const FollowinglistState();

  @override
  List<Object> get props => [];
}

class FollowinglistLoadingState extends FollowinglistState {}

class FollowinglistSuccessState extends FollowinglistState {
  final List<FollowingModel> followings;

  const FollowinglistSuccessState(this.followings);
}

class FollowinglistErrorState extends FollowinglistState {}
