import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.setLocal});

  final void Function(Locale locale) setLocal;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool positive=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Text(AppLocalizations.of(context)!.lenguage),
        actions: [
          Switch(value:positive, onChanged:(value){
            positive=value;
            if(value){
              widget.setLocal(const Locale("bn"));
            }else{
               widget.setLocal(const Locale("en"));
            }
          },)
       ],
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Text(AppLocalizations.of(context)!.bangladesh_history),
      )

    );
  }
}