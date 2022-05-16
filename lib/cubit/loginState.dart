
import 'package:q_event_scanner/model/loginModel.dart';
import 'package:q_event_scanner/model/ticketModel.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
 final  LoginModel loginModel ;
 LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
   final String error ;
   final  LoginModel loginModel ;
   LoginErrorState( this.error, this.loginModel ) ;
}


class TicketLoadingState extends LoginState {}

class TicketSuccessState extends LoginState {
  final  TicketModel ticketModel ;
  TicketSuccessState(this.ticketModel);
}

class TicketErrorState extends LoginState {
  final String error ;
  TicketErrorState( this.error) ;
}