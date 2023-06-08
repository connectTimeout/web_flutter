import 'package:flutter/material.dart';

class INavigationDrawer extends StatelessWidget {
  const INavigationDrawer({
    super.key,
    required this.children,
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.indicatorColor,
    this.indicatorShape,
    this.onDestinationSelected,
    this.selectedIndex = 0,
  });

  final Color? backgroundColor;

  final Color? shadowColor;

  final Color? surfaceTintColor;

  final double? elevation;

  final Color? indicatorColor;

  final ShapeBorder? indicatorShape;

  final List<Widget> children;

  final int? selectedIndex;

  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final int totalNumberOfDestinations =
        children.whereType<INavigationDrawerDestination>().toList().length;

    int destinationIndex = 0;
    final List<Widget> wrappedChildren = <Widget>[];
    Widget wrapChild(Widget child, int index) => _ISelectableAnimatedBuilder(
        duration: const Duration(milliseconds: 500),
        isSelected: index == selectedIndex,
        builder: (BuildContext context, Animation<double> animation) {
          return _INavigationDrawerDestinationInfo(
            index: index,
            totalNumberOfDestinations: totalNumberOfDestinations,
            selectedAnimation: animation,
            indicatorColor: indicatorColor,
            indicatorShape: indicatorShape,
            onTap: () {
              if (onDestinationSelected != null) {
                onDestinationSelected!(index);
              }
            },
            child: child,
          );
        });

    for (int i = 0; i < children.length; i++) {
      if (children[i] is! INavigationDrawerDestination) {
        wrappedChildren.add(children[i]);
      } else {
        wrappedChildren.add(wrapChild(children[i], destinationIndex));
        destinationIndex += 1;
      }
    }

    return Drawer(
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      child: SafeArea(
        bottom: false,
        child: ListView(
          children: wrappedChildren,
        ),
      ),
    );
  }
}

class INavigationDrawerDestination extends StatelessWidget {
  const INavigationDrawerDestination({
    super.key,
    this.backgroundColor,
    this.selectedIcon,
    required this.label,
  });

  final Color? backgroundColor;

  final Widget? selectedIcon;

  final Widget label;

  @override
  Widget build(BuildContext context) {
    const Set<MaterialState> selectedState = <MaterialState>{
      MaterialState.selected
    };
    const Set<MaterialState> unselectedState = <MaterialState>{};

    final NavigationDrawerThemeData navigationDrawerTheme =
        NavigationDrawerTheme.of(context);
    final NavigationDrawerThemeData defaults =
        _INavigationDrawerDefaultsM3(context);

    final Animation<double> animation =
        _INavigationDrawerDestinationInfo.of(context).selectedAnimation;

    return _INavigationDestinationBuilder(
      buildLabel: (BuildContext context) {
        final TextStyle? effectiveSelectedLabelTextStyle =
            navigationDrawerTheme.labelTextStyle?.resolve(selectedState) ??
                defaults.labelTextStyle!.resolve(selectedState);
        final TextStyle? effectiveUnselectedLabelTextStyle =
            navigationDrawerTheme.labelTextStyle?.resolve(unselectedState) ??
                defaults.labelTextStyle!.resolve(unselectedState);
        return DefaultTextStyle(
          style: _isForwardOrCompleted(animation)
              ? effectiveSelectedLabelTextStyle!
              : effectiveUnselectedLabelTextStyle!,
          child: label,
        );
      },
    );
  }
}

class _INavigationDestinationBuilder extends StatelessWidget {
  const _INavigationDestinationBuilder({
    required this.buildLabel,
  });

  final WidgetBuilder buildLabel;

