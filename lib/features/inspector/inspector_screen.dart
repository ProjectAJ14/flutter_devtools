import 'package:flutter/material.dart';

import '../../utils/index.dart';
import 'widgets/animal_image_widget.dart';
import 'widgets/mix_loading_widget.dart';

class InspectorScreen extends StatelessWidget {
  const InspectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: const CustomAppBar(
          height: 112,
          title: 'Flutter Inspector',
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Layout',
              ),
              Tab(
                text: 'Animation',
              ),
              Tab(
                text: 'Guidelines',
              ),
              Tab(
                text: 'Repaint',
              ),
              Tab(
                text: 'Images',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('-'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('0'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('+'),
                      ),
                    ],
                  ),
                  // const MixLoadingWidget(),
                ],
              ),
              const MixLoadingWidget(),
              Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(
                              Icons.image,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          title: Text(
                            'Image $index',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Image $index',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: MixLoadingWidget()),
                        Expanded(
                          child: Icon(
                            Icons.image,
                            size: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.image,
                            size: 100,
                          ),
                        ),
                        Expanded(child: MixLoadingWidget()),
                      ],
                    ),
                  ),
                ],
              ),
              const AnimalImageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
