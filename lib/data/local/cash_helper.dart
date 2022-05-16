
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper
{
   static SharedPreferences? _sharedPref ;

 static init() async
  {
    _sharedPref = await SharedPreferences.getInstance() ;
   }

 static Future<bool>  saveData({
     @required String? key ,
     @required dynamic value
    })async
   {

    if(value is int) { return await _sharedPref!.setInt(key!, value) ;}
    if(value is String ) { return await _sharedPref!.setString(key! , value);}
    if(value is double ) { return await _sharedPref!.setDouble(key! , value);}

    return await _sharedPref!.setBool(key!, value);

   }



   static  getData({
     @required String? key
     })

   {
     return _sharedPref!.get(key!);
    }

    static Future<bool> removeData({
     @required String? key
       })async
    {
     return await _sharedPref!.remove(key!);
    }


}