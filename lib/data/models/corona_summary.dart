class CoronaSummary{
  int cases;
  int deaths;
  int recovered;
  int updated;
  int active;
  CoronaSummary({this.recovered,this.deaths,this.cases,this.updated});
  CoronaSummary.fromJson(Map<String,dynamic> json){
    this.cases=json['cases'];
    this.deaths=json['deaths'];
    this.recovered=json['recovered'];
    this.updated=json['updated'];
    this.active=json['active'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['cases']=this.cases;
    data['deaths']=this.deaths;
    data['recovered']=this.recovered;
    data['updated']=this.updated;
    data['active']=this.active;
    return data;
  }
}