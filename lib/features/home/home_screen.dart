import 'package:flutter/material.dart';

import '../../utils/index.dart';
import '../inspector/inspector_screen.dart';
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
      ),
      HomeItem(
        title: 'CPU Profiler',
        icon: Octicons.dashboard,
      ),
      HomeItem(
        title: 'Memory',
        icon: Octicons.package,
      ),
      HomeItem(
        title: 'Debugger',
        icon: Octicons.bug,
      ),
      HomeItem(
        title: 'Network',
        icon: Icons.network_check,
      ),
      HomeItem(
        title: 'Logging',
        icon: Octicons.clippy,
      ),
      HomeItem(
        title: 'Provider',
        icon: Icons.attach_file,
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
        itemCount: homeItems.length,
        itemBuilder: (context, index) {
          final item = homeItems[index];
          return HomeItemWidget(item: item);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}
