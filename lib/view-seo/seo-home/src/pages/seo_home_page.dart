import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_home_bloc.dart';

class SeoHomePage extends StatelessWidget {
  const SeoHomePage({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SEOHomeBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(
        onInit: bloc.onInit,
        builder: (context, data) {
          return IHomeCell(
            model: bloc.model,
            taberChild: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bloc.model.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var model = bloc.model[index];
                return ITextButton(
                    padding: const EdgeInsets.all(5),
                    title: model.title ?? "",
                    icon: model.icon ?? Icons.home_sharp,
                    isIcon: true,
                    isSelect: index == bloc.selectIndex,
                    onPressed: () {
                      bloc.onTaber(index, model.namePath);
                      context.goNamed(
                        model.namePath ?? AppRouters.complaintNamed,
                      );
                    });
              },
            ),
            child: child,
          );
        },
      ),
    );
  }
}
