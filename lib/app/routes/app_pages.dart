import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/riwayat_pengajuan/bindings/riwayat_pengajuan_binding.dart';
import '../modules/riwayat_pengajuan/views/riwayat_pengajuan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PENGAJUAN,
      page: () => const RiwayatPengajuanView(),
      binding: RiwayatPengajuanBinding(),
    ),
  ];
}
