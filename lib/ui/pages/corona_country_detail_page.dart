import 'package:coronaapp/data/models/corona_country.dart';
import 'package:coronaapp/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
class CoronaCountryDeatilsPage extends StatelessWidget {
  final CoronaCountry country;
  CoronaCountryDeatilsPage({this.country});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(

          backgroundColor:AppColors.darkBg,
          title:Text(country.country.toUpperCase(),
          style:TextStyle(
            color: Colors.cyan,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0
          ),
         ),
          centerTitle: true,
        ),
        body: Container(
          color: AppColors.upDark,
         child: ListView(
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(top:10,bottom: 15),
               alignment: Alignment.center,
               child: Text('CORONA VIRUS UPDATE',
               style: TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:10,),
               alignment: Alignment.center,
               child: Text('${country.cases}',
               style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('TOTAL CASES',
               style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:15,),
               alignment: Alignment.center,
               child: Text('${country.todayCases}',
               style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('NEW CASES',
               style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:15,),
               alignment: Alignment.center,
               child: Text('${country.deaths}',
               style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('TOTAL DEATHS',
               style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:15,),
               alignment: Alignment.center,
               child: Text('${country.todayDeaths}',
               style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('NEW DEATHS',
               style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:15,),
               alignment: Alignment.center,
               child: Text('${country.recovered}',
               style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('RECOVERED',
               style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:15,),
               alignment: Alignment.center,
               child: Text('${country.active}',
               style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('ACTIVE',
               style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(top:15,),
               alignment: Alignment.center,
               child: Text('${country.critical}',
               style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
               ),
              ),
             ),
             Container(
               padding: EdgeInsets.only(bottom: 15),
               alignment: Alignment.center,
               child: Text('CRITICAL',
               style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.0
               ),
              ),
             ),
           ],
         ),
        ),
      ),
    );
  }
}