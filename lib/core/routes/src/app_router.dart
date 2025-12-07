import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monee/core/extensions/src/build_context_ext.dart';
import 'package:monee/core/routes/src/not_found_screen.dart';
import 'package:monee/features/dashboard/dashboard.dart';
import 'package:monee/features/record/record.dart';
import 'package:monee/features/report/report.dart';
import 'package:monee/features/setting/setting.dart';
import 'package:monee/features/splash/splash.dart';
import 'package:monee/features/tracking/tracking.dart';

enum Pages {
  // Splash
  splash,
  onboarding,
  app,
  //home
  dashboard,
  record,
  report,
  chart,
  addTracking,
  form,
  setting,
}

class AppRouter {
  AppRouter();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static late StatefulNavigationShell navigationBottomBarShell;

  static late ScrollController recordScrollController;

  static final dashboradShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'dashboard',
  );
  static final recordShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'record',
  );
  static final trackingShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'addTracking',
  );
  static final reportShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'report',
  );
  static final settingShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'setting',
  );

  static GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (kDebugMode) {
        print('route fullPath : ${state.fullPath}');
      }
      return null;
    },
    errorPageBuilder: (context, state) {
      return NotFoundScreen.page(key: state.pageKey);
    },
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        name: Pages.splash.name,
        path: '/',
        pageBuilder: (context, state) {
          return SplashPage.page(key: state.pageKey);
        },
      ),
      GoRoute(
        name: Pages.app.name,
        path: '/app',
        redirect: (context, state) {
          if (state.fullPath == '/app') {
            return '/app/dashboard';
          }
          return null;
        },
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              navigationBottomBarShell = navigationShell;
              return BottomNavigationPage(
                child: navigationShell,
              );
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: dashboradShellNavigatorKey,
                routes: [
                  GoRoute(
                    name: Pages.dashboard.name,
                    path: '/dashboard',
                    pageBuilder: (context, state) {
                      return DashboardPage.page(key: state.pageKey);
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: recordShellNavigatorKey,
                routes: [
                  GoRoute(
                    name: Pages.record.name,
                    path: 'record',
                    pageBuilder: (context, state) {
                      return RecordPage.page(key: state.pageKey);
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: reportShellNavigatorKey,
                routes: [
                  GoRoute(
                    name: Pages.report.name,
                    path: 'report',
                    pageBuilder: (context, state) {
                      return ReportPage.page(key: state.pageKey);
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: settingShellNavigatorKey,
                routes: [
                  GoRoute(
                    path: 'setting',
                    name: Pages.setting.name,
                    pageBuilder: (context, state) {
                      return SettingPage.page(
                        key: state.pageKey,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: Pages.addTracking.name,
            path: 'tracking',
            pageBuilder: (context, state) {
              return TrackingPage.page(key: state.pageKey);
            },
          ),
        ],
      ),
    ],
  );
}

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({required this.child, super.key});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.primary,
        child: Icon(
          Icons.add_rounded,
          color: context.colors.white,
        ),
        onPressed: () async {
          await context.pushNamed(
            Pages.addTracking.name,
          );
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: context.colors.primary,
        notchSmoothness: NotchSmoothness.sharpEdge,
        gapLocation: GapLocation.center,
        blurEffect: true,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: context.colors.white,
        inactiveColor: context.colors.white.withValues(alpha: 0.5),

        icons: const [
          Icons.dashboard_rounded,
          Icons.receipt_long_rounded,
          Icons.bar_chart_rounded,
          Icons.settings_rounded,
        ],
        activeIndex: child.currentIndex,
        onTap: (index) {
          if (index == child.currentIndex) return;
          child.goBranch(
            index,
            initialLocation: index == child.currentIndex,
          );
        },
      ),
      body: child,
    );
  }
}
