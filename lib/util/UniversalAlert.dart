import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:universalapp/util/UniversalColors.dart';


class UniversalAlert{
  void error(context,String title,String desc){
    Alert(
      context: context,
      type: AlertType.error,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          color: UniversalColors.secondary,
          child: Text(
            AppLocalizations.of(context)!.desc_error_2,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void success(context,String title,String desc){
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          color: UniversalColors.secondary,
          child: Text(
            AppLocalizations.of(context)!.desc_error_2,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}