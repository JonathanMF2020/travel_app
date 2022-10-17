import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universalapp/bloc/language/language_bloc.dart';
import 'package:universalapp/bloc/navigator/navigation_bloc.dart';
import 'package:universalapp/util/UniversalAlert.dart';

import '../../util/UniversalColors.dart';

class HomeScreeen extends StatefulWidget {
  int idioma;
  String version;
  HomeScreeen({Key? key,required this.idioma,required this.version}) : super(key: key);


  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen>{

  int seccion = 0;
  int idioma = 0;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  void initState() {
    idioma = widget.idioma;
    seccion = 1;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Widget _buildPoke() {


    return Scaffold(
      backgroundColor: UniversalColors.background,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>{
                      init(context,1)
                    },
                    child: idioma == 1 ? Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: UniversalColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/united-states.png",height: 50,)
                    ) : GestureDetector(
                        onTap: () =>{
                          init(context,1)
                        },
                        child: Image.asset("assets/united-states.png",height: 50,)
                    ),
                  ),
                  idioma == 2 ? GestureDetector(
                    onTap: () =>{
                      init(context,2)
                    },
                    child: Container(
                        height: 70,

                        decoration: BoxDecoration(
                          color: UniversalColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/spain.png",height: 50,)
                    ),
                  ) : GestureDetector(
                      onTap: () => {
                        init(context,2)
                      },
                      child: Image.asset("assets/spain.png",height: 50,)
                  )
                ],
              ),
              Container(

                  margin: EdgeInsets.only(top: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(AppLocalizations.of(context)!.title,style: GoogleFonts.publicSans(fontSize: 20,fontWeight: FontWeight.bold))
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16,bottom: 16),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () =>{

                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    seccion = 1;
                                  })
                                },
                                child: Text(AppLocalizations.of(context)!.signup,style: GoogleFonts.publicSans(fontSize: 14,fontWeight: seccion == 1 ? FontWeight.bold : FontWeight.normal))
                            ),
                            Text("/",style: GoogleFonts.publicSans(fontSize: 14)),
                            GestureDetector(
                                onTap: () =>{
                                  setState(() {
                                  FocusScope.of(context).unfocus();
                                  seccion = 2;
                                 })

                                },
                                child: Text(AppLocalizations.of(context)!.login,style: GoogleFonts.publicSans(fontSize: 14,fontWeight: seccion == 1 ? FontWeight.normal : FontWeight.bold))
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              ),
              seccion == 1 ? funcionUno(context) : funcionDos(context),
              Container(
                  margin: EdgeInsets.only(top: 30,bottom: 16),
                  alignment: Alignment.center,
                  child: Text(widget.version)
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: UniversalColors.secondary,
    padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  Widget funcionUno(context){
    return Column(
      children: [
        Container(
          color: Colors.white,
          margin:EdgeInsets.only(top: 10),
          child: TextField(
            controller: _name,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: AppLocalizations.of(context)!.name,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          margin:EdgeInsets.only(top: 10),
          child: TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: AppLocalizations.of(context)!.email,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          margin:EdgeInsets.only(top: 10),
          child: TextField(
            controller: _password,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,
              hintText: AppLocalizations.of(context)!.password,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () async {
              if(_email.text.isNotEmpty && _password.text.isNotEmpty && _name.text.isNotEmpty)
              {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('language', idioma == 1? "en" : "es");
                BlocProvider.of<NavigationBloc>(context).add(NavigateToHome());
              }else{
                UniversalAlert().error(context,"Error",AppLocalizations.of(context)!.desc_error_1);
              }
            },
            child: Text(AppLocalizations.of(context)!.register),
          ),
        )
      ],
    );
  }

  Widget funcionDos(context){
    return Column(
      children: [
        Container(
          margin:EdgeInsets.only(top: 10),
          child: TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: AppLocalizations.of(context)!.email,
            ),
          ),
        ),
        Container(
          margin:EdgeInsets.only(top: 10),
          child: TextField(
            obscureText: true,
            controller: _password,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,
              hintText: AppLocalizations.of(context)!.password,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () async {
              if(_email.text.isNotEmpty && _password.text.isNotEmpty)
              {
                if(_email.text == "admin@medicapp.com" && _password.text == "admin")
                {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('language', idioma == 1? "en" : "es");
                  await prefs.setBool("logueado", true);
                  await prefs.setString("name", _name.text);
                  BlocProvider.of<NavigationBloc>(context).add(NavigateToDashboard());
                }else{
                  UniversalAlert().error(context,"Error",AppLocalizations.of(context)!.desc_error_3);
                }

              }else{
                UniversalAlert().error(context,"Error",AppLocalizations.of(context)!.desc_error_1);
              }
            },
            child: Text(AppLocalizations.of(context)!.login),
          ),
        )
      ],
    );
  }

  Future<void> init(context,valor) async {
    FocusScope.of(context).unfocus();
    BlocProvider.of<LanguageBloc>(context).add(SetLanguage(idioma:  valor == 1? "en" : "es"));
    setState(() {
      idioma = valor;
    });
  }


  @override
  Widget build(BuildContext context) {
    return _buildPoke();
  }



}