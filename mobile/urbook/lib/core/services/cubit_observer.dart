import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    super.onChange(cubit, change);
    print('${cubit.runtimeType} state changed from ${change.currentState} to ${change.nextState}');
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    print('${cubit.runtimeType} encountered an error: $error');
  }
}

