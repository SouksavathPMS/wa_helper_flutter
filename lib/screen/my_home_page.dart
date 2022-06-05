// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart'; // import 'package:intl_phone_field/intl_phone_field.dart';

import '../custom/custom_package/intl_phone_field.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  String initialCountryCode = 'LA';
  String? userText;
  String? userPhoneNum;

  final _text = TextEditingController();

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _text.dispose();
    userText = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Image.asset(
                          'assets/images/wayha.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text('ແອັບຊ່ວຍສົ່ງ Whatsapp ໂດຍບໍ່ຕ້ອງບັນທຶກເບີ'),
                      const SizedBox(height: 25),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return initialCountryCode == 'LA'
                                        ? 'ກະລຸນາໃສ່ຂໍ້ຄວາມ'
                                        : 'Please enter some text';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    labelText: 'ຂໍ້ຄວາມທີ່ຕ້ອງການສົ່ງ',
                                    labelStyle: const TextStyle(fontSize: 14),
                                    prefixIcon:
                                        const Icon(Icons.chat_bubble, size: 20),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.red),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    hintText: "ຂໍ້ຄວາມທີ່ຕ້ອງການສົ່ງ",
                                    fillColor: Colors.white70),
                              ),
                              const SizedBox(height: 10),
                              IntlPhoneField(
                                flagsButtonMargin:
                                    const EdgeInsets.only(bottom: 2),
                                style: const TextStyle(fontSize: 15),
                                invalidNumberMessage: initialCountryCode == 'LA'
                                    ? 'ກະລຸນາໃສ່ໝາຍເລກໂທລະສັບໃຫ້ຖືກຕ້ອງ(ຂື້ນຕົ້ນດ້ວຍ20)'
                                    : 'Invalid Mobile Number',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                // ignore: deprecated_member_use
                                searchText: 'ຄົ້ນຫາປະເທດ',
                                initialCountryCode: initialCountryCode,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  isDense: true,
                                  labelStyle: const TextStyle(fontSize: 14),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  labelText: initialCountryCode != 'LA'
                                      ? 'Phone number'
                                      : 'ເບີໂທລະສັບ',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  hintText: initialCountryCode == 'LA'
                                      ? "20xxxxxxxx"
                                      : "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                                onChanged: (phone) {
                                  setState(() {
                                    userPhoneNum = phone.completeNumber;
                                  });
                                },
                                onTap: () {
                                  if (_text.text.isEmpty) {
                                    _formKey.currentState!.validate();
                                  }
                                },
                                onCountryChanged: (country) {
                                  setState(() {
                                    initialCountryCode = country.code;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Constants.wayhaColor,
                                      fixedSize: const Size(300, 100),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () async {
                                    if (_text.text.isEmpty) {
                                      _formKey.currentState!.validate();
                                    } else {
                                      // print(userPhoneNum);
                                      setState(() {
                                        userText = _text.text;
                                      });
                                      // print(userText);
                                      if (userText != null) {
                                        final Uri _url = Uri.parse(
                                            'https://api.whatsapp.com/send/?phone=$userPhoneNum&text=$userText&app_absent=0');
                                        _launchInBrowser(_url);
                                      }
                                    }
                                    // print(userText);
                                    // print(userPhoneNum);
                                  },
                                  icon: const Icon(Icons.send),
                                  label: const Text('Send to Whatsapp'),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Developed by Wayha Technology'),
            ],
          ),
        ),
      ),
    );
  }
}
