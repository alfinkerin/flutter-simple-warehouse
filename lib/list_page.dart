import 'package:app_gudang_demo/item_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {
  Future<void> showInfomationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          CollectionReference stocks = firestore.collection('stocks');
          final TextEditingController _namaBarang = TextEditingController();
          final TextEditingController _jenisBarang = TextEditingController();
          final TextEditingController _statusBarang = TextEditingController();
          final TextEditingController _jumlahBarang = TextEditingController();
          return AlertDialog(
            content: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaBarang,
                    validator: (value) {
                      return value.isNotEmpty ? null : 'Invalid Field';
                    },
                    decoration: InputDecoration(hintText: 'Nama Produk'),
                  ),
                  TextFormField(
                    controller: _jenisBarang,
                    validator: (value) {
                      return value.isNotEmpty ? null : 'Invalid Field';
                    },
                    decoration: InputDecoration(hintText: 'Jenis Produk'),
                  ),
                  TextFormField(
                    controller: _statusBarang,
                    validator: (value) {
                      return value.isNotEmpty ? null : 'Invalid Field';
                    },
                    decoration: InputDecoration(hintText: 'Status Produk'),
                  ),
                  TextFormField(
                    controller: _jumlahBarang,
                    validator: (value) {
                      return value.isNotEmpty ? null : 'Invalid Field';
                    },
                    decoration: InputDecoration(hintText: 'Stock Produk'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    stocks.add({
                      'namaBarang': _namaBarang.text,
                      'jenisBarang': _jenisBarang.text,
                      'statusBarang': _statusBarang.text,
                      'jumlahBarang': int.tryParse(_jumlahBarang.text) ?? 0
                    });

                    _namaBarang.text = '';
                    _jenisBarang.text = '';
                    _statusBarang.text = '';
                    _jumlahBarang.text = '';

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: const Color(0xFF217481)),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _namaBarang = TextEditingController();
    final TextEditingController _jenisBarang = TextEditingController();
    final TextEditingController _statusBarang = TextEditingController();
    final TextEditingController _jumlahBarang = TextEditingController();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference stocks = firestore.collection('stocks');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Barang'),
        backgroundColor: const Color(0xFF217481),
        elevation: 4.0,
        leading: Icon(
          Icons.wb_auto,
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: stocks.snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data.docs
                      .map((e) => ItemCard(
                            e.data()['namaBarang'],
                            e.data()['jenisBarang'],
                            e.data()['statusBarang'],
                            e.data()['jumlahBarang'],
                            onUpdate: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Form(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: _namaBarang,
                                              validator: (value) {
                                                return value.isNotEmpty
                                                    ? null
                                                    : 'Invalid Field';
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Nama Produk'),
                                            ),
                                            TextFormField(
                                              controller: _jenisBarang,
                                              validator: (value) {
                                                return value.isNotEmpty
                                                    ? null
                                                    : 'Invalid Field';
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Jenis Produk'),
                                            ),
                                            TextFormField(
                                              controller: _statusBarang,
                                              validator: (value) {
                                                return value.isNotEmpty
                                                    ? null
                                                    : 'Invalid Field';
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Status Produk'),
                                            ),
                                            TextFormField(
                                              controller: _jumlahBarang,
                                              validator: (value) {
                                                return value.isNotEmpty
                                                    ? null
                                                    : 'Invalid Field';
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Stock Produk'),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              stocks.doc(e.id).update({
                                                'namaBarang': _namaBarang.text,
                                                'jenisBarang':
                                                    _jenisBarang.text,
                                                'statusBarang':
                                                    _statusBarang.text,
                                                'jumlahBarang': int.tryParse(
                                                        _jumlahBarang.text) ??
                                                    0
                                              });

                                              _namaBarang.text = '';
                                              _jenisBarang.text = '';
                                              _statusBarang.text = '';
                                              _jumlahBarang.text = '';

                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'update',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0,
                                                  color:
                                                      const Color(0xFF217481)),
                                            ))
                                      ],
                                    );
                                  });
                            },
                            onDelete: () {
                              stocks.doc(e.id).delete();
                            },
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_box,
        ),
        backgroundColor: const Color(0xFF217481),
        onPressed: () async {
          await showInfomationDialog(context);
        },
      ),
    );
  }
}
