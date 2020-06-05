import 'package:coronaapp/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_tab=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: current_tab,
          onTap: (index){
            setState(() {
              current_tab=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.border_all),
              title: Text('Summary')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text('Countries')
            ),
          ],
          selectedIconTheme: IconThemeData(
            color:AppColors.red
          ),
          selectedItemColor: AppColors.white,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey[600]
          ),
          unselectedItemColor: Colors.grey[600],
        ),
        body: IndexedStack(
          index: current_tab,
          children: <Widget>[
            Center(child:Text('Summary')),
            Center(child:Text('countries'))
          ],
        ),
      ),
    );
  }
}