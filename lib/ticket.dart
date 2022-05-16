
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_event_scanner/data/local/cash_helper.dart';

import 'ScanScreen.dart';
import 'cubit/loginCubit.dart';
import 'cubit/loginState.dart';
import 'loginScreen.dart';
class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override

  Widget build(BuildContext context) {
    print('phonx ${CashHelper.getData(key: 'pnoneNum')}');
    print('idx ${CashHelper.getData(key: 'id')}');

    LoginCubit cubit = LoginCubit.get(context);


    return BlocConsumer<LoginCubit , LoginState>(
      listener: (context , state ){
        },
      builder:(context , state ){
        print('phonx ${CashHelper.getData(key: 'pnoneNum')}');
        print('idx ${CashHelper.getData(key: 'id')}');
        print('ticxx ${CashHelper.getData(key: 'status')}');
        print('ticxx ${CashHelper.getData(key: 'msg')}');



        return Scaffold(
        /*  appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                InkWell(child: Icon(Icons.logout , size: 30, ),
                    onTap: (){
                      CashHelper.removeData(key: 'token').then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                      });
                    }),
              )
            ],
          ),*/
          body: SingleChildScrollView(
            child: SafeArea(child:
            Column(
              children: [
                Container(
                  height: 120 ,
                  width: double.infinity ,
                  color: Colors.indigo ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Text('Confirmation Process' , textAlign: TextAlign.center ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold ,
                          color: Colors.white ,
                          fontSize: 18
                      ),),
                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                       if (CashHelper.getData(key: 'status') == 200 )
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle ,
                            color: Colors.green
                        ),
                        child: Icon(Icons.check_circle_outline_outlined , color: Colors.white , size: 90,),
                      ),

                if (CashHelper.getData(key: 'status') == 404 )
                  Stack(
                        alignment: AlignmentDirectional.center,

                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.red,
                                borderRadius: BorderRadius.circular(50.0),

                            ),

                          ),

                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),

                            ),

                          ),

                          Container(
                            height: 53,
                            width: 53,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25.0),

                            ),

                          ),


                          Text('x' , style: TextStyle(fontSize: 50 , fontWeight: FontWeight.bold ,
                              color: Colors.white ),
                            textAlign: TextAlign.center ,
                          )


                        ],
                      ),

                      SizedBox(height: 70,),

                      if (CashHelper.getData(key: 'status') == 200 )

                        Text('Thank you , You are Allowed to enter' , style: TextStyle(color: Colors.indigo),),

                        if (CashHelper.getData(key: 'msg') == "Sorry this reference id not found" ||
                            CashHelper.getData(key: 'status') ==404 )

                         // Text('oops! invalid QR code , Please Try Again later' , style: TextStyle(color: Colors.indigo),),
                      //if (CashHelper.getData(key: 'status') ==404 )

                        Text('Sorry ,this QR Code has been used before ' , style: TextStyle(color: Colors.indigo),),


                      SizedBox(height: 10,),

                   /*   Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120.0),
                        child: Row(
                          children: [
                            Icon(Icons.phone_android , color: Colors.amber,) ,
                            Text('${CashHelper.getData(key:'pnoneNum')}',style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold , fontSize: 14),),
                          ],),
                      ),

                      SizedBox(height: 10,),
                      Text('Your Ticket Reference ID is:' ,  style: TextStyle(color: Colors.indigo),),

                      Text('#000000${CashHelper.getData(key:'id')}' , style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold , fontSize: 18),),*/

                      SizedBox(height: 100,),

                      ElevatedButton(

                        onPressed: (){
                          CashHelper.removeData(key: 'token').then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                          });
                        }, child: Text('Back to Home') ,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25), // <-- Radius
                          ),
                        ),

                      )


                    ],
                  ),
                )
              ],
            )
            ),
          ),
        ) ;
      } ,
    );
  }
}
