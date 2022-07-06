import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/chain/chain_bloc.dart';
import 'package:template/generated/l10n.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({Key key}) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChainBloc()..add(BalanceEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.balance),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Textview(),
          ],
        ),
      ),
    );
  }
}

class Textview extends StatefulWidget {
  const Textview({Key key}) : super(key: key);

  @override
  State<Textview> createState() => _TextviewState();
}

class _TextviewState extends State<Textview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChainBloc, ChainState>(builder: (ctx, state) {
      return Column(
        children: [
          Text("FIL: ${state.filcoinBalance}"),
          Text("BNB: ${state.etherBalance}"),
        ],
      );
    });
  }
}
