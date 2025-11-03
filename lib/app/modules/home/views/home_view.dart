import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Pengajuan Reimburse'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: CustomButton(
            title: 'Submit Request',
            onTap: () {},
            bgColor: AppColors.blueColor,
          ),
        ),
        body: ListView(
          children: [
            DetailPengajuan(),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.lineColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lampiran Bukti',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      elevation: 6,
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'Bukti dan Nominal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Text(
                                    'Bukti Foto',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 26,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.lineColor,
                                      ),
                                    ),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  CustomTextField(
                                    hintText: 'Masukkan nominal disini',
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                              Text(
                                'Klik untuk upload file dan isi nominal',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'PNG, JPG hingga 5MB',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPengajuan extends StatelessWidget {
  const DetailPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lineColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Pengajuan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Pilih tanggal',
            onTap: () {},
            suffixIcon: Icon(Icons.calendar_month_outlined),
          ),
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Pilih jenis klaim',
            onTap: () {},
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Masukkan detail pengajuan',
            onTap: () {},
            maxLine: 4,
          ),
        ],
      ),
    );
  }
}
