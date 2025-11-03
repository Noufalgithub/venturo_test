import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class DetailRiwayatPengajuanView extends GetView {
  const DetailRiwayatPengajuanView(this.pengajuan, {super.key});

  final Pengajuan pengajuan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Tanggal: ${pengajuan.tanggal.toString().split(' ')[0]}'),
            Text('Jenis Klaim: ${pengajuan.jenisKlaim}'),
            Text('Detail: ${pengajuan.detail}'),
            SizedBox(height: 16),
            Text('Lampiran:', style: TextStyle(fontWeight: FontWeight.bold)),
            for (var l in pengajuan.lampiran)
              Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text('Nominal: ${l.nominal}'),
                  subtitle: Text(l.keterangan),
                  trailing: Text('${l.buktiFoto.length} foto'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
