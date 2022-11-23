import 'package:flutter/material.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
  static List<List<Object>> listDataBudget = _MyFormPageState.data;
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  // simpen data ke list
  static List<List<Object>> data = [];

  String _judul = "";

  int nominal = 0;

  String? jenisBudget = null;
  List<String> listJenis = ["Pemasukan", "Pengeluaran"];
  List<Object> dataBudget = [];

  List<List<Object>> _getList() {
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 212, 155, 255),
        title: const Text(
          'Budget Form',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: DrawerClass('Budget Form'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Tiket JGTC",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
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
                      hintText: "Contoh: 100000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String value) {
                      setState(() {
                        nominal = int.tryParse(value)!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.tryParse(value!)!;
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
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: jenisBudget,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text(
                      "Pilih Jenis",
                    ),
                    items: listJenis.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenisBudget = newValue!;
                      });
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 93, 24, 212)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      dataBudget.add(_judul);
                      dataBudget.add(nominal);
                      dataBudget.add(jenisBudget!);
                      data.add(dataBudget);
                      //reset
                      dataBudget = [];
                      _passDataBudget(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _passDataBudget(BuildContext context) {
    var dataToSend = data;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyDataPage(
                  list: dataToSend,
                )));
  }
}

class MyDataPage extends StatelessWidget {
  final list;
  MyDataPage({super.key, @required this.list});

  @override
  Widget build(BuildContext context) {
    // final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 212, 155, 255),
          title: const Text(
            'Data Budget',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ),
        drawer: DrawerClass('Data Budget'),
        body: SafeArea(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => Card(
                    shadowColor: Color.fromARGB(255, 88, 52, 127),
                    elevation: 6,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(list[index][0]),
                      subtitle: Text('${list[index][1]}'),
                      trailing: Text(list[index][2]),
                    ),
                  )),
        ));
  }
}
