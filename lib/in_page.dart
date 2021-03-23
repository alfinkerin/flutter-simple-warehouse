import 'package:app_gudang_demo/item_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IncomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference stocks = firestore.collection('stocks');
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang Masuk'),
        backgroundColor: const Color(0xFF217481),
        elevation: 4.0,
        leading: Icon(
          Icons.wb_auto,
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream:
                stocks.where('statusBarang', isEqualTo: 'masuk').snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data.docs
                      .map((e) => ItemCard2(
                            e.data()['namaBarang'],
                            e.data()['jenisBarang'],
                            e.data()['statusBarang'],
                            e.data()['jumlahBarang'],
                          ))
                      .toList(),
                );
              } else {
                return Text('LOADING');
              }
            },
          )
        ],
      ),
    );
  }
}
