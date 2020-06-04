import 'package:coronaapp/blocs/corona_summary_bloc/corona_summary_events.dart';
import 'package:coronaapp/blocs/corona_summary_bloc/corona_summary_state.dart';
import 'package:coronaapp/data/models/corona_summary.dart';
import 'package:coronaapp/data/repository/corona_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaSummaryBloc extends Bloc<CoronaSummaryEvent,CoronaSummaryState>{
  CoronaRepository coronaRepository;
  CoronaSummaryBloc({@required this.coronaRepository});
  @override
  
  CoronaSummaryState get initialState => CoronaSummaryInitialState();

  @override
  Stream<CoronaSummaryState> mapEventToState(CoronaSummaryEvent event)async* {
    if (event is FetchCoronaSummaryEvent) {
      yield*mapCoronaSummaryEventToState(event);
    }
    
  }

  Stream<CoronaSummaryState> mapCoronaSummaryEventToState(FetchCoronaSummaryEvent event)async*{
    yield CoronaSummaryLoadingState();
    try{
      CoronaSummary coronaSummary=await coronaRepository.fetchCorornaSummary();
      yield CoronaSummaryLoadingSuccesState(coronaSummary: coronaSummary);
    }
    catch(e){
      yield CoronaSummaryLoadingFailedState(message:e.toString());

    }

  }

}