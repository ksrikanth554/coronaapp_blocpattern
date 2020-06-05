import 'package:coronaapp/blocs/corona_countries_bloc/corona_countries_events.dart';
import 'package:coronaapp/blocs/corona_countries_bloc/corona_countries_state.dart';
import 'package:coronaapp/data/models/corona_country.dart';
import 'package:coronaapp/data/repository/corona_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaCountriesBloc extends Bloc<CoronaCountriesEvent,CoronaCountriesState>{
  CoronaRepository coronaRepository;
  List<CoronaCountry> countries;
  CoronaCountriesBloc({@required this.coronaRepository});
  @override
  // TODO: implement initialState
  CoronaCountriesState get initialState => CoronaCountriesLoadingState();

  @override
  Stream<CoronaCountriesState> mapEventToState(CoronaCountriesEvent event) async*{
    if (event is FetchCoronaCountriesEvent) {
      yield*mapCoronaCountriesEventToState(event);  
    }
    else if (event is FilteredCountriesEvent) {
      yield*mapFilteredCountriesEventToState(event);
    }
    else if (event is CrossBtnPressedEvent) {
      yield CoronaCountriesLoadingSuccessState(countries: countries);
    }
  }

  Stream<CoronaCountriesState> mapCoronaCountriesEventToState(FetchCoronaCountriesEvent event)async*{
    yield CoronaCountriesLoadingState();
    try{
        countries=await coronaRepository.fetchCoronaCountries();
        yield CoronaCountriesLoadingSuccessState(countries:countries);
    }
    catch(e){
        yield CoronaCountriesLoadingFailedState(message:e.toString());
    }
  }
  Stream<CoronaCountriesState> mapFilteredCountriesEventToState(FilteredCountriesEvent event)async*{
    yield CoronaCountriesLoadingState();
    var filteredCountries=coronaRepository.fetchFilteredCountries(event.text, event.countries);
    if (filteredCountries.length>0) {
      yield FilteredCountriesState(countries: filteredCountries);
    }
    else{
      yield NoCountriesFoundState();
    }

  }

}