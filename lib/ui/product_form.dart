import 'package:belajar_flutter/ui/product_page.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/ui/product_detail.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key key}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _kodeProdukTextBoxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxKodeProduk(),
            _textboxNamaProduk(),
            _textboxHargaProduk(),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textboxKodeProduk() {
    return TextField(
      decoration: InputDecoration(labelText: 'Kode Produk'),
      controller: _kodeProdukTextBoxController,
    );
  }

  _textboxNamaProduk() {
    return TextField(
        decoration: InputDecoration(labelText: "Nama Produk"),
        controller: _namaProdukTextboxController);
  }

  _textboxHargaProduk() {
    return TextField(
      decoration: InputDecoration(labelText: "Harga"),
      controller: _hargaProdukTextboxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          String kodeproduk = _kodeProdukTextBoxController.text;
          String namaproduk = _namaProdukTextboxController.text;
          int hargaproduk = int.parse(_hargaProdukTextboxController.text);

          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => ProductDetail(
          //           kodeProduk: kodeproduk,
          //           namaProduk: namaproduk,
          //           harga: hargaproduk,
          //         )));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductPage(
                    kodeProdukAdd: kodeproduk,
                    namaProdukAdd: namaproduk,
                    hargaAdd: hargaproduk,
                  )));
        },
        child: const Text('Simpan'));
  }
}