  @override
  Widget build(BuildContext context) {
    final _INavigationDrawerDestinationInfo info =
        _INavigationDrawerDestinationInfo.of(context);
    final NavigationDrawerThemeData navigationDrawerTheme =
        NavigationDrawerTheme.of(context);
    final NavigationDrawerThemeData defaults =
        _INavigationDrawerDefaultsM3(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: _INavigationDestinationSemantics(
        child: SizedBox(
          height: 50,
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: info.onTap,
            customBorder: info.indicatorShape ??
                navigationDrawerTheme.indicatorShape ??
                defaults.indicatorShape!,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                NavigationIndicator(
                  animation: info.selectedAnimation,
                  color: info.indicatorColor ??
                      navigationDrawerTheme.indicatorColor ??
                      defaults.indicatorColor!,
                  shape: info.indicatorShape ??
                      navigationDrawerTheme.indicatorShape ??
                      defaults.indicatorShape!,
                  width: double.infinity,
                  height: (navigationDrawerTheme.indicatorSize ??
                          defaults.indicatorSize!)
                      .height,
                ),
                buildLabel(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _INavigationDestinationSemantics extends StatelessWidget {
  const _INavigationDestinationSemantics({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final _INavigationDrawerDestinationInfo destinationInfo =
        _INavigationDrawerDestinationInfo.of(context);
    return _IStatusTransitionWidgetBuilder(
      animation: destinationInfo.selectedAnimation,
      builder: (BuildContext context, Widget? child) {
        return Semantics(
          selected: _isForwardOrCompleted(destinationInfo.selectedAnimation),
          container: true,
          child: child,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          Semantics(
            label: localizations.tabLabel(
              tabIndex: destinationInfo.index + 1,
              tabCount: destinationInfo.totalNumberOfDestinations,
            ),
          ),
        ],
      ),
    );
  }
}

class _IStatusTransitionWidgetBuilder extends StatusTransitionWidget {
  const _IStatusTransitionWidgetBuilder({
    required super.animation,
    required this.builder,
    this.child,
  });

  final TransitionBuilder builder;

  final Widget? child;

  @override
  Widget build(BuildContext context) => builder(context, child);
}

class _INavigationDrawerDestinationInfo extends InheritedWidget {
  const _INavigationDrawerDestinationInfo({
    required this.index,
    required this.totalNumberOfDestinations,
    required this.selectedAnimation,
    required this.indicatorColor,
    required this.indicatorShape,
    required this.onTap,
    required super.child,
  });

  final int index;

  final int totalNumberOfDestinations;

  final Animation<double> selectedAnimation;

  final Color? indicatorColor;

  final ShapeBorder? indicatorShape;

  final VoidCallback onTap;

  static _INavigationDrawerDestinationInfo of(BuildContext context) {
    final _INavigationDrawerDestinationInfo? result =
        context.dependOnInheritedWidgetOfExactType<
            _INavigationDrawerDestinationInfo>();
    assert(
      result != null,
      'Navigation destinations need a _NavigationDrawerDestinationInfo parent, '
      'which is usually provided by NavigationDrawer.',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(_INavigationDrawerDestinationInfo oldWidget) {
    return index != oldWidget.index ||
        totalNumberOfDestinations != oldWidget.totalNumberOfDestinations ||
        selectedAnimation != oldWidget.selectedAnimation ||
        onTap != oldWidget.onTap;
  }
}

class _ISelectableAnimatedBuilder extends StatefulWidget {
  const _ISelectableAnimatedBuilder({
    required this.isSelected,
    this.duration = const Duration(milliseconds: 200),
    required this.builder,
  });

  final bool isSelected;

  final Duration duration;

  final Widget Function(BuildContext, Animation<double>) builder;

  @override
  _ISelectableAnimatedBuilderState createState() =>
      _ISelectableAnimatedBuilderState();
}

class _ISelectableAnimatedBuilderState
    extends State<_ISelectableAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = widget.duration;
    _controller.value = widget.isSelected ? 1.0 : 0.0;
  }

  @override
  void didUpdateWidget(_ISelectableAnimatedBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _controller,
    );
  }
}

bool _isForwardOrCompleted(Animation<double> animation) {
  return animation.status == AnimationStatus.forward ||
      animation.status == AnimationStatus.completed;
}

class _INavigationDrawerDefaultsM3 extends NavigationDrawerThemeData {
  _INavigationDrawerDefaultsM3(this.context)
      : super(
          elevation: 1.0,
          tileHeight: 56.0,
          indicatorShape: const StadiumBorder(),
          indicatorSize: const Size(336.0, 56.0),
        );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  @override
  Color? get backgroundColor => _colors.surface;

  @override
  Color? get surfaceTintColor => _colors.surfaceTint;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get indicatorColor => _colors.secondaryContainer;

  @override
  MaterialStateProperty<IconThemeData?>? get iconTheme {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return IconThemeData(
        size: 24.0,
        color: states.contains(MaterialState.selected)
            ? null
            : _colors.onSurfaceVariant,
      );
    });
  }

  @override
  MaterialStateProperty<TextStyle?>? get labelTextStyle {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      final TextStyle style = _textTheme.labelLarge!;
      return style.apply(
        color: states.contains(MaterialState.selected)
            ? _colors.onSecondaryContainer
            : _colors.onSurfaceVariant,
      );
    });
  }
}
