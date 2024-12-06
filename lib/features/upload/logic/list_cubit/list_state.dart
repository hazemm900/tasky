import 'package:tasky/core/networking/api_error_model.dart';

sealed class ListState {}

final class ListInitial extends ListState {}

final class ListSuccessState extends ListState {}

final class ListErrorState extends ListState {
   final ApiErrorModel apiErrorModel;

  ListErrorState(this.apiErrorModel);
}

final class OneTaskSuccessState extends ListState {}


final class ListLoadingState extends ListState {}

final class ListPaginationState extends ListState {}
