import 'dart:async';
import 'dart:ui';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:universalapp/bloc/navigator/navigation_bloc.dart';
import 'package:universalapp/util/UniversalAlert.dart';
import 'package:universalapp/util/UniversalColors.dart';

class PlaceScreeen extends StatefulWidget {
  PlaceScreeen({Key? key}) : super(key: key);


  @override
  _PlaceScreeenState createState() => _PlaceScreeenState();
}

class _PlaceScreeenState extends State<PlaceScreeen> with TickerProviderStateMixin{
  late Animation animation;
  late Animation animationOpacity;
  late AnimationController controller;
  bool corazon = false;


  ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: UniversalColors.secondary,
    padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve =
    CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPoke();
  }

  Widget _buildPoke() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: UniversalColors.background,
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, widget){
            return  Opacity(
              opacity: animationOpacity.value,
              child: Container(
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Image.asset("assets/beach1.jpg"),
                        Positioned(
                          left: 16,
                          top: 20,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: UniversalColors.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                BlocProvider.of<NavigationBloc>(context).add(NavigateToDashboard());
                              },
                              icon: Icon(Icons.arrow_back,color: Colors.white),

                            ),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 20,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: UniversalColors.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  corazon = !corazon;
                                });
                              },
                              icon: Icon(corazon? Icons.favorite : Icons.favorite_border,color: Colors.white),

                            ),
                          ),
                        ),

                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(AppLocalizations.of(context)!.about,style: GoogleFonts.publicSans(fontSize: 30,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                          ),
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style: GoogleFonts.publicSans(fontSize: 14,fontWeight: FontWeight.normal)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Divider(

                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(AppLocalizations.of(context)!.review,style: GoogleFonts.publicSans(fontSize: 30,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/6,
                                child: Column(
                                  children: [
                                    Icon(Icons.person),
                                    Text("Jonathan Mojica")
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5,right: 5),
                                  width: MediaQuery.of(context).size.width/2-25,
                                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                              ),
                              Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.yellow),
                                      Icon(Icons.star,color: Colors.yellow),
                                      Icon(Icons.star,color: Colors.yellow),
                                      Icon(Icons.star,color: Colors.yellow),
                                      Icon(Icons.star_border_outlined,color: Colors.yellow,),
                                    ],
                                  ),
                              ),
                            ],
                          ),
                          TextButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.more)),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            alignment: Alignment.centerLeft,
                            child: Text(AppLocalizations.of(context)!.include,style: GoogleFonts.publicSans(fontSize: 30,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                          ),
                          Container(
                            child: Html(data: "<p>This content is <b>HTML</b> render in widget accept</p><br>"
                                "<ul>"
                                "<li>Transport</li>"
                                "<li>Food buffet</li>"
                                "<li>Private beach</li>"
                                "</ul>")
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            alignment: Alignment.centerLeft,
                            child: Text("${AppLocalizations.of(context)!.prices}: 400USD",style: GoogleFonts.publicSans(fontSize: 30,fontWeight: FontWeight.bold,color: UniversalColors.secondary)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                UniversalAlert().success(context,AppLocalizations.of(context)!.title_carrito,AppLocalizations.of(context)!.desc_carrito);
                              },
                              child: Text(AppLocalizations.of(context)!.add_cart,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}