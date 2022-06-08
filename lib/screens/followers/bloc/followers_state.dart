part of 'followers_bloc.dart';

abstract class FollowersState extends Equatable {
  const FollowersState();

  @override
  List<Object> get props => [];
}

class FollowersLoadingState extends FollowersState {}

class FollowersSuccessState extends FollowersState {
  final List<FollowersModel> followers;

  const FollowersSuccessState(this.followers);
}
