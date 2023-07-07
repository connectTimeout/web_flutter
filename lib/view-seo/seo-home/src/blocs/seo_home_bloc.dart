import 'package:flutter/cupertino.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';

class SEOHomeBloc with BodyMixin {
  int selectIndex = 0;
  Map<String, dynamic>? queryParameters;
  PagesScope pageScope = PagesScope();
  List<ITabBarModel> get model => [
        ITabBarModel(
          AppRouters.complaintNamed,
          title: "添加投诉域名",
          icon: CupertinoIcons.globe,
        ),
        ITabBarModel(
          AppRouters.addAccountNamed,
          title: "添加百度账号",
          icon: CupertinoIcons.chevron_left_slash_chevron_right,
        ),
        ITabBarModel(
          AppRouters.addServerNamed,
          title: "添加服务器",
          icon: CupertinoIcons.tray_arrow_down,
        ),
        ITabBarModel(
          AppRouters.addReasonNamed,
          title: "添加投诉理由",
          icon: CupertinoIcons.news,
        ),
        ITabBarModel(
          AppRouters.reasonDeletonNamed,
          title: "删除数据",
          icon: CupertinoIcons.square_stack_3d_up_slash_fill,
        ),
      ];

  void onTaber(int index, String? namePath) {
    selectIndex = index;
    onIndex(selectIndex);
    pageScope.update();
  }

  void onIndex(int index) async {
    var sp = await SpUtil.getInstance();
    sp?.putInt("index", index);
  }

  @override
  Future onInit() async {
    var sp = await SpUtil.getInstance();
    var selectInde = sp?.getInt("index");
    selectIndex = selectInde ?? 0;
    return selectIndex;
  }
}
