class ClimaModel{
  final double temperatura;
  final double tempMin;
  final double tempMax;
  final double sensacaoTermica;
  final int pressao;
  final int umidade;
  final int visibiliade;
  final String descricao;
  final String icone;

  ClimaModel({
        required this.temperatura,
        required this.tempMin,
        required this.tempMax,
        required this.sensacaoTermica,
        required this.pressao,
        required this.umidade,
        required this.visibiliade,
        required this.descricao,
        required this.icone
  });

  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
        temperatura: json['main']['temp'].toDouble(),
        tempMin: json['main']['temp_min'].toDouble(),
        tempMax: json['main']['temp_max'].toDouble(),
        sensacaoTermica: json['main']['feels_like'].toDouble(),
        pressao: json['main']['pressure'].toInt(),
        umidade: json['main']['humidity'].toInt(),
        visibiliade: json['visibility'],
        descricao: json['weather'][0]['description'],
        icone: json['weather'][0]['icon']);
  }
}