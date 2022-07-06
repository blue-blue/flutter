import 'package:get/get.dart';
import 'package:template/main.dart';
import 'package:template/pages/adapter/adapter_page.dart';
import 'package:template/pages/balance/balance_page.dart';
import 'package:template/pages/language/language_page.dart';
import 'package:template/pages/stream/stream_page.dart';
import 'package:template/pages/stream/streamb_page.dart';
import 'package:template/router/routers.dart';

final routers = [
  GetPage(name: PublicPath.home, page: () => const HomePage()),
  GetPage(name: PublicPath.stream, page: () => const StreamPage()),
  GetPage(name: PublicPath.streamB, page: () => const StreamBPage()),
  GetPage(name: PublicPath.languagePage, page: () => const LanguagePage()),
  GetPage(name: PublicPath.balancePage, page: () => const BalancePage()),
  GetPage(name: PublicPath.adapterPage, page: () => const AdapterPage()),
];
