import 'package:belajar_flutter/ui/product_detail.dart';
import 'package:belajar_flutter/ui/product_form.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String kodeProdukAdd;
  final String namaProdukAdd;
  final int hargaAdd;

  const ProductPage(
      {Key key, this.kodeProdukAdd, this.namaProdukAdd, this.hargaAdd})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> listNamaProduk = <String>['Kulkas', 'TV', 'Mesin Cuci'];
  final List<String> listKodeProduk = <String>['A001', 'A002', 'A003'];
  final List<int> listHargaProduk = <int>[2500000, 5000000, 1500000];

  addItemtoList() {
    if (widget.namaProdukAdd != null) listNamaProduk.add(widget.namaProdukAdd);
    if (widget.kodeProdukAdd != null) listKodeProduk.add(widget.kodeProdukAdd);
    if (widget.hargaAdd != 0) listHargaProduk.add(widget.hargaAdd);
  }

  @override
  Widget build(BuildContext context) {
    addItemtoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Produk"),
        actions: [
          GestureDetector(
            child: Icon(Icons.add),
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductForm()));
            },
          )
        ],
      ),
      // body: ListView(
      //   children: [
      //     ItemProduk(
      //       kodeProduk: 'A001',
      //       namaProduk: 'Kulkas',
      //       harga: 2500000,
      //     ),
      //     ItemProduk(
      //       kodeProduk: 'A002',
      //       namaProduk: 'TV',
      //       harga: 5000000,
      //     ),
      //     ItemProduk(
      //       kodeProduk: 'A003',
      //       namaProduk: 'Mesin Cuci',
      //       harga: 1500000,
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ItemProduk(
            namaProduk: listNamaProduk[index],
            kodeProduk: listKodeProduk[index],
            harga: listHargaProduk[index],
          );
        },
        itemCount: listNamaProduk.length,
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String kodeProduk;
  final String namaProduk;
  final int harga;
  const ItemProduk({Key key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaProduk.toString()),
          subtitle: Text(harga.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      kodeProduk: kodeProduk,
                      namaProduk: namaProduk,
                      harga: harga,
                    )));
      },
    );
  }
}
