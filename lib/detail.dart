import 'package:flutter/material.dart';
import 'package:submission_project/data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.subdistrict});
  final Subdistrict subdistrict;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if(constraints.maxWidth > 800){
        return DetailWebSubdistrict(subdistrict:subdistrict,titleFont: 22,contentFont: 18,);
      }else{
        return DetailMobileSubdistrict(subdistrict:subdistrict);
      }
    });
  }
}

class DetailMobileSubdistrict extends StatelessWidget {
  final Subdistrict subdistrict;
  const DetailMobileSubdistrict({required this.subdistrict,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage(subdistrict.imageAsset),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kecamatan ${subdistrict.nama}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const FavoriteButton(),
                  ],
                ),
              ),
              const PhysicalModel(
                color: Colors.grey, // Line color
                shadowColor: Colors.black, // Shadow color
                elevation: 2.0, // Elevation level
                child: SizedBox(
                  height: 1.0, // Thickness of the line
                  width: double.infinity, // Full width of the parent
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(5),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(8)
                  },
                  children: [
                    TableRow(children: [
                      const Text("Luas Wilayah"),
                      const Text(":"),
                      Text(subdistrict.luasWilayah)
                    ]),
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        children: [
                          const Text("Jumlah Penduduk"),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(":"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(subdistrict.jumlahPenduduk),
                          )
                        ]),
                    TableRow(children: [
                      const Text("Total Desa"),
                      const Text(":"),
                      Text(subdistrict.jumlahDesa)
                    ]),
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        children: [
                          const Text("Geografis"),
                          const Text(":"),
                          Text(subdistrict.detailGeografi)
                        ]),
                    TableRow(children: [
                      const Text("Batas Wilayah"),
                      const Text(":"),
                      Text(subdistrict.batasWilayah)
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailWebSubdistrict extends StatefulWidget {
  final Subdistrict subdistrict;
  final double titleFont, contentFont;
  const DetailWebSubdistrict({required this.subdistrict, 
  required this.titleFont, required this.contentFont,super.key});

  @override
  State<DetailWebSubdistrict> createState() => _DetailWebSubdistrictState();
}

class _DetailWebSubdistrictState extends State<DetailWebSubdistrict> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16,0,16,20),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,10),
                  child: Image(
                    image: AssetImage(widget.subdistrict.imageAsset),
                    fit: BoxFit.fill
                    ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16,5,16,5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Kecamatan ${widget.subdistrict.nama}',
                            style: TextStyle(fontSize: widget.titleFont,fontWeight: FontWeight.bold),),
                            const FavoriteButton(),
                          ],
                        ),
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(5),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(8)
                          },
                          children: [
                            TableRow(children: [
                              Text("Luas Wilayah",style: TextStyle(fontSize: widget.contentFont),),
                              Text(":",style: TextStyle(fontSize: widget.contentFont)),
                              Text(widget.subdistrict.luasWilayah,style: TextStyle(fontSize: widget.contentFont))
                            ]),
                            TableRow(
                                decoration: BoxDecoration(color: Colors.grey[300]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text("Jumlah Penduduk",style: TextStyle(fontSize: widget.contentFont)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(":"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(widget.subdistrict.jumlahPenduduk,style: TextStyle(fontSize: widget.contentFont)),
                                  )
                                ]),
                            TableRow(children: [
                              Text("Total Desa",style: TextStyle(fontSize: widget.contentFont)),
                              Text(":",style: TextStyle(fontSize: widget.contentFont)),
                              Text(widget.subdistrict.jumlahDesa, style: TextStyle(fontSize: widget.contentFont))
                            ]),
                            TableRow(
                                decoration: BoxDecoration(color: Colors.grey[300]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text("Geografis",style: TextStyle(fontSize: widget.contentFont)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(":",style: TextStyle(fontSize: widget.contentFont)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(widget.subdistrict.detailGeografi,style: TextStyle(fontSize: widget.contentFont)),
                                  )
                                ]),
                            TableRow(children: [
                              Text("Batas Wilayah",style: TextStyle(fontSize: widget.contentFont)),
                              Text(":",style: TextStyle(fontSize: widget.contentFont)),
                              Text(widget.subdistrict.batasWilayah,style: TextStyle(fontSize: widget.contentFont))
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
