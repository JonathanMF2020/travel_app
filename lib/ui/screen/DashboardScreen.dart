import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universalapp/bloc/navigator/navigation_bloc.dart';
import 'package:universalapp/util/Constants.dart';
import 'package:universalapp/util/UniversalColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreeen extends StatefulWidget {
  DashboardScreeen({Key? key}) : super(key: key);


  @override
  _DashboardScreeenState createState() => _DashboardScreeenState();
}

class _DashboardScreeenState extends State<DashboardScreeen> {

  int _bottomNavIndex = 0;
  final TextEditingController _name = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  @override
  void initState() {
    super.initState();
    _name.text = "Jonathan Mojica";
    _password.text = "";
    _phone.text = "4761027013";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPoke();
  }

  ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: UniversalColors.secondary,
    padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: UniversalColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  Widget _buildPoke() {
    return Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.home,
            Icons.favorite,
            Icons.shopping_basket,
            Icons.person,
          ],
          height: 100,
          iconSize: 40,
          activeColor: UniversalColors.secondary,
          activeIndex: _bottomNavIndex,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          backgroundColor: Colors.white,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,

        ),
        backgroundColor: UniversalColors.background,
        body: bodyAction(context)
    );
  }

  Widget bodyAction(context)
  {
    switch(_bottomNavIndex)
    {
      case Constants.HOME:{
        return SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${AppLocalizations.of(context)!.hi} Jonathan!",style: GoogleFonts.publicSans(fontSize: 30,fontWeight: FontWeight.bold)),
                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.search,size: 40,))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("${AppLocalizations.of(context)!.where_to} ",style: GoogleFonts.publicSans(fontSize: 18,fontWeight: FontWeight.bold)),
                        Text("Nezahualcoyotl",style: GoogleFonts.publicSans(fontSize: 18,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                      ],
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 110,
                  child: ListView(

                      scrollDirection: Axis.horizontal,
                      children: [

                        buildIcon("Hotels",Colors.blue,Icons.hotel),
                        buildIcon("Fligths",Colors.red,Icons.flight),
                        buildIcon("Foods",Colors.orange,Icons.fastfood),
                        buildIcon("Events",Colors.deepPurple,Icons.event),
                        buildIcon("Package",Colors.green,Icons.place),

                      ]
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.best_destination,style: GoogleFonts.publicSans(fontSize: 26,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                        Text(AppLocalizations.of(context)!.more,style: GoogleFonts.publicSans(fontSize: 20,fontWeight: FontWeight.w200)),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCard("assets/beach1.jpg","Place 1","5"),
                      buildCard("assets/beach2.jpg","Place 2","5"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCard("assets/beach3.jpg","Place 3","5"),
                      buildCard("assets/beach4.jpg","Place 4","5"),


                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCard("assets/beach1.jpg","Place 5","5"),
                      buildCard("assets/beach2.jpg","Place 6","5"),


                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
      case Constants.PROFILE:{
        return SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(AppLocalizations.of(context)!.profile,style: GoogleFonts.publicSans(fontSize: 30,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                      ),
                      Container(
                        margin:EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: _name,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: Colors.grey,
                            hintText: AppLocalizations.of(context)!.name,
                          ),
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: _password,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: Colors.grey,
                            hintText: AppLocalizations.of(context)!.pl_password,
                          ),
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: _phone,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: Colors.grey,
                            hintText: AppLocalizations.of(context)!.phone,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () async {

                          },
                          child: Text(AppLocalizations.of(context)!.save),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: raisedButtonStyle2,
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool("logueado", false);
                            await prefs.setString("name", "");
                            BlocProvider.of<NavigationBloc>(context).add(NavigateToHome());
                          },
                          child: Text(AppLocalizations.of(context)!.out),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      }
      default:
        return Container();
    }
  }

  GestureDetector buildCard(String asset,String name,String calificiacion) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<NavigationBloc>(context).add(NavigateToPlace());
      },
      child: Container(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Center(
                                child: Image.asset(asset,
                                  width: (MediaQuery.of(context).size.width/2)-32,
                                )),
                          ),
                          Positioned(
                              bottom: 5,
                              left: 10,
                              child: Column(
                                children: [
                                  Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                  Container(
                                      margin: EdgeInsets.only(top: 5),
                                      color: Colors.white.withOpacity(0.5),
                                      padding: EdgeInsets.only(left: 5,right: 5),
                                      child: Row(
                                        children: [

                                          Text(calificiacion,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                          Icon(Icons.star_border_outlined,color: Colors.white,)
                                        ],
                                      )),
                                ],
                              )
                          ),

                        ],
                      ),
                    ),
    );
  }

  Container buildIcon(String name, Color color, IconData icon) {
    return Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(bottom: 10,top: 10,left: 10,right: 10),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(icon,color: Colors.white,size: 50,)
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(name,style: GoogleFonts.publicSans(fontSize: 18,fontWeight: FontWeight.normal)),
                            )
                          ]
                      ),
                    );
  }


}