import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_pagination/injectable/injectable.dart';
import 'package:list_pagination/presentation/pages/main_page/cubit/main_page_cubit.dart';
import 'package:list_pagination/presentation/pages/main_page/cubit/main_page_state.dart';
import 'package:list_pagination/presentation/pages/main_page/widgets/colors_list.dart';
import 'package:list_pagination/presentation/widgets/app_loading_indicator.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocProvider<MainPageCubit>(
            create: (context) => getIt<MainPageCubit>()..init(),
            child: const _MainPageBody(),
          ),
        ),
      );
}

class _MainPageBody extends StatelessWidget {
  const _MainPageBody();

  @override
  Widget build(BuildContext context) => BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) => state.maybeWhen(
          init: () => const AppLoadingIndicator(),
          loaded: () => _buildColorList(context, isLoading: false),
          loading: () => _buildColorList(context, isLoading: true),
          orElse: () => const SizedBox.shrink(),
        ),
      );

  Widget _buildColorList(BuildContext context, {required bool isLoading}) => ColorsList(
        isLoading: isLoading,
        colors: context.read<MainPageCubit>().colors,
        controller: context.read<MainPageCubit>().scrollController,
      );
}
