import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import './src/bloc/helpers/main_bloc_delegate.dart';
import './src/app.dart';

void main() {
  BlocSupervisor.delegate = MainBlocDelegate();
  runApp(App());
}
