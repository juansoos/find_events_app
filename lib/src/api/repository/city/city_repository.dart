import 'package:find_events/src/api/model/city.dart';
import 'package:find_events/src/api/repository/city/city_storage.dart';

final List<City> cities = [
  City(
    name: "New York",
    thumbnail:
        "https://media.gettyimages.com/id/1336644062/video/time-lapse-of-flatiron-building-new-york-city-united-states.jpg?s=640x640&k=20&c=p1v7w4TfYGzxHhQonA4nbOPyGlFZrdKDfAeP8kU6-LI=",
  ),
  City(
    name: "Los Angeles",
    thumbnail:
        "https://media.gettyimages.com/id/1056368604/video/aerial-downtown-of-los-angeles-ca.jpg?s=640x640&k=20&c=n0GxFJrgsU8WALo3c_q14SXM8kWxHO10jCmFNHxA0Wc=",
  ),
  City(
    name: "Chicago",
    thumbnail:
        "https://i0.wp.com/www.printmag.com/wp-content/uploads/2019/04/2a34d8_80bc9dfffae04b8ead4eac539dd962fbmv2.jpg?fit=480%2C274&quality=89&ssl=1",
  ),
  City(
    name: "San Francisco",
    thumbnail:
        "https://media.gettyimages.com/id/1441623060/es/v%C3%ADdeo/aerial-golden-gate-bridge-san-francisco-ca-al-atardecer.jpg?s=640x640&k=20&c=oLpuYpcIDI8-7DjX0Gj9G39cRQSK16h2Q4Tue2jluxk=",
  ),
  City(
    name: "Washington",
    thumbnail:
        "https://media.istockphoto.com/id/1291648422/es/v%C3%ADdeo/el-frente-este-del-capitolio-de-los-estados-unidos-washington-dc.jpg?s=640x640&k=20&c=E2zWKjPCUJm48bWOG-A0tAnOnOprxsOAbNsuErmF-qA=",
  ),
  City(
    name: "Boston",
    thumbnail:
        "https://media.istockphoto.com/id/1033872694/video/boston-harbor.jpg?s=640x640&k=20&c=67ITQHQVywcX7_EFTPhUbXBV3t_-MMjZ-P0BJmBcEqk=",
  ),
  City(
    name: "Miami",
    thumbnail:
        "https://media.istockphoto.com/id/1370762154/video/miami-cityscape.jpg?s=640x640&k=20&c=8sizBNGozF_AbgMHa0pp25cWy-oGFsJF0wiNMNbS8H0=",
  ),
  City(
    name: "Atlanta",
    thumbnail:
        "https://media.istockphoto.com/id/1365937996/es/v%C3%ADdeo/vista-a%C3%A9rea-a-trav%C3%A9s-de-edificios-residenciales-en-sweet-auburn-hacia-el-centro-de-atlanta.jpg?s=640x640&k=20&c=syvOriIPhgCTHTDINTg_lMjb-Dx4HEbe1l_dnJGdbT4=",
  ),
];

class CityRepository {
  CityRepository(this._storage);

  final CityStorage _storage;

  bool get citySelectedExist => _storage.city != null;

  Future<List<City>> getCities() async {
    // Emulate http request
    await Future.delayed(const Duration(seconds: 2));

    return Future.value(cities);
  }

  Future<void> saveCity(City city) async {
    await _storage.saveCity(city);
  }

  String? getCitySelected() {
    return _storage.city;
  }
}
