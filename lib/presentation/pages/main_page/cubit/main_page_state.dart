import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_page_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState.init() = MainPageStateInit;
  const factory MainPageState.loading() = MainPageStateLoading;
  const factory MainPageState.loaded() = MainPageStateLoaded;
}
