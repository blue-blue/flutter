import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/stream/stream_bloc.dart';

class StreamBPage extends StatefulWidget {
  const StreamBPage({Key key}) : super(key: key);

  @override
  _StreamBPageState createState() => _StreamBPageState();
}

class _StreamBPageState extends State<StreamBPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamB'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () =>
                  {BlocProvider.of<StreamBloc>(context).add(StreamAddEvent())},
              child: const Text("修改数据"))
        ],
      ),
    );
  }
}
