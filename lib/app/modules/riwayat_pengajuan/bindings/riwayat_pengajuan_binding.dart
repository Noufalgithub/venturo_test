import 'package:get/get.dart';

import '../controllers/riwayat_pengajuan_controller.dart';

class RiwayatPengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPengajuanController>(
      () => RiwayatPengajuanController(),
    );
  }
}
