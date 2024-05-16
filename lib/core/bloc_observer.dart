import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/log.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    Log.information('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    Log.information('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    Log.information('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    Log.information('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Log.information('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    Log.information('onClose -- ${bloc.runtimeType}');
  }
}
