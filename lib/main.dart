import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_event_scanner/cubit/loginCubit.dart';

import 'data/local/cash_helper.dart';
import 'data/remote/dio_helper.dart';
import 'loginScreen.dart';
import 'observer.dart';
import 'ticket.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CashHelper.init();
  DioHelper.init() ;

  print('phonx ${CashHelper.getData(key: 'pnoneNum')}');
  print('idx ${CashHelper.getData(key: 'id')}');

 return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginCubit() ),

      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        debugShowCheckedModeBanner: false ,
        home:
       // TicketScreen()
        LoginScreen(),
      ),
    );
  }
}

