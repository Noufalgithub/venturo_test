import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:venturo_test/app/modules/home/controllers/home_controller.dart';
import 'package:venturo_test/app/routes/app_pages.dart';
import 'package:venturo_test/app/views/views/detail_riwayat_pengajuan_view.dart';

import '../controllers/riwayat_pengajuan_controller.dart';

class RiwayatPengajuanView extends GetView<RiwayatPengajuanController> {
  const RiwayatPengajuanView({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Pengajuan')),
      body: Obx(() {
        if (homeController.riwayatPengajuan.isEmpty) {
          return Center(child: Text('Belum ada pengajuan'));
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: homeController.riwayatPengajuan.length,
          itemBuilder: (_, i) {
            final item = homeController.riwayatPengajuan[i];
            return Card(
              margin: EdgeInsets.only(bottom: 12),
              color: Colors.white,
              child: ListTile(
                title: Text(item.jenisKlaim),
                subtitle: Text(
                  '${item.tanggal.toString().split(' ')[0]} - ${item.detail}',
                ),
                trailing: Text('${item.lampiran.length} lampiran'),
                onTap: () => Get.to(DetailRiwayatPengajuanView(item)),
              ),
            );
          },
        );
      }),
    );
  }
}
