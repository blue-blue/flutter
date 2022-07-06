import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/chain/ether.dart';
import 'package:template/chain/filecoin.dart';
import 'package:template/data/storage_manager.dart';
import 'package:template/generated/l10n.dart';
import 'package:template/models/rpc_network.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.idle()) {
    on<TestEvent>((event, emit) async {
      if (event.time == 2) {
        emit(state.copy(count: 2));
      } else {
        await Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          emit(state.copy(count: 1));
        });
      }
    });

    on<AppOpen>(_appOpen);

    on<SetLanguage>(_setLanguage);
  }

  _appOpen(AppOpen event, Emitter<MainState> emit) {
    S.load(StorageManager.getLocal());
    emit(state.local(locale: StorageManager.getLocal()));
  }

  _setLanguage(SetLanguage event, Emitter<MainState> emit) async {
    debugPrint(event.locale.languageCode);

    try {
      await StorageManager.setLocal(event.locale);
      S.load(event.locale);
      emit(state.local(locale: StorageManager.getLocal()));
    } catch (e) {
      debugPrint(jsonEncode(e));
    }
  }
}
