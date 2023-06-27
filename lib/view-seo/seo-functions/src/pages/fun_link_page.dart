import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-functions/functions.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

class FunLinkPage extends StatelessWidget {
  const FunLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FunLinkBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(
        builder: (context, scope, child) {
          return StatisticsCell(
            isSiteName: false,
            isChild: true,
            child: [
              ...bloc.linksList.map(
                (e) => ITextRadio(
                  value: e.value,
                  title: e.title,
                  groupValue: bloc.groupValueOption,
                  onChanged: (value) => bloc.onChanged(value),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
