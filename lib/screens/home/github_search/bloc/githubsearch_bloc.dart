import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/transformers.dart';

part 'githubsearch_event.dart';
part 'githubsearch_state.dart';

class GithubsearchBloc extends Bloc<GithubsearchEvent, GithubsearchState> {
  late final TextEditingController _textEditingController;

  TextEditingController get textEditingController => _textEditingController;
  void createBadState() {
    emit(GithubsearchErrorState());
  }

  GithubsearchBloc() : super(GithubsearchSearchState()) {
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      add(GithubsearchSearchedEvent());
    });

    on<GithubsearchSearchedEvent>(
      (event, emit) {
        emit(GithubsearchSearchState(textEditingController.text));
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 300))
          .asyncExpand(mapper),
    );
    on<GithubsearchCrashedEvent>(
      (event, emit) {
        emit(GithubsearchErrorState());
      },
    );
  }
}
