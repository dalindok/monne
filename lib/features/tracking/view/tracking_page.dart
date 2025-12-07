import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monee/features/tracking/tracking.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: TrackingPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrackingBloc(),
      child: const TrackingView(),
    );
  }
}

class TrackingView extends StatelessWidget {
  const TrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingBloc, TrackingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Tracking'),
          ),
          body: const Center(
            child: Text('Add Tracking Page'),
          ),
        );
      },
    );
  }
}
