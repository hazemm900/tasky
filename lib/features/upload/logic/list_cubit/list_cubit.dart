import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helper/shared_preference.dart';
import 'package:tasky/core/networking/dio_factory.dart';
import 'package:tasky/features/auth/screens/home_screen.dart';
import 'package:tasky/features/auth/screens/log_in_screen.dart';
import 'package:tasky/features/upload/data/model/create_task_model.dart';
import 'package:tasky/features/upload/data/model/edit_task_model.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';
import 'package:tasky/features/upload/data/repo/list_repo.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';
import 'package:tasky/features/upload/screens/list_screen.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit(this._listRepo) : super(ListInitial());

  static ListCubit get(context) => BlocProvider.of(context);
  final ListRepo _listRepo;

  List<Task>? taskList;
  Task? oneTaskItem;

  TextEditingController imageController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController userController = TextEditingController();



    List<Task>paginationList = []  ;
  void list(int page) async {
    final result = await _listRepo.listData(page);
    result.when(success: (response) {
      taskList = response;
      paginationList.addAll(response)   ;
      // print(" paginationList ${paginationList.length}") ;
      // print(" taskList ${taskList!.length}") ;

      print(response);
      emit(ListSuccessState());
    }, failure: (error) {
      emit(ListErrorState(error));
    });
  }

  ScrollController scrollController = ScrollController();
  int pageNumber = 1   ;
  void paginationFunction(){
    if(paginationList.isEmpty) list(pageNumber)   ;

    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent==scrollController.offset){
        if(taskList!.isEmpty)return ;
        pageNumber++  ;
        list(pageNumber) ;
        emit(ListPaginationState());
      }
    });
  }


  void oneTask(String taskId) async {
    final result = await _listRepo.oneTask(taskId);
    result.when(success: (response) {
      oneTaskItem = response;
      emit(OneTaskSuccessState());
    }, failure: (error) {
      emit(ListErrorState(error));
    });
  }

  void createTask(context) async {
    final result = await _listRepo.createTask(CreateTaskModel(
        imageController.text,
        titleController.text,
        descController.text,
        priorityController.text,
        dueDateController.text));
    result.when(success: (response) {
      list(1);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      emit(ListSuccessState());
    }, failure: (error) {
      emit(ListErrorState(error));
    });
  }

  void editTask(context, String id) async {
    final result = await _listRepo.editTask(
        id,
        EditTaskModel(
            imageController.text,
            titleController.text,
            descController.text,
            priorityController.text,
            statusController.text,
            userController.text));
    result.when(success: (response) {
      list(1);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      emit(ListSuccessState());
    }, failure: (error) {
      emit(ListErrorState(error));
    });
  }

  void deleteTask(context, String id) async {
    final result = await _listRepo.deleteTask(id);
    result.when(success: (response) {
      list(1);
      emit(ListSuccessState());
    }, failure: (error) {
      emit(ListErrorState(error));
    });
  }

  void refreshToken(context) async {
    final result =
        await _listRepo.refreshToken(CacheHelper.getData(key: "refreshToken"));
    result.when(success: (response) {
      saveToken(response.accessToken!);
      paginationFunction();
      emit(ListSuccessState());
    }, failure: (error) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
      CacheHelper.removeData(key: "token");
      emit(ListErrorState(error));
    });
  }


  void saveToken(String token) {
    // setTokenIntoHeaderAfterLogin(token);
    // DioFactory dioFactory = DioFactory() ;

    CacheHelper.saveData(key: "token", value: token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
