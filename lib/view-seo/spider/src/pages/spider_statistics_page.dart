import 'package:flutter/widgets.dart';

class SpiderStatisticsPage extends StatelessWidget {
  const SpiderStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("实时蜘蛛：any111.top"),
          Text("蜘蛛走势：any111.top"),
        ],
      ),
    );
  }
}
