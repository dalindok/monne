import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:monee/core/bloc/budget/budget_bloc.dart';
import 'package:monee/core/bloc/tracking/tracking_bloc.dart';
import 'package:monee/core/enums/enum.dart';
import 'package:monee/core/extensions/extension.dart';
import 'package:monee/core/routes/routes.dart';
import 'package:monee/l10n/l10n.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: ReportPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const ReportView();
  }
}

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.report),
      ),
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, budgetState) {
          return BlocBuilder<TrackingBloc, TrackingState>(
            builder: (context, trackingState) {
              final now = DateTime.now();
              final currentYear = now.year;
              final currentMonth = now.month;

              final monthlyTrackings = trackingState.allTrackings.where((
                tracking,
              ) {
                try {
                  final date = DateTime.parse(tracking.date);
                  return date.year == currentYear && date.month == currentMonth;
                } on Exception catch (_) {
                  return false;
                }
              }).toList();

              const initValue = 0.0;
              final totalExpense = monthlyTrackings
                  .where((t) => t.type == TrackingType.expense)
                  .fold(initValue, (sum, t) => sum + t.amount);
              final totalIncome = monthlyTrackings
                  .where((t) => t.type == TrackingType.income)
                  .fold(initValue, (sum, t) => sum + t.amount);
              final balance = totalIncome - totalExpense;

              // Assuming a monthly budget of $5000 for demonstration
              final monthlyBudget = budgetState.budgets.first.budget;
              final remaining = monthlyBudget - totalExpense;
              final remainingPercentage = (remaining / monthlyBudget).clamp(
                0.0,
                1.0,
              );

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await context.pushNamed(Pages.trackingBalance.name);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$currentYear',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  DateFormat.MMMM().format(now),
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: context.colors.darkShadeGrey60,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  l10n.expense,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: context.colors.redPrimary,
                                      ),
                                ),
                                Text(
                                  '\$${totalExpense.toStringAsFixed(2)}',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: context.colors.redPrimary,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  l10n.income,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: context.colors.greenPrimary,
                                      ),
                                ),
                                Text(
                                  '\$${totalIncome.toStringAsFixed(2)}',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: context.colors.greenPrimary,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  l10n.balance,
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  '\$${balance.toStringAsFixed(2)}',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: balance >= 0
                                            ? context.colors.greenPrimary
                                            : context.colors.redPrimary,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Monthly Budget
                    InkWell(
                      onTap: () async {
                        await context.pushNamed(Pages.budget.name);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Row(
                          children: [
                            // Circular Progress Indicator
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CircularProgressIndicator(
                                      value: remainingPercentage,
                                      backgroundColor: Colors.grey.shade300,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        remaining >= 0
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      strokeWidth: 8,
                                    ),
                                  ),
                                  Align(
                                    child: remainingPercentage > 0
                                        ? Text(
                                            '${(remainingPercentage * 100).toStringAsFixed(0)}%',
                                          )
                                        : const Text('--'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Budget Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${l10n.budget}: \$${monthlyBudget.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  Text(
                                    '${l10n.expense}: \$${totalExpense.toStringAsFixed(2)}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                    '${l10n.income}: \$${remaining.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: remaining >= 0
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
