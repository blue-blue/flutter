import 'package:template/models/chain_gas.dart';
import 'package:template/models/rpc_network.dart';
import 'package:template/models/token.dart';

abstract class ChainProvider {
  RpcNetwork network;

  Future<String> getBalance(String address);

  Future<String> sendTransaction({
    String to,
    String amount,
    String private,
    ChainGas gas,
    int nonce,
  });

  Future<ChainGas> getGas({String to, bool isToken = false, Token token});

  Future<int> getNonce();

  ChainGas replaceGas(ChainGas gas, {String chainPremium});

  void dispose();
}
