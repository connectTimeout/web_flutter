import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

class FriendlyLinksPage extends StatelessWidget {
  const FriendlyLinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FriendlyLinksBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
        value: bloc.pageScope,
        child: Consumer<PagesScope>(builder: (context, scope, child) {
          return StatisticsCell(
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
        }));
  }
}
