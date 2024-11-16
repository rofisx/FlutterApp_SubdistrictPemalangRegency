import 'package:flutter/material.dart';
import 'package:submission_project/data.dart';
import 'package:submission_project/detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const MainScreenMobile(
              gridCount: 2,
              headerTitle: 16,
              titlesizeFont: 14,
            );
          } else if (constraints.maxWidth <= 1200) {
            return const MainScreenMobile(
              gridCount: 3, headerTitle: 22,titlesizeFont: 18);
          } else {
            return const MainScreenMobile(
              gridCount: 4, headerTitle: 30,titlesizeFont: 20);
          }
        });        
  }
}

class MainScreenMobile extends StatelessWidget {
  final int gridCount;
  final double headerTitle, titlesizeFont;
  const MainScreenMobile(
      {required this.gridCount,
      required this.headerTitle,
      required this.titlesizeFont,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peta Kecamatan Di Kabupaten Pemalang',
          style: TextStyle(fontSize: headerTitle, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10),
        itemCount: subdistrictList.length,
        itemBuilder: (context, index) {
          Subdistrict data = subdistrictList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(subdistrict: data)));
            },
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200.0,
                      child: Image(
                        image: AssetImage(data.imageAsset),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data.nama,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: titlesizeFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
