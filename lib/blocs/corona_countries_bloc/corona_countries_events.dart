import 'package:coronaapp/data/models/corona_country.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaCountriesEvent extends Equatable{}

class FetchCoronaCountriesEvent extends CoronaCountriesEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class CoronaUpdateOfACountry extends CoronaCountriesEvent{
  final String country;
  CoronaUpdateOfACountry({@required this.country});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class FilteredCountriesEvent extends CoronaCountriesEvent{
  final String text;
  final List<CoronaCountry> countries;
  FilteredCountriesEvent({@required this.countries,@required this.text});
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class CrossBtnPressedEvent extends CoronaCountriesEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}