part of 'stream_bloc.dart';

class StreamState extends Equatable {
  final int stream;

  const StreamState({this.stream});

  StreamState add() {
    return StreamState(stream: stream + 1);
  }

  @override
  List<Object> get props => [stream];
}

class StreamInitial extends StreamState {
  @override
  List<Object> get props => [];
}
