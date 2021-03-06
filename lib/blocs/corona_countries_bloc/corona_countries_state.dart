import 'package:coronaapp/data/models/corona_country.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaCountriesState extends Equatable{}

class CoronaCountriesLoadingState extends CoronaCountriesState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class CoronaCountriesLoadingSuccessState extends CoronaCountriesState{
  final List<CoronaCountry> countries;
  CoronaCountriesLoadingSuccessState({@required this.countries});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class CoronaCountriesLoadingFailedState extends CoronaCountriesState{
  final String message;
  CoronaCountriesLoadingFailedState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FilteredCountriesState extends CoronaCountriesState{
  final List<CoronaCountry> countries;
  FilteredCountriesState({@required this.countries});
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class NoCountriesFoundState extends CoronaCountriesState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}