import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController

  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cJk;
  late TextEditingController cProgamStudi;


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String npm, String nama, String alamat, String jk, String progamstudi) async {
    CollectionReference product = firestore.collection("products");

    try{
      await product.add({
        "npm": npm,
        "name": nama,
        "alamat":alamat,
        "jenis kelamin":jk,
        "progam studi": progamstudi,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhsil menyimpan data",
        onConfirm: () {
          cNpm.clear();
          cNama.clear();
          cAlamat.clear();
          cJk.clear();
          cProgamStudi.clear();
          Get.back();
          Get.back();
          textConfirm: "OK";
        },
      );
    }catch(e){

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cAlamat = TextEditingController();
    cJk = TextEditingController();
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cProgamStudi = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cAlamat.dispose();
    cJk.dispose();
    cNama.dispose();
    cNpm.dispose();
    cProgamStudi.dispose();
    super.onClose();
  }

  }

