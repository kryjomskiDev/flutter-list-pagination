import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:list_pagination/domain/get_colors_list_use_case.dart';
import 'package:list_pagination/presentation/pages/main_page/cubit/main_page_state.dart';
import 'package:list_pagination/utils/safety_cubit.dart';

@injectable
class MainPageCubit extends ListPaginationAppCubit<MainPageState> {
  final GetColorsListUseCase _getColorsListUseCase;
  final ScrollController scrollController;

  MainPageCubit(
    this._getColorsListUseCase,
    this.scrollController,
  ) : super(const MainPageState.init());

  final colors = <Color>[];

  static const len = 20;

  Future<void> init() async {
    scrollController.addListener(scrollControllerListener);
    colors.addAll(await _getColorsListUseCase(len));
    emit(const MainPageState.loaded());
  }

  Future<void> scrollControllerListener() async {
    if (state is MainPageStateLoaded && scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      emit(const MainPageState.loading());
      colors.addAll(await _getColorsListUseCase(len));
      emit(const MainPageState.loaded());
    }
  }
}
