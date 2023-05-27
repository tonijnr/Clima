import 'package:flutter/material.dart';
import 'package:uniclima/model/clima_model.dart';
import 'package:uniclima/constants/text_constants.dart';

class ClimaWidget extends StatelessWidget {
  const ClimaWidget({Key? key, required this.climaModel}) : super(key: key);

  final ClimaModel climaModel;

  String primeiraMaiuscula(String s) =>
      '${s[0].toUpperCase()}${s.substring(1)}';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
            'https://openweathermap.org/img/wn/${climaModel.icone}@2x.png',
            fit: BoxFit.fill,
            width: 120),
        Text('${climaModel.temperatura.toStringAsFixed(0)}${TextConstants.cel}',
            style: const TextStyle(fontSize: 50)),
        Text(primeiraMaiuscula(climaModel.descricao),
            style: const TextStyle(fontSize: 30)),
        const SizedBox(height: 20),
        Text('${TextConstants.min}: ${climaModel.tempMin}${TextConstants.cel}',
            style: const TextStyle(fontSize: 18)),
        Text('${TextConstants.max}: ${climaModel.tempMax}${TextConstants.cel}',
            style: const TextStyle(fontSize: 18)),
        Text(
            '${TextConstants.sensacaoTerm}: ${climaModel.sensacaoTermica}${TextConstants.cel}',
            style: const TextStyle(fontSize: 18)),
        Text('${TextConstants.umidade}: ${climaModel.umidade}%',
            style: const TextStyle(fontSize: 18)),
        Text('${TextConstants.visibilidade}: ${climaModel.visibiliade}Km',
            style: const TextStyle(fontSize: 18)),
        Text('${TextConstants.pressao}: ${climaModel.pressao}hPa',
            style: const TextStyle(fontSize: 18))
      ],
    );
  }
}