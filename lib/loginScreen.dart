import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:q_event_scanner/cubit/loginState.dart';


import 'ScanScreen.dart';
import 'components.dart';
import 'cubit/loginCubit.dart';
import 'data/local/cash_helper.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();



    return BlocProvider(
      create: (BuildContext context)=> LoginCubit(),
      child: BlocConsumer< LoginCubit , LoginState >(
        listener: (context , state){
          if(state is LoginSuccessState )
          {

            CashHelper.removeData(key: 'pnoneNum');
            CashHelper.removeData(key: 'id');

            showToast( msg: '${state.loginModel.message}' , state: ToastState.SUCCESS );

              CashHelper.saveData(key: 'token', value: state.loginModel.data?.access_token ).
              then((value) {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanScreen(phone: usernameController.text ,)));
                CashHelper.saveData(key:'pnoneNum', value: state.loginModel.data?.phone ).then((value) {

                  print('save phone successfully');

                }).catchError((e){

                  print('error in phoneNum ${e.toString()}');

                });

                CashHelper.saveData(key:'id', value: state.loginModel.data?.id ).then((value) {
                  print('save id successfully');

                }).catchError((e){
                  print('error in Id ${e.toString()}');
                });

              });


          }



          else if(state is LoginErrorState )
          {
             showToast( msg: '${state.loginModel.message}' , state: ToastState.ERROR );

          }



        },
        builder: (context , state) {

          LoginCubit  cubit = LoginCubit.get(context);

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: AppBar(
                title: Text('Log In '),
                centerTitle: true,
              ),
            ),
            body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child:
                    Form(
                      key: formKey ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [

                          SizedBox(height: 160, child:  Image.asset('assets/images/bk.png' , fit: BoxFit.contain,),),

                          Container(
                            height: 60,
                            child: TextFormField(
                              controller: usernameController ,
                              keyboardType: TextInputType.emailAddress ,
                              validator: (value){
                                if(value!.isEmpty) return 'Please enter your email address or phone' ;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Email / Phone *')

                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                          Container(
                            height: 60,
                            child: TextFormField(
                                controller: passwordController ,
                                keyboardType: TextInputType.visiblePassword ,
                                validator: (value){
                                  if(value!.isEmpty) return 'Please enter your password' ;
                                },
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(phone: usernameController.text , password: passwordController.text );

                                  }
                                },
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  label: Text('Password *' ,),

                                )),
                          ) ,
                          SizedBox(height: 30,),

                          Container(

                            width: double.infinity,
                            height: 45,

                            child: ConditionalBuilder(
                              condition: state is !LoginLoadingState ,
                              builder: (BuildContext context)=> MaterialButton(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: Colors.indigo,
                                onPressed: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    cubit.userLogin(phone: usernameController.text , password: passwordController.text );
                                   /* Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ScanScreen(phone: usernameController.text,)));*/

                                  }


                                }
                                ,
                                child: Text('Log In' ,
                                  style: TextStyle(
                                      color: Colors.white ,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19
                                  ),),) ,
                              fallback: (context)=> Center(child: CircularProgressIndicator()) ,
                            ),

                          ),


                          SizedBox(height: 15,),

                        /*  Column(
                            children: [
                              TextButton(
                                  onPressed: ()
                                  {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassScreen()));

                                  }, child: Center(
                                    child: Text('Forget Password?' ,
                                style: TextStyle(color: Colors.orange ,
                                      fontWeight: FontWeight.w600),),
                                  )),

                              SizedBox(height: 5,),

                            ],
                          )*/
                        ],
                      ),
                    ),
                    // ]
                  ),
                ),
              ),
          //  ),

            // )
          );
        },

      ),
    );
  }



}


