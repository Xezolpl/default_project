import 'package:bloc/bloc.dart';
import 'package:default_project/domain/core/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.loading());
}

@freezed
abstract class AppState with _$AppState {
  const factory AppState.loading() = _Initial;
  const factory AppState.success() = _Success;
  const factory AppState.error(Failure failure) = _Error;
}
