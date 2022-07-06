import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/main/main_bloc.dart';
import 'package:template/generated/l10n.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.language),
          ),
          body: Column(
            children: [
              TextButton(
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context)
                        .add(SetLanguage(locale: const Locale('en', '')));
                  },
                  child: const Text("English")),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context)
                        .add(SetLanguage(locale: const Locale('zh', '')));
                  },
                  child: const Text("中文")),
            ],
          ),
        );
      },
    );
  }
}
