import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papaya_racing/features/navigation/navigation.cubit.dart';
import 'package:papaya_racing/features/standing/presentation/pages/standing.screen.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PRNavigationBarItem> itemsNavBar = [
      const PRNavigationBarItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        label: 'Home',
      ),
      const PRNavigationBarItem(
        icon: Icons.leaderboard_outlined,
        activeIcon: Icons.leaderboard,
        label: 'Standings',
      ),
      const PRNavigationBarItem(
        icon: Icons.schedule_outlined,
        activeIcon: Icons.schedule,
        label: 'Schedule',
      ),
      const PRNavigationBarItem(
        icon: Icons.person_outline,
        activeIcon: Icons.person,
        label: 'Profile',
      ),
    ];
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: F1SemanticColors.grey100,

            appBar: AppBar(
              title: const Text('Papaya Racing'),
              backgroundColor: F1TeamColors.mclaren.primary,
            ),
            body: IndexedStack(
              index: state,
              children: const [
                Center(child: Text('Home Screen')),
                StandingScreen(),
                Center(child: Text('Schedule Screen')),
                Center(child: Text('Profile Screen')),
              ],
            ),
            bottomNavigationBar: PRNavigationBar(
              currentIndex: state,
              items: itemsNavBar,
              onTap: (index) {
                context.read<NavigationCubit>().updateIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
