import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/logic/drop_down_cubit/drop_down_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownInitial());
}
