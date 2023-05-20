import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:uniclima/constants/api_constants.dart';
import 'package:uniclima/model/clima_model.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> _cidades = [
    'Aracajú',
    'Belém',
    'Belo Horizonte',
    'Boa Vista',
    'Brasília',
    'Campo Grande',
    'Cuiabá',
    'Curitiba',
    'Florianópolis',
    'Fortaleza',
    'Goiânia',
    'João Pessoa',
    'Macapá',
    'Maceió',
    'Manaus',
    'Natal',
    'Palmas',
    'Porto Alegre',
    'Porto Velho',
    'Recife',
    'Rio Branco',
    'Rio de Janeiro',
    'Salvador',
    'São Luís',
    'São Paulo',
    'Teresina',
    'Vitória'
  ];

  String _cidadeSelecionada = 'São Paulo';
  late ClimaModel climaModel;

  carregaClima() async {
    final params= {
      'q': _cidadeSelecionada,
      'appind': ApiConstants.apiKey,
      'units': ApiConstants.units,
      'lang': ApiConstants.long
    };

    final climaResponse
    = await http.get(Uri.http(ApiConstants.apiUrl, ApiConstants.weatherPath, params));

    if(climaResponse.statusCode == 200){
      ClimaModel.fromJson(jsonDecode(climaResponse.body));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(_cidadeSelecionada),
            centerTitle: true
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                    children: [
                      DropdownSearch<String>(
                          items: _cidades,
                          selectedItem: _cidadeSelecionada,
                          popupProps: const PopupProps.menu(),
                          onChanged: (value) {
                            setState(() {
                              _cidadeSelecionada = value!;
                            });
                          }
                      )
                    ]
                )
            )
        )
    );
  }
}