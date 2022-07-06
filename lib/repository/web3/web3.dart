import 'package:flutter/cupertino.dart';
import 'package:template/repository/web3/json_rpc.dart';
import 'package:template/repository/web3/rpc_http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as https;

class Web3 {
  Web3Client client;

  factory Web3(String url) {
    return Web3._().._init(url);
  }

  Web3._();

  _init(String url) {
    debugPrint("Web3: " + url);
    client = Web3Client.custom(RpcJson(url,rpcHttp));
    //
    // client = Web3Client(url, https.Client());

  }
}
