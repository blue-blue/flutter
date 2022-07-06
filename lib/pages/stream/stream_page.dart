import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/stream/stream_bloc.dart';

StreamController _broadcastController = StreamController.broadcast();

StreamController _streamController = StreamController();

class StreamPage extends StatefulWidget {
  const StreamPage({Key key}) : super(key: key);

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  StreamSubscription _streamSubscription1;
  StreamSubscription _streamSubscription2;

  StreamSubscription _streamSubscription3;

  @override
  void initState() {
    super.initState();
    _streamSubscription1 = _broadcastController.stream.listen((event) {
      debugPrint("=========订阅数据1。。。" + event);
    });
    _streamSubscription2 = _broadcastController.stream.listen((event) {
      debugPrint("=========订阅数据2。。。" + event);
    });
    _streamSubscription3 = _streamController.stream.listen((event) {
      debugPrint("=========订阅数据3。。。" + event);
    });
  }

  @override
  void dispose() {
    _streamSubscription1.cancel();
    _streamSubscription2.cancel();
    _streamSubscription3.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => StreamBloc(),
      child: BlocBuilder<StreamBloc, StreamState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Stream"),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                      onPressed: () =>
                          {_broadcastController.sink.add("event333333")},
                      child: const Text("广播")),
                  TextButton(
                      onPressed: () =>
                          {_streamController.sink.add("event333333")},
                      child: const Text("单订阅"))
                ],
              ));
        },
      ),
    );
  }
}

class StreamEvent extends StatefulWidget {
  const StreamEvent({Key key}) : super(key: key);

  @override
  State<StreamEvent> createState() => _StreamEventState();
}

class _StreamEventState extends State<StreamEvent> {
  @override
  void initState() {
    super.initState();
    _broadcastController.stream.listen((event) {
      debugPrint("=========订阅数据。。。" + event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: TextButton(
        onPressed: () => {},
        child: const Text("Stream事件"),
      ),
    );
  }
}
