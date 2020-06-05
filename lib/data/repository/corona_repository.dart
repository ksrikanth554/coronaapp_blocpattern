import 'package:coronaapp/data/datasource/corona_datasource.dart';
import 'package:coronaapp/data/models/corona_country.dart';
import 'package:coronaapp/data/models/corona_summary.dart';
import 'package:meta/meta.dart';

class CoronaRepository{
  CorornaDataSource corornaDataSource;
  CoronaRepository({@required this.corornaDataSource});
    

  Future<CoronaSummary> fetchCorornaSummary()async{
    var _summary=await corornaDataSource.getCoronaSummary();
    return _summary;
  }
  Future<List<CoronaCountry>> fetchCoronaCountries()async{
    var _countryCountriesList=await corornaDataSource.getCoronaCountriesList();
    return _countryCountriesList;

  }
  List<CoronaCountry> fetchFilteredCountries(String text,List<CoronaCountry> countries){
    var filteredList=corornaDataSource.getFilteredCounries(text, countries);
    return filteredList;
  }

}