import 'package:financial_wellness/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Provides access to the [Cubit] controller
abstract class ControllerState<T extends StatefulWidget, C extends Cubit>
    extends State<T> {
  late final C controller = getIt.get<C>();
}
