import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-functions/functions.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

class FunAdvertisementPage extends StatelessWidget {
  const FunAdvertisementPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FunAdvertisementBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(
        builder: (context, scope, child) {
          return const StatisticsCell(
            isSiteName: false,
          );
        },
      ),
    );
  }
}
