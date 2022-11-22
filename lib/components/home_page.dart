// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String info = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController altura_controller = TextEditingController();
  TextEditingController peso_controller = TextEditingController();

  void resetFields() {
    peso_controller.text = '';
    altura_controller.text = '';
    setState(() {
      info = '';
      formKey = GlobalKey<FormState>();
    });
  }

  _calcular() {
    setState(() {
      double peso = double.parse(peso_controller.text);
      double altura = double.parse(altura_controller.text) / 100;
      double imc = peso / (altura * altura);

      if (imc < 18.6) {
        info = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        info = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        info = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        info = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        info = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calcule Seu IMC",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: resetFields,
            icon: const Icon(
              size: 32,
              Icons.refresh,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_outline,
                  size: 120.0, color: Colors.deepPurple),
              TextFormField(
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (KG):",
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  hintText: 'Digite o peso...',
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
                controller: peso_controller,
                maxLines: 1,
                maxLength: 3,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (CM):",
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  hintText: 'Digite a altura...',
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
                textAlign: TextAlign.left,
                maxLines: 1,
                maxLength: 3,
                style: Theme.of(context).textTheme.bodyText1,
                controller: altura_controller,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _calcular();
                    },
                    child: Text(
                      'Calcular IMC!',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[600],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Resultado: \n$info",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                  maxLines: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
