import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:venturo_test/app/core/constants/app_colors.dart';
import 'package:venturo_test/app/core/widgets/custom_button.dart';
import 'package:venturo_test/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'widgets/lampiran_bottom_sheet.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final detailController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pengajuan Reimburse',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.blueColor,
          actions: [
            IconButton(
              icon: Icon(Icons.history, color: Colors.white),
              onPressed: () => Get.toNamed(Routes.RIWAYAT_PENGAJUAN),
            ),
            SizedBox(width: 12),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: CustomButton(
            title: 'Submit Request',
            onTap: controller.simpanPengajuan,
            bgColor: AppColors.blueColor,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Pengajuan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Tanggal'),
              GestureDetector(
                onTap: () => controller.pickDate(context),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.selectedDate.value == null
                              ? 'Pilih tanggal'
                              : controller.selectedDate.value.toString().split(
                                  ' ',
                                )[0],
                        ),
                        Icon(Icons.calendar_today_outlined, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Jenis Klaim'),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedJenisKlaim.value.isEmpty
                      ? null
                      : controller.selectedJenisKlaim.value,
                  hint: Text('Pilih jenis klaim'),
                  items: controller.jenisKlaimList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) =>
                      controller.selectedJenisKlaim.value = val ?? '',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Detail'),
              TextField(
                controller: detailController,
                onChanged: (val) => controller.detailPengajuan.value = val,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Masukkan detail pengajuan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Lampiran Bukti',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => openLampiranBottomSheet(context),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_outlined,
                          size: 32,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 8),
                        Text('Klik untuk upload file dan isi nominal'),
                        Text(
                          'PNG, JPG hingga 5MB',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(
                () => Column(
                  children: controller.lampiranList.map((lampiran) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(Icons.attach_file),
                        title: Text('Nominal: ${lampiran.nominal}'),
                        subtitle: Text(lampiran.keterangan),
                        trailing: Text('${lampiran.buktiFoto.length} foto'),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
