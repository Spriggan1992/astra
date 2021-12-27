class ServerAddress {
  final String _address = "http://92.255.108.56:8000/api";
  final String _imageAdress = "http://92.255.108.56:8000";
  final String _apiVer = "v1";
  String get relevant => "$_address/$_apiVer/";
  String get imageAdress => _imageAdress;
}
