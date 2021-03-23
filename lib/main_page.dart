import 'package:app_gudang_demo/auth_services.dart';
import 'package:app_gudang_demo/in_page.dart';
import 'package:app_gudang_demo/list_page.dart';
import 'package:app_gudang_demo/main.dart';
import 'package:app_gudang_demo/out_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final User user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
        backgroundColor: const Color(0xFF217481),
        elevation: 4.0,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await AuthServices.signOut();
              })
        ],
        leading: Icon(
          Icons.wb_auto,
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        padding: EdgeInsets.all(30),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            // MyApp()
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListPage();
                  }));
                },
                splashColor: Colors.grey[800],
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.library_books,
                        size: 70.0,
                        color: Colors.grey,
                      ),
                      Text(
                        'Stock Barang',
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return IncomePage();
                  }));
                },
                splashColor: Colors.grey[800],
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.input_sharp,
                        size: 70.0,
                        color: Colors.blue,
                      ),
                      Text(
                        'List Barang Masuk',
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OutPage();
                  }));
                },
                splashColor: Colors.grey[800],
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.outbond_sharp,
                        size: 70.0,
                        color: Colors.red,
                      ),
                      Text(
                        'List Barang Keluar',
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyMenu extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final MaterialColor warna;

//   MyMenu({
//     this.title,
//     this.icon,
//     this.warna,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return ListPage();
//           }));
//         },
//         splashColor: Colors.grey[800],
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Icon(
//                 icon,
//                 size: 70.0,
//                 color: warna,
//               ),
//               Text(
//                 title,
//                 style: new TextStyle(fontSize: 17.0),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
