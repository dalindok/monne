import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monee/features/record/record.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: RecordPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecordBloc(),
      child: const RecordView(),
    );
  }
}

class RecordView extends StatelessWidget {
  const RecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Record Page'),
          ),
        );
      },
    );
  }
}
