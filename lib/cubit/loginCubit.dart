

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_event_scanner/data/end-points.dart';
import 'package:q_event_scanner/data/local/cash_helper.dart';
import 'package:q_event_scanner/data/remote/dio_helper.dart';
import 'package:q_event_scanner/model/loginModel.dart';
import 'package:q_event_scanner/model/ticketModel.dart';

import 'loginState.dart';

class LoginCubit extends Cubit<LoginState>
{
    LoginCubit():super(LoginInitialState()) ;

  static LoginCubit get(context)=> BlocProvider.of(context);

    LoginModel? loginModel ;
    TicketModel? ticketModel ;

  void userLogin(
    {
      @required String? phone ,
      @required String? password ,
      String lang = 'ar' ,

     }
      )
  {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: LOGIN ,
        data:
        {
          'phone' : phone ,
           'password' : password ,
            'lang' : lang ,
            'device_token' : 'ddab3ea4-39c6-4930-8fc9-77dbaf8f5ff6' ,

        }).then((value)
    {


        loginModel = LoginModel.fromJson(value.data);

           print('data : ${loginModel?.message}') ;

           getInfoTicket(id: '0000002' , token: 'Bearer ${loginModel?.data?.access_token}');
          emit(LoginSuccessState(loginModel!));

       }).catchError((e){
          print('error ${e.toString()}');
          emit(LoginErrorState(e.toString(), loginModel! ));
    });
  }


  getInfoTicket({
             @required String? id   ,
             @required String? token   ,
              String lang = 'en' ,
                })
  {

    emit(TicketLoadingState());

     DioHelper.postData(
         url:'https://qevents-test.appclouders.com/api/attend'
         , data: {
            "reference_id" : id ,
            "lang" : lang ,},
       token: token ,
     ).then((value){


       print('ticket Data : ${value }') ;
       ticketModel = TicketModel.FromJson(value.data);

       CashHelper.saveData(key: 'status', value: ticketModel?.status);
       CashHelper.saveData(key: 'msg', value: ticketModel?.msg );

       emit(TicketSuccessState(ticketModel!));

               }).
     catchError((e){
       print('erxx ${e.toString()}');
       emit(TicketErrorState(e.toString() ));
            });
  }





 
}