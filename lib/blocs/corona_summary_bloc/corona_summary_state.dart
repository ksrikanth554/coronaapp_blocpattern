import 'package:coronaapp/data/models/corona_summary.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaSummaryState extends Equatable{}

class CoronaSummaryInitialState extends CoronaSummaryState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class CoronaSummaryLoadingState extends CoronaSummaryState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class CoronaSummaryLoadingSuccesState extends CoronaSummaryState{
final CoronaSummary coronaSummary;
  CoronaSummaryLoadingSuccesState({@required this.coronaSummary});

  @override
  // TODO: implement props
  List<Object> get props => null;


}
class CoronaSummaryLoadingFailedState extends CoronaSummaryState{
  final String message;
  CoronaSummaryLoadingFailedState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;



}
