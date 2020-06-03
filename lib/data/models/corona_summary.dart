class CoronaSummary{
  int cases;
  int deaths;
  int recovered;
  int updated;
  CoronaSummary({this.recovered,this.deaths,this.cases,this.updated});
  CoronaSummary.fromJson(Map<String,dynamic> json){
    this.cases=json['cases'];
    this.deaths=json['deaths'];
    this.recovered=json['recovered'];
    this.updated=json['updated'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['cases']=this.cases;
    data['deaths']=this.deaths;
    data['recovered']=this.recovered;
    data['updated']=this.updated;
    return data;
  }
}