import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/app_core.dart';
import '../../models/library_book_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<BookModel> programming = [];
  Future<void> getprogramming() async {
    var url = Uri.parse('${baseUrl_libraiy}programming');
    try {
      emit(HomeLoading());
      final response = await http.get(url);
      var result = json.decode(response.body);
      for (var element in result['items']) {
        programming.add(BookModel.fromJson(element));
      }
      if (result['status'] == true) {
        debugPrint("success ${response.body}");

        emit(HomeSuccess());
      } else {
        debugPrint("error $result");
        emit(HomeError());
      }
    } catch (e) {
      debugPrint("error when get books${e.toString()}");
    }
  }

  List<BookModel> science = [];
  Future<void> getscience() async {
    var url = Uri.parse('${baseUrl_libraiy}science');
    try {
      emit(HomeLoading());
      final response = await http.get(url);
      var result = json.decode(response.body);
      for (var element in result['items']) {
        science.add(BookModel.fromJson(element));
      }
      if (result['status'] == true) {
        debugPrint("success ${response.body}");

        emit(HomeSuccess());
      } else {
        debugPrint("error $result");
        emit(HomeError());
      }
    } catch (e) {
      debugPrint("error when get books${e.toString()}");
    }
  }

  List<BookModel> Business = [];
  Future<void> getBusiness() async {
    var url = Uri.parse('${baseUrl_libraiy}Business');
    try {
      emit(HomeLoading());
      final response = await http.get(url);
      var result = json.decode(response.body);
      for (var element in result['items']) {
        Business.add(BookModel.fromJson(element));
      }
      if (result['status'] == true) {
        debugPrint("success ${response.body}");

        emit(HomeSuccess());
      } else {
        debugPrint("error $result");
        emit(HomeError());
      }
    } catch (e) {
      debugPrint("error when get books${e.toString()}");
    }
  }

  List<BookModel> freebooks = [];
  Future<void> getfreebooks() async {
    var url = Uri.parse('${baseUrl_libraiy}free_books');
    try {
      emit(HomeLoading());
      final response = await http.get(url);
      var result = json.decode(response.body);
      for (var element in result['items']) {
        freebooks.add(BookModel.fromJson(element));
      }
      if (result['status'] == true) {
        debugPrint("success ${response.body}");

        emit(HomeSuccess());
      } else {
        debugPrint("error $result");
        emit(HomeError());
      }
    } catch (e) {
      debugPrint("error when get books${e.toString()}");
    }
  }



 }
