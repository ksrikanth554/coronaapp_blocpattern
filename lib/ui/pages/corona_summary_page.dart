import 'package:coronaapp/blocs/corona_summary_bloc/corona_summary_bloc.dart';
import 'package:coronaapp/blocs/corona_summary_bloc/corona_summary_events.dart';
import 'package:coronaapp/blocs/corona_summary_bloc/corona_summary_state.dart';
import 'package:coronaapp/res/colors/app_colors.dart';
import 'package:coronaapp/ui/widgets/app_widgets.dart';
import 'package:coronaapp/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaSummaryPage extends StatefulWidget {
  @override
  _CoronaSummaryPageState createState() => _CoronaSummaryPageState();
}

class _CoronaSummaryPageState extends State<CoronaSummaryPage> {
  double screenHeight,screenWidth;
  CoronaSummaryBloc coronaSummaryBloc;
  @override
  void initState() {
    
    super.initState();
    coronaSummaryBloc=BlocProvider.of<CoronaSummaryBloc>(context);
    coronaSummaryBloc.add(FetchCoronaSummaryEvent());
  }
  @override
  Widget build(BuildContext context) {
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          color:AppColors.darkBg,
          child: BlocBuilder<CoronaSummaryBloc,CoronaSummaryState>(builder: (context,state){
            Widget widget;
              if (state is CoronaSummaryInitialState) {
                widget=loadingUi();
              }
              else if (state is CoronaSummaryLoadingState) {
                widget=loadingUi();
              }
              else if (state is CoronaSummaryLoadingSuccesState) {
                widget=buildSuccessUI(state);
              }
              else if (state is CoronaSummaryLoadingFailedState) {
                widget=buildErrorUI(state.message);
              }
            return widget;

          }),
        ),
      ),

      
    );
  }
  Widget buildSuccessUI(CoronaSummaryLoadingSuccesState state){
    return ListView(

      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.03,bottom:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text('CORONA VIRUS SUMMARY',
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 22,
              color:AppColors.cyan,
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.01,bottom:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text(Helper.millisecondsToDate(state.coronaSummary.updated),
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 22,
              color:Colors.orange,
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          height: screenHeight*0.2,
          width: screenWidth*0.2,
          child: CircleAvatar(
            
            child: Text(state.coronaSummary.deaths.toString(),
                style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),            
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.03,bottom:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text('TOTAL DEATHS',
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 22,
              color:AppColors.red,
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text(state.coronaSummary.cases.toString(),
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 25,
              color:Colors.blue[300],
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.01,bottom:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text('TOTAL CASES',
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 22,
              color:Colors.blue[300],
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text(state.coronaSummary.recovered.toString(),
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 25,
              color:AppColors.green,
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.01,bottom:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text('TOTAL RECOVERED',
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 22,
              color:AppColors.green,
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text(state.coronaSummary.active.toString(),
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 25,
              color:Colors.pinkAccent,
              letterSpacing: 2.3
              ),
            ),
          
        ),
        Container(
          padding: EdgeInsets.only(top:screenHeight*0.01,bottom:screenHeight*0.02),
          alignment: Alignment.center,
            child: Text('ACTIVE',
            style:TextStyle(
              fontFamily:'RussoOne',
              fontWeight:FontWeight.bold,
              fontSize: 22,
              color:Colors.pinkAccent,
              letterSpacing: 2.3
              ),
            ),
          
        ),
       // Center(child: Text(state.coronaSummary.cases.toString(),style: TextStyle(color: Colors.white),))
      ],
    );


  }
}