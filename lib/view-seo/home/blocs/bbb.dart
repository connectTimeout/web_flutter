import 'dart:convert';

import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/home/components/drawer_model.dart';

class BBBBloc with BodyMixin {
  BBBBloc(DrawerModel? args) : _args = args;
  final DrawerModel? _args;
  PagesScope pageScope = PagesScope();
  DrawerModel get model => _args!;
}
