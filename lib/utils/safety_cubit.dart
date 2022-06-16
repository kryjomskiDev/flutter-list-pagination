import 'package:bloc/bloc.dart';

abstract class ListPaginationAppCubit<State> extends BlocBase<State> {
  ListPaginationAppCubit(super._state);

  @override
  void emit(State state) {
    if (isClosed) {
      return;
    } else {
      super.emit(state);
    }
  }
}
