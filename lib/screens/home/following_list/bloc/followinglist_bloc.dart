import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sputnik_test_app/models/following_model.dart';
import 'package:sputnik_test_app/services/api.dart';

part 'followinglist_event.dart';
part 'followinglist_state.dart';

class FollowinglistBloc extends Bloc<FollowinglistEvent, FollowinglistState> {
  FollowinglistBloc() : super(FollowinglistLoadingState()) {
    on<FollowinglistInitialEvent>((event, emit) async {
      var resp = await API().getFollowing();

      emit(FollowinglistSuccessState(resp));
    });
  }
}
