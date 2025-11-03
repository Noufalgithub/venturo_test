import 'lapiran_model.dart';

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
