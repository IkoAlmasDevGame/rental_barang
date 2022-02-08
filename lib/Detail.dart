import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  final String ImageBarang;
  final String namabarang;
  final String merekbarang;

  detail({required this.ImageBarang, required this.namabarang, required this.merekbarang});

  @override
  _detailState createState() => _detailState();
}

class _detailState extends State<detail> {
  final _PinjamanTextBoxController = TextEditingController();

  var HomePage = 'Detail Barang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage,
          style: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, style: BorderStyle.solid, color: Colors.black54),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Image.asset(widget.ImageBarang, fit: BoxFit.contain,),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Divider(height: 1.1, color: Colors.black54, thickness: 1.5),
              Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                child: Text('Nama Barang : ${widget.namabarang}',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              SizedBox(
                child: Text('Merek Barang : ${widget.merekbarang}',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              _TextBoxPinjaman(),
              _tombolPinjaman(),
            ],
          ),
        ),
      ),
    );
  }

  _TextBoxPinjaman(){
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.format_list_numbered_outlined),
        labelText: 'Masukkan Jumlah Hari :',
        hintText: 'Masukkan Angka untuk peminjaman barang',
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.2),
      ),
      keyboardType: TextInputType.number,
      controller: _PinjamanTextBoxController,
    );
  }

  _tombolPinjaman(){
    return Padding(padding: EdgeInsets.only(top: 45),
      child: Center(
        child: TextButton(
          child: Text('Peminjaman OKE',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
      ),
        onPressed: (){
            setState(() {
              _showDialogView();
            });
          },
        ),
      ),
    );
  }
  
  _showDialogView(){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: Text('Pinjaman Anda', style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(widget.ImageBarang.toString(), fit: BoxFit.contain, alignment: Alignment.center,),
                  Padding(padding: EdgeInsets.only(top: 5.0),
                   child: Text('Nama Barang yang dipinjam : ${widget.namabarang.toString()}',
                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                     textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0),
                   child: Text('Merek Barang yang dipinjam : ${widget.merekbarang.toString()}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0,),
                    child: Text('Jumlah hari yang dipinjam  : ${int.parse(_PinjamanTextBoxController.text)}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text('OKE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
