import 'package:default_project/domain/core/errors/failures.dart';
import 'package:default_project/presentation/bloc/app_cubit/app_cubit.dart';
import 'package:default_project/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      //Got back to the application - maybe reload data? ;)
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return state.map(
          loading: (state) => _loadedWidget(),
          success: (state) => _loadingWidget(),
          error: (state) => _errorWidget(state.failure),
        );
      },
    );
  }

  Widget _loadedWidget() {
    return HomePage();
  }

  Widget _errorWidget(Failure failure) {
    return Scaffold(
      body: Center(child: Text("Error: $failure")),
    );
  }

  Widget _loadingWidget() => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
