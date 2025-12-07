import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monee/features/report/report.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: ReportPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportBloc(),
      child: const ReportView(),
    );
  }
}

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Report Page'),
          ),
        );
      },
    );
  }
}
