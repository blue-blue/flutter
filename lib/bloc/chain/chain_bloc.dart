import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template/chain/ether.dart';
import 'package:template/chain/filecoin.dart';
import 'package:template/models/rpc_network.dart';

part 'chain_event.dart';

part 'chain_state.dart';

class ChainBloc extends Bloc<ChainEvent, ChainState> {
  ChainBloc() : super(ChainState.idle()) {
    on<BalanceEvent>(_balance);
  }

  _balance(BalanceEvent event, Emitter<ChainState> emit) async {
    final one = await Future.wait([
      Ether(RpcNetwork.binanceMainNet)
          .getBalance('0xE42b75Aa69b9ddfD9e43219AAa1ebb1094138877'),
      Filecoin(RpcNetwork.filecoinMainNet).getBalance(
          'f3qufps2iittxwcl3ai5cta5sprfo5gjf7x5yd33nfngewg7meovcalwzsxpdtsi4idg62qjvzptengpljssla')
    ]);

    try {
      emit(state.copy(etherBalance: one[0], filcoinBalance: one[1]));
    } catch (e) {}
  }
}
