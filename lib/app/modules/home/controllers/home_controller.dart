import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedDate = Rxn<DateTime>();
  var selectedJenisKlaim = ''.obs;
  var detailPengajuan = ''.obs;
  var lampiranList = <Lampiran>[].obs;

  // Simpan semua pengajuan di memori
  var riwayatPengajuan = <Pengajuan>[].obs;

  final jenisKlaimList = ['Transport', 'Makan', 'Kesehatan', 'Lainnya'];

  void pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) selectedDate.value = picked;
  }

  void tambahLampiran(Lampiran lampiran) {
    lampiranList.add(lampiran);
  }

  void simpanPengajuan() {
    if (selectedDate.value == null ||
        selectedJenisKlaim.value.isEmpty ||
        detailPengajuan.value.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Lengkapi semua data pengajuan',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    riwayatPengajuan.add(
      Pengajuan(
        tanggal: selectedDate.value!,
        jenisKlaim: selectedJenisKlaim.value,
        detail: detailPengajuan.value,
        lampiran: lampiranList.toList(),
      ),
    );

    // Reset form
    selectedDate.value = null;
    selectedJenisKlaim.value = '';
    detailPengajuan.value = '';
    lampiranList.clear();

    Get.snackbar(
      'Berhasil',
      'Pengajuan disimpan',
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }
}

// ===================== MODEL =====================
class Lampiran {
  final List<File> buktiFoto;
  final String nominal;
  final String keterangan;

  Lampiran({
    required this.buktiFoto,
    required this.nominal,
    required this.keterangan,
  });
}

class Pengajuan {
  final DateTime tanggal;
  final String jenisKlaim;
  final String detail;
  final List<Lampiran> lampiran;

  Pengajuan({
    required this.tanggal,
    required this.jenisKlaim,
    required this.detail,
    required this.lampiran,
  });
}
