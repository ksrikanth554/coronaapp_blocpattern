import 'package:coronaapp/blocs/corona_countries_bloc/corona_countries_bloc.dart';
import 'package:coronaapp/blocs/corona_summary_bloc/corona_summary_bloc.dart';
import 'package:coronaapp/data/datasource/corona_datasource.dart';
import 'package:coronaapp/data/repository/corona_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CoronaRepository coronaRepository=CoronaRepository(corornaDataSource: CorornaDataSource());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>CoronaSummaryBloc(coronaRepository: coronaRepository)),
          BlocProvider(create: (context)=>CoronaCountriesBloc(coronaRepository: coronaRepository)),

        ], 
        child: HomePage(),
        ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: 'Corona Live',
      
    );
  }
}