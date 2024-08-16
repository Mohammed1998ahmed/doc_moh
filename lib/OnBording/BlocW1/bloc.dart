import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class W1Cubitt extends Cubit<AppStates> {
  W1Cubitt() : super(InitW1());

  static W1Cubitt get(context) => BlocProvider.of(context);
  bool isbutton = true;
  void changButton(bool button) {
    this.isbutton = button;
    emit(Chaingbutton());
  }
}
