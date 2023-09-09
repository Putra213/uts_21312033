import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Produk"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNpm,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Npm"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cAlamat,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Alamat"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cJk,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Jenis Kelamin"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cProgamStudi,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Progam Studi"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.cNpm.text,
                controller.cNama.text,
                controller.cAlamat.text,
                controller.cJk.text,
                controller.cProgamStudi.text,
              ), 
              child: Text("Simpan")),
          ],
        ),
      ),
    );
  }
}