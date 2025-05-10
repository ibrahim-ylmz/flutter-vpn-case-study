import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This class is used to initialize the Bloc providers
class BlocInitialize extends StatelessWidget {
  /// This class is used to initialize the Bloc providers
  const BlocInitialize({required this.child, super.key});

  /// This method is used to initialize the Bloc providers
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [], child: child);
  }
}
