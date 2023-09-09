import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cJk;
  late TextEditingController cProgamStudi;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<DocumentSnapshot<Object?>> getData(String id) async {
  DocumentReference docRef = firestore.collection("products").doc(id);

  return docRef.get();
}

void updateProduct(String npm, String nama, String alamat, String jk, String progamstudi, String id) async {
  DocumentReference productById = firestore.collection("products").doc(id);

  try {
    await productById.update({
      "npm": npm,
      "name": nama,
      "alamat":alamat,
      "jenis kelamin":jk,
      "progam studi": progamstudi,
    });

  Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil Mengubah data.",
      onConfirm: () {
        cNpm.clear();
        cNama.clear();
        cAlamat.clear();
        cJk.clear();
        cProgamStudi.clear();
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        Get.back();
      },
      textConfirm: "OK",
    );
  } catch (e) {
    print(e);
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      middleText: "Gagal Menambahkan data.",
    );
  }
}

  @override
  void onInit() {
    cAlamat.dispose();
    cJk.dispose();
    cNama.dispose();
    cNpm.dispose();
    cProgamStudi.dispose();
    super.onInit();
  }

  @override
  void onClose() {
    cAlamat.dispose();
    cJk.dispose();
    cNama.dispose();
    cNpm.dispose();
    cProgamStudi.dispose();
    super.onClose();
  }
}
