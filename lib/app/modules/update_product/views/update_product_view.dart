import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateProductView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNpm.text = data['npm'].toString();
            controller.cNama.text = data['name'];
            controller.cAlamat.text = data['alamat'];
            controller.cJk.text = data['jk'];
            controller.cProgamStudi.text = data['npm'];
          return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
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
              onPressed: () => controller.updateProduct(
                controller.cNpm.text,
                controller.cNama.text,
                controller.cAlamat.text,
                controller.cJk.text,
                controller.cProgamStudi.text,
                Get.arguments,
              ), 
              child: Text("Ubah")),
          ],
        ),
      );  
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },

        )
    );
  }
}
