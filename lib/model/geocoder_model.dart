class Geocoder {
  final String local;
  final double lat;
  final double lon;

  Geocoder({required this.local, required this.lat, required this.lon});

  factory Geocoder.fromJson(List<dynamic> json) {
    return Geocoder(
        local: json[0]["name"], lat: json[0]["lat"], lon: json[0]["lon"]);
  }
}