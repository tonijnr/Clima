import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:uniclima/constants/api_constants.dart';
import 'package:uniclima/model/clima_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uniclima/model/geocoder_model.dart';

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
   late ClimaModel? climaModel;
   late Geocoder? geocoder;

   carregaGeocoder() async {
     final params = {'q': _cidadeSelecionada, 'appid': ApiConstants.apiKey};

     final geoResponse = await http
         .get(Uri.https(ApiConstants.apiUrl, ApiConstants.geocoderPath, params));

     if (geoResponse.statusCode == 200) {
       geocoder = Geocoder.fromJson(jsonDecode(geoResponse.body));
     }
   }

   carregaClima() async {

     await carregaGeocoder();

     if (geocoder != null) {
       final params = {
         'lat': geocoder!.lat.toString(),
         'lon': geocoder!.lon.toString(),
         'appid': ApiConstants.apiKey,
         'units': ApiConstants.units,
         'lang': ApiConstants.lang
       };

       final climaResponse = await http
           .get(Uri.https(ApiConstants.apiUrl, ApiConstants.weatherPath, params));

       if (climaResponse.statusCode == 200) {
         climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
       }
     }
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(title: Text(_cidadeSelecionada), centerTitle: true),
         body: Center(
             child: Padding(
                 padding: const EdgeInsets.all(8),
                 child: Column(children: [
                   DropdownSearch<String>(
                       items: _cidades,
                       selectedItem: _cidadeSelecionada,
                       popupProps: const PopupProps.menu(),
                       onChanged: (value) {
                         setState(() {
                           _cidadeSelecionada = value!;
                           carregaClima();
                         });
                       })
                 ]))));