import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './src/bloc/helpers/main_bloc_delegate.dart';
import './src/bloc/blocs/todo/bloc.dart';
import './src/app.dart';

void main() {
  BlocSupervisor.delegate = MainBlocDelegate();
  runApp(
    BlocProviderTree(
      blocProviders: [
        BlocProvider<TodoBloc>(
          builder: (context) => TodoBloc(),
        ),
      ],
      child: App(),
    ),
  );
}
