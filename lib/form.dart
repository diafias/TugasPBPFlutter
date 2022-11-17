import 'package:diah/drawer.dart';
import 'package:diah/main.dart';
import 'package:diah/budget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyFormPage());
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  List<Budget> _budget = [];
  final _formKey = GlobalKey<FormState>();
  String _namaLengkap = "";
  String _pilihan = "";
  String _jenis = 'Pemasukan';
  List<String> listKelasPBP = ['Pemasukan', 'Pengeluaran'];

  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        drawer: MyDrawer(
          theBudget: _budget,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Judul",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _namaLengkap = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _namaLengkap = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nominal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _pilihan = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _pilihan = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton(
                          value: _jenis,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listKelasPBP.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Center(
                                child: Text(items),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _jenis = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Text(_date == null
                      ? 'Nothing has been picked yet'
                      : _date.toString()),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          ).then((value) {
                            setState(() {
                              _date = value;
                            });
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          child: Text('Pilih Tanggal'),
                        )),
                  ),
                  TextButton(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Text('Simpan'),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          String tanggal = _date.toString();
                          tanggal = tanggal.substring(0, 10);
                          Budget newBudget =
                              Budget(_namaLengkap, _pilihan, _jenis, tanggal);
                          _budget.add(newBudget);
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              String tanggal = _date.toString();
                              tanggal = tanggal.substring(0, 10);
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Container(
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Center(
                                          child: const Text('Informasi Data')),
                                      SizedBox(height: 20),
                                      Center(
                                          child: Column(
                                        children: [
                                          Text('Judul : ' + _namaLengkap),
                                          Text('Nominal : ' + _pilihan),
                                          Text('Jenis : ' + _jenis),
                                          Text('Tanggal : ' + _date.toString())
                                        ],
                                      )),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
