part of 'chain_bloc.dart';

class ChainState extends Equatable {
  final String etherBalance;
  final String filcoinBalance;

  const ChainState({this.etherBalance, this.filcoinBalance});

  @override
  List<Object> get props => [etherBalance, filcoinBalance];

  factory ChainState.idle() {
    return const ChainState(
      etherBalance: '0',
      filcoinBalance: '0',
    );
  }

  ChainState copy({String etherBalance, String filcoinBalance}) {
    return ChainState(
      etherBalance: etherBalance ?? this.etherBalance,
      filcoinBalance: filcoinBalance ?? this.filcoinBalance,
    );
  }
}
