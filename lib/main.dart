import 'package:dio_log/dio_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/bloc/chain/chain_bloc.dart';
import 'package:template/bloc/main/main_bloc.dart';
import 'package:template/data/storage_manager.dart';
import 'package:template/generated/l10n.dart';
import 'package:template/router/index.dart';
import 'package:template/router/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => MainBloc()..add(AppOpen())),
        ],
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return ScreenUtilInit(
                designSize: const Size(375, 667),
                builder: () {
                  return GetMaterialApp(
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    // locale: state.locale,
                    initialRoute: '/',
                    getPages: routers,
                    title: 'template',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    home: const HomePage(),
                  );
                });
          },
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.home),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [..._items()],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                {BlocProvider.of<MainBloc>(context).add(CoinEvent())},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  List<Widget> _items() {
    return [
      TextButton(
          onPressed: () => {Get.toNamed(PublicPath.stream)},
          child: const Text("stream")),
      TextButton(
          onPressed: () => {Get.toNamed(PublicPath.languagePage)},
          child: const Text("切换语言")),
      TextButton(
          onPressed: () => {Get.toNamed(PublicPath.balancePage)},
          child: Text(S.current.balance)),
      TextButton(
          onPressed: () => {Get.toNamed(PublicPath.adapterPage)},
          child: Text(S.of(context).adapter)),
    ];
  }
}
