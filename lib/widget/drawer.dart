import 'dart:html';

import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/pages/watchlist.dart';
import 'package:counter_7/pages/budgetForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';

class DrawerClass extends StatelessWidget {
  DrawerClass(this.currentPage);
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              // Route menu ke halaman utama

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyDataPage(list: MyFormPage.listDataBudget)),
              );
            },
          ),
          ListTile(
            title: const Text('Watchlist'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WatchListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
