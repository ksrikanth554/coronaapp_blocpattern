import 'package:coronaapp/blocs/corona_countries_bloc/corona_countries_bloc.dart';
import 'package:coronaapp/blocs/corona_countries_bloc/corona_countries_events.dart';
import 'package:coronaapp/blocs/corona_countries_bloc/corona_countries_state.dart';
import 'package:coronaapp/data/models/corona_country.dart';
import 'package:coronaapp/res/colors/app_colors.dart';
import 'package:coronaapp/ui/pages/corona_country_detail_page.dart';
import 'package:coronaapp/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaCountriesPage extends StatefulWidget {
  @override
  _CoronaCountriesPageState createState() => _CoronaCountriesPageState();
}

class _CoronaCountriesPageState extends State<CoronaCountriesPage> {
  double screenHeight,screenWidth;
  CoronaCountriesBloc coronaCountriesBloc;
  bool isSearching=false;
  List<CoronaCountry> list=[];
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    super.initState();
    coronaCountriesBloc=BlocProvider.of<CoronaCountriesBloc>(context);
    coronaCountriesBloc.add(FetchCoronaCountriesEvent());
  }
  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;
    screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
       // leading: !isSearching?Icon(Icons.search):null,
        title: !isSearching?Text('CORONA VIRUS',
          style: TextStyle(
            color: Colors.lime,
            fontFamily: 'RussoOne',
            letterSpacing: 1.7,
            fontWeight: FontWeight.bold
          ),
        ):
        TextField(
          controller: searchController,
          style: TextStyle(color: Colors.white),
          autofocus: true,
          decoration: InputDecoration(
            icon: Icon(Icons.search,color: Colors.white,),
            hintText: 'Search By Country',
            hintStyle: TextStyle(color: Colors.white)
          ),
          onChanged: (value){
            coronaCountriesBloc.add(FilteredCountriesEvent(text:value,countries: list));
          },
        ),
        centerTitle: true,
        actions: <Widget>[
            isSearching?IconButton(icon: Icon(Icons.cancel), onPressed: (){
              coronaCountriesBloc.add(CrossBtnPressedEvent());
                setState(() {
                  searchController.text='';
                  isSearching=false;
                });
            }):
            IconButton(icon: Icon(Icons.search), onPressed: (){
              setState(() {
                isSearching=true;
              });
            })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.darkBg,
          height: screenHeight,
          child: BlocBuilder<CoronaCountriesBloc,CoronaCountriesState>(builder: (context,state){
              Widget widget;
              if (state is CoronaCountriesLoadingState) {
                widget=loadingUi();
              }
              else if (state is CoronaCountriesLoadingSuccessState) {
                list=state.countries;
                widget=buildCoronaCountriesList(state.countries);
              }
              else if (state is CoronaCountriesLoadingFailedState) {
                widget=buildErrorUI(state.message);
              }
              else if (state is FilteredCountriesState) {
                widget=buildCoronaCountriesList(state.countries);
              }
              else if (state is NoCountriesFoundState) {
                widget=buildErrorUI('No Countries Found');
              }
            return widget;
          }),
        ),
      ),
      
      
    );
    
  }
    Widget buildCoronaCountriesList(List<CoronaCountry> countries){
      return Material(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (ctx,index){
              CoronaCountry coronaCountry=countries[index];
            return  InkWell(
              onTap: (){
                  navigateToCountryDetailsPage(context, coronaCountry);
              },
                 child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02,vertical: screenHeight*0.008),
                child: Material(
                  elevation: 10.0,
                  shadowColor: Colors.grey,
                  color: AppColors.upDark,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:screenWidth*0.02,vertical: screenHeight*0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                          Container(
                            padding: EdgeInsets.symmetric(vertical:screenHeight*0.01),
                            child:Text(coronaCountry.country,
                            style:TextStyle(
                              color:AppColors.teal,
                              letterSpacing: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                             padding: EdgeInsets.symmetric(vertical:screenHeight*0.01),
                            child:Text('Cases: ${coronaCountry.cases}',
                            style:TextStyle(
                              color:AppColors.green,
                              fontSize: 15,
                              
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                 padding: EdgeInsets.symmetric(vertical:screenHeight*0.01),
                                child:Text('Deaths: ${coronaCountry.deaths}',
                                style:TextStyle(
                                  color:AppColors.white,
                                  fontSize: 15,

                                  ),
                                ),
                              ),
                              Container(
                                 padding: EdgeInsets.symmetric(vertical:screenHeight*0.01),
                                child:RichText(
                                 text: TextSpan( 
                                 children: [
                                    TextSpan(text:'Today:  ',style: TextStyle(color: Colors.white)),
                                    TextSpan(text:'${coronaCountry.todayDeaths}',style:TextStyle(color:Colors.orange))
                                 ]
                                 ),
                                ),
                              ),
                            ],
                          ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          ),

      );
    }
  void navigateToCountryDetailsPage(BuildContext context,CoronaCountry country){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CoronaCountryDeatilsPage(country:country,)));
  }
}