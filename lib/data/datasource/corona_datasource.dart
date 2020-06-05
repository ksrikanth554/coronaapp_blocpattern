import 'dart:convert';

import 'package:coronaapp/data/models/corona_country.dart';
import 'package:coronaapp/data/models/corona_summary.dart';
import 'package:coronaapp/res/strings/app_strings.dart';
import 'package:http/http.dart' as http;

class CorornaDataSource{
  Future<CoronaSummary> getCoronaSummary()async{
    var response=await http.get(AppStrings.corona_summary_url);
    if (response.statusCode==200) {
      var data=json.decode(response.body);
      CoronaSummary _coronaSummary=CoronaSummary.fromJson(data);
      return _coronaSummary;
    } 
    else {
      throw Exception();
    }

  }
  Future<List<CoronaCountry>> getCoronaCountriesList()async{
    var response=await http.get(AppStrings.corona_countries_url);
    if (response.statusCode==200) {
      var data=json.decode(response.body);
      List<CoronaCountry> _coronaCountiresList=CoronaCountriesList.fromJson(data).countries;
      return _coronaCountiresList;
    }
    else{
      throw Exception();
    }
  }

  List<CoronaCountry> getFilteredCounries(String text,List<CoronaCountry> countries){
    if (countries.length>0) {
      List<CoronaCountry> filteredList=countries.where((country)=>country.country.toLowerCase()
                                       .contains(text.trim().toLowerCase())).toList();
      return filteredList;    
    }
    else{
      return [];
    }

  }

}