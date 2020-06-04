import 'package:coronaapp/data/datasource/corona_datasource.dart';
import 'package:coronaapp/data/models/corona_country.dart';
import 'package:coronaapp/data/models/corona_summary.dart';

class CoronaRepository{
  CorornaDataSource _corornaDataSource;
  CoronaRepository(){
    _corornaDataSource=CorornaDataSource();
  }

  Future<CoronaSummary> fetchCorornaSummary()async{
    var _summary=await _corornaDataSource.getCoronaSummary();
    return _summary;
  }
  Future<List<CoronaCountry>> fetchCoronaCountries()async{
    var _countryCountriesList=await _corornaDataSource.getCoronaCountriesList();
    return _countryCountriesList;

  }

}