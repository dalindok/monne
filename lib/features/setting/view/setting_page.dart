import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monee/features/setting/setting.dart';
import 'package:monee/l10n/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: SettingPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingBloc(),
      child: const SettingView(),
    );
  }
}

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        final l10n = context.l10n;
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.setting),
          ),
          body: const Center(
            child: Text('Setting Page'),
          ),
        );
      },
    );
  }
}
