import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/app_core.dart';
import '../../screens/home_screen.dart';

import '../../screens/sigin_screen.dart';
import 'auth_state.dart';
import 'package:http/http.dart'as http;

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit():super(AuthInitial ());


  static AuthCubit get(context)=>BlocProvider.of(context);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  Future<void>login(context)async {

    emit(AuthLoding());
    var url = Uri.parse('${baseUrl_registration}login');

    Map<String,dynamic>data ={
      "email":emailController.text,
      "password":passwordController.text,
    };
    final headers ={
      'Content-type':'application/json',
    };
    final body = json.encode(data);

    try{

      final response = await http.post(url,body:body,headers:headers  );
      var result = json.decode(response.body);
      if(result['status']== true){
        debugPrint("success ${result['data']}");
        // token=result['data']['token'];
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        emit(AuthSuccess());
      }else{
        debugPrint("error ${response.statusCode}");
        emit(AuthError());
      }
    }catch(e){
      debugPrint("error when login${e.toString()}");
    }
  }
  Future<void>signup(context)async {

    emit(AuthLoding());
    var url = Uri.parse('${baseUrl_registration}register');

    Map<String,dynamic>data ={
      "email":emailController.text,
      "password":passwordController.text,
      "phone":emailController.text,
      "name":passwordController.text,
    };
    final headers ={
      'Content-type':'application/json',
    };
    final body = json.encode(data);

    try{

      final response = await http.post(url,body:body,headers:headers  );
      var result = json.decode(response.body);
      if(result['status']== true){
        debugPrint("success ${response.body}");
        Navigator.push(context, MaterialPageRoute(builder: (context) => const loginPage()),
        );
        emit(AuthSuccess());
      }else{
        debugPrint("error ${response.statusCode}");
        emit(AuthError());
      }
    }catch(e){
      debugPrint("error when login${e.toString()}");
    }
  }
}