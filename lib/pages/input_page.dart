// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'result_page.dart';
import '../utils/theme.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String? _selectedCategory;

  final List<String> _categories = [
    'Anak-anak',
    'Remaja',
    'Dewasa',
  ];

  String _selectedGender = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Padding(
            padding: EdgeInsets.all(16),

            child: Column(
              children: [

                // Header
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),

                  decoration: BoxDecoration(

                  gradient: const LinearGradient(
                    colors: [
                      lightBlue,
                      tosca,
                      darkBlue,
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                    borderRadius: BorderRadius.circular(25),

                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Column(
                    children: const [

                      Text(
                        "Kalkulator BMI",

                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Pantau kesehatanmu dalam hitungan detik",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(221, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Nama
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon isi data ini';
                    }
                    return null;
                  },

                  controller: _nameController,

                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    hintText: 'Masukkan nama...',
                    prefixIcon: Icon(Icons.person),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  textCapitalization: TextCapitalization.words,
                ),

                SizedBox(height: 30),

                // Berat dan Tinggi Badan
                Row(
                  children: [

                    // Berat Badan
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Berat Badan",

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 10),

                          TextFormField(
                            controller: _weightController,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Isi BB';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.number,

                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],

                            decoration: InputDecoration(
                              hintText: '0',
                              suffixText: 'kg',

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 20,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 15),

                    // Tinggi Badan
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Tinggi Badan",

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 10),

                          TextFormField(
                            controller: _heightController,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Isi TB';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.number,

                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],

                            decoration: InputDecoration(
                              hintText: '0',
                              suffixText: 'cm',

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 20,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Dropdown usia
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon isi data ini';
                    }
                    return null;
                  },

                  value: _selectedCategory,

                  decoration: InputDecoration(
                    labelText: 'Kategori Usia',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  hint: Text('Pilih kategori...'),

                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),

                SizedBox(height: 30),

                // Jenis kelamin
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Jenis Kelamin",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [

                        // Laki-laki
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Laki-laki';
                              });
                            },

                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),

                              decoration: BoxDecoration(
                                color: _selectedGender == 'Laki-laki'
                                    ? Colors.blue.shade100
                                    : Colors.white,

                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Column(
                                children: const [

                                  Icon(
                                    Icons.male,
                                    size: 50,
                                    color: Color.fromARGB(255, 68, 172, 255),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    "Laki-laki",

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 15),

                        // Perempuan
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Perempuan';
                              });
                            },

                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),

                              decoration: BoxDecoration(
                                color: _selectedGender == 'Perempuan'
                                    ? Colors.pink.shade100
                                    : Colors.white,

                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Column(
                                children: const [

                                  Icon(
                                    Icons.female,
                                    size: 50,
                                    color: Color.fromARGB(255, 255, 64, 129),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    "Perempuan",

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Button
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {

                      final nama = _nameController.text;

                      final berat =
                          double.parse(_weightController.text);

                      final tinggi =
                          double.parse(_heightController.text) / 100;

                      final bmi =
                          berat / (tinggi * tinggi);

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            nama: nama,
                            bmi: bmi,
                            gender: _selectedGender,
                            kategori: _selectedCategory!,
                          ),
                        ),
                      );
                    }
                  },

                  child: Container(
                    margin: EdgeInsets.only(top: 30),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),

                      gradient: const LinearGradient(
                        colors: [
                          darkBlue,
                          tosca,
                        ],

                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),

                    width: 350,
                    height: 70,

                    child: Center(
                      child: Text(
                        "Hitung BMI",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}