import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'stream_event.dart';

part 'stream_state.dart';

class StreamBloc extends Bloc<StreamEvent, StreamState> {
  StreamBloc() : super(StreamInitial()) {
    on<StreamAddEvent>((event, emit) {
      emit(state.add());
    });
  }
}
