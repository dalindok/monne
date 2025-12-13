import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monee/features/report/report.dart';
import 'package:monee/l10n/l10n.dart';

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
    final l10n = context.l10n;
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.report),
          ),
          body: const Center(
            child: Text('Report Page'),
          ),
        );
      },
    );
  }
}
