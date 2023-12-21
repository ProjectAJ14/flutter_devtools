import 'package:flutter/material.dart';
import 'package:flutter_devtools/features/memory/memory_screen.dart';

import '../../utils/index.dart';
import '../cpu_profile/cpu_profile_screen.dart';
import '../inspector/inspector_screen.dart';
import '../network/home/network_home_screen.dart';
import '../performance/performance_screen.dart';
import 'widgets/home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeItem> homeItems = [
      HomeItem(
          title: 'Flutter Inspector',
          icon: Octicons.deviceMobile,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InspectorScreen(),
              ),
            );
          }),
      HomeItem(
        title: 'Performance',
        icon: Octicons.pulse,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PerformanceScreen(),
            ),
          );
        },
      ),
      HomeItem(
        title: 'CPU Profiler',
        icon: Octicons.dashboard,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CpuProfileScreen(),
            ),
          );
        },
      ),
      HomeItem(
        title: 'Memory',
        icon: Octicons.package,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MemoryScreen(),
            ),
          );
        },
      ),
      HomeItem(
        title: 'Debugger',
        icon: Octicons.bug,
      ),
      HomeItem(
        title: 'Network',
        icon: Icons.network_check,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const NetworkHomeScreen();
              },
            ),
          );
        },
      ),
      HomeItem(
        title: 'Logging',
        icon: Octicons.clippy,
      ),
      HomeItem(
        title: 'App Size',
        icon: Octicons.fileZip,
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Flutter Jaipur Event | Dec 2023',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: homeItems.length,
        itemBuilder: (context, index) {
          final item = homeItems[index];
          return HomeItemWidget(item: item);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}
