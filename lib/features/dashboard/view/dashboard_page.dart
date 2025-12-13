import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monee/core/common/common.dart' hide Icons;
import 'package:monee/core/extensions/extension.dart';
import 'package:monee/core/theme/spacing.dart';

import 'package:monee/features/dashboard/dashboard.dart';
import 'package:monee/l10n/l10n.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: DashboardPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  String _getGreeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return '${context.l10n.good_morning} 🌅';
    } else if (hour < 17) {
      return '${context.l10n.good_afternoon} 🫖';
    } else if (hour < 21) {
      return '${context.l10n.good_evening} 🌆';
    } else {
      return '${context.l10n.good_night} 🌃';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final l10n = context.l10n;
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Animated AppBar with greeting
              SliverAppBar(
                expandedHeight: 120,
                pinned: true,
                backgroundColor: Theme.of(context).colorScheme.primary,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    _getGreeting(context),
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(
                    left: Spacing.normal,
                    bottom: Spacing.normal,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Dashboard Content
              SliverPadding(
                padding: const EdgeInsets.all(Spacing.normal),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: Spacing.s),

                    // Records Section
                    _AnimatedDashboardCard(
                      delay: 100,
                      child: _DashboardSection(
                        icon: Icons.receipt_long,
                        title: l10n.record,
                        description: l10n.view_all_record,
                        color: Colors.blue,
                        onTap: () {
                          // Navigate to records
                        },
                      ),
                    ),

                    const SizedBox(height: Spacing.normal),

                    // Add Transaction Section
                    _AnimatedDashboardCard(
                      delay: 200,
                      child: _DashboardSection(
                        icon: Icons.add_circle,
                        title: l10n.add_tracking,
                        description: l10n.record_new_tracking,
                        color: Colors.green,
                        onTap: () {
                          // Navigate to add transaction
                        },
                      ),
                    ),

                    const SizedBox(height: Spacing.normal),

                    // Reports Section
                    _AnimatedDashboardCard(
                      delay: 300,
                      child: _DashboardSection(
                        icon: Icons.bar_chart,
                        title: l10n.report,
                        description: l10n.view_insights_analytics,
                        color: Colors.purple,
                        onTap: () {
                          // Navigate to reports
                        },
                      ),
                    ),

                    const SizedBox(height: Spacing.l1),

                    // Quick Stats Section
                    _AnimatedDashboardCard(
                      delay: 400,
                      child: Container(
                        padding: const EdgeInsets.all(Spacing.l),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: kBorderRadius,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.quick_stats,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: Spacing.normal),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _StatItem(
                                  label: l10n.income,
                                  value: r'$5,420',
                                  color: Colors.green,
                                ),
                                _StatItem(
                                  label: l10n.expenses,
                                  value: r'$3,210',
                                  color: Colors.red,
                                ),
                                _StatItem(
                                  label: l10n.balance,
                                  value: r'$2,210',
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AnimatedDashboardCard extends StatefulWidget {
  const _AnimatedDashboardCard({
    required this.child,
    this.delay = 0,
  });

  final Widget child;
  final int delay;

  @override
  State<_AnimatedDashboardCard> createState() => _AnimatedDashboardCardState();
}

class _AnimatedDashboardCardState extends State<_AnimatedDashboardCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
          ),
        );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
          ),
        );

    Future.delayed(Duration(milliseconds: widget.delay), () async {
      if (mounted) {
        await _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

class _DashboardSection extends StatelessWidget {
  const _DashboardSection({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(Spacing.l),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: kBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),
            const SizedBox(width: Spacing.normal),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: Spacing.s),
        Text(
          value,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
