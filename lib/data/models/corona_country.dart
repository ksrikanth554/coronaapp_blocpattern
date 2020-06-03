class CoronaCountriesList{
  List<CoronaCountry> countries;
  CoronaCountriesList.fromJson(List<dynamic> jsonList){
    
    if(jsonList!=null){
      countries=List<CoronaCountry>();
      countries=jsonList.map((jsonData)=>CoronaCountry.fromJson(jsonData)).toList();
    }
  }
}

class CoronaCountry{
  String country;
  var cases;
  var todayCases;
  var deaths;
  var todayDeaths;
  var recovered;
  var critical;
  var active;
  var casesPerOneMillion;
  CoronaCountry({
    this.active,
    this.cases,
    this.casesPerOneMillion,
    this.country,
    this.critical,
    this.deaths,
    this.recovered,
    this.todayCases,
    this.todayDeaths,
    
  });
  CoronaCountry.fromJson(Map<String,dynamic> json){
    this.country=json['country'];
    this.cases=json['cases'];
    this.todayCases=json['todayCases'];
    this.deaths=json['deaths'];
    this.todayDeaths=json['todayDeaths'];
    this.recovered=json['recovered'];
    this.critical=json['critical'];
    this.active=json['active'];
    this.casesPerOneMillion=json['casesPerOneMillion'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['country']=this.country;
    data['cases']=this.cases;
    data['todayCases']=this.todayCases;
    data['deaths']=this.deaths;
    data['todayDeaths']=this.todayDeaths;
    data['recovered']=this.recovered;
    data['critical']=this.critical;
    data['active']=this.active;
    data['casesPerOneMillion']=this.casesPerOneMillion;
    return data;
  }

}