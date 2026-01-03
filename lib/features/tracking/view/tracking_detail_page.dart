import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:monee/core/bloc/tracking/tracking_bloc.dart';
import 'package:monee/core/enums/enum.dart';
import 'package:monee/core/extensions/extension.dart';
import 'package:monee/core/models/tracking_model.dart';
import 'package:monee/core/routes/routes.dart';
import 'package:monee/core/theme/spacing.dart';
import 'package:monee/l10n/l10n.dart';
import 'package:monee/widgets/widgets.dart';

class TrackingDetailPage extends StatelessWidget {
  const TrackingDetailPage({required this.tracking, super.key});

  final TrackingModel tracking;

  static MaterialPage<void> page({required TrackingModel tracking, Key? key}) =>
      MaterialPage<void>(
        child: TrackingDetailPage(
          key: key,
          tracking: tracking,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TrackingDetailView(
      tracking: tracking,
    );
  }
}

class TrackingDetailView extends StatefulWidget {
  const TrackingDetailView({required this.tracking, super.key});

  final TrackingModel tracking;

  @override
  State<TrackingDetailView> createState() => _TrackingDetailViewState();
}

class _TrackingDetailViewState extends State<TrackingDetailView> {
  Future<void> _showDeleteDialog() async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.remove),
        content: Text(context.l10n.are_u_sure_remove_tracking),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.colors.redPrimary,
            ),
            onPressed: () {
              context.read<TrackingBloc>().add(
                TrackingDelete(trackingId: widget.tracking.id),
              );
              context
                ..pop()
                ..pop();
            },
            child: Text(context.l10n.remove),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.detail),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.normal),
        child: Column(
          children: [
            // categories sector:
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CustomImage(
                color: widget.tracking.category.color,
                icon: widget.tracking.category.icon,
              ),
              title: Text(widget.tracking.category.title),
            ),
            const SizedBox(
              height: Spacing.m,
            ),
            // type tracking
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.type),
              trailing: Text(
                switch (widget.tracking.type) {
                  TrackingType.expense => l10n.expense.toUpperCase(),
                  TrackingType.income => l10n.income.toUpperCase(),
                  TrackingType.saving => l10n.saving.toUpperCase(),
                },
                style: context.textTheme.titleMedium?.copyWith(
                  color: widget.tracking.type.isExpense
                      ? context.colors.redPrimary
                      : context.colors.redPrimary,
                ),
              ),
            ),
            // amount tracking
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.amount),
              trailing: Text(
                '${widget.tracking.type.isExpense ? '-' : '+'} \$${widget.tracking.amount}',
              ),
            ),
            // date tracking
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.date),
              trailing: Text(_formatDate(widget.tracking.date)),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          spacing: Spacing.normal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                type: ButtonType.outline,
                onPress: () async {
                  await context.pushNamed(
                    Pages.trackingForm.name,
                    queryParameters: {
                      'tracking': widget.tracking.toJson(),
                      'category': widget.tracking.category.toJson(),
                    },
                  );
                },
                child: Text(l10n.edit),
              ),
            ),
            Expanded(
              child: CustomButton(
                onPress: _showDeleteDialog,
                child: Text(l10n.remove),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
