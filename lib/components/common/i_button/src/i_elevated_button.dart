import 'package:flutter/material.dart';
import 'package:web_flutter/consts/consts.dart';

class IElevatedButton extends StatefulWidget {
  const IElevatedButton({
    required this.title,
    required this.icon,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  State<IElevatedButton> createState() => _IElevatedButtonState();
}

class _IElevatedButtonState extends State<IElevatedButton> {
  bool onHover = false;

  Color? get colors {
    return onHover ? Colors.white : Globals.oceanBlue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onHover ? Globals.oceanBlue : Colors.white60,
        ),
        onPressed: widget.onPressed,
        onHover: (value) {
          setState(() {
            onHover = !onHover;
          });
        },
        child: Padding(
          padding: onHover
              ? const EdgeInsets.symmetric(horizontal: 11, vertical: 5)
              : const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            children: [
              Icon(
                widget.icon,
                color: colors,
                size: 26,
              ),
              const SizedBox(height: 2),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colors,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IFunctionButton extends StatefulWidget {
  const IFunctionButton({
    required this.title,
    required this.icon,
    this.isSelect = true,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isSelect;
  final void Function()? onPressed;

  @override
  State<IFunctionButton> createState() => _IFunctionButtonState();
}

class _IFunctionButtonState extends State<IFunctionButton> {
  bool onHover = false;

  Color? get colors {
    return onHover ? Colors.white : Globals.oceanBlue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: widget.isSelect
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Globals.oceanBlue,
              ),
              onPressed: widget.onPressed,
              onHover: (value) {
                setState(() {
                  onHover = !onHover;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                child: Column(
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 26,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: onHover
                            ? Colors.white
                            : const Color.fromARGB(255, 252, 250, 157),
                      ),
                    )
                  ],
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: onHover ? Globals.oceanBlue : Colors.white60,
              ),
              onPressed: widget.onPressed,
              onHover: (value) {
                setState(() {
                  onHover = !onHover;
                });
              },
              child: Padding(
                padding: onHover
                    ? const EdgeInsets.symmetric(horizontal: 11, vertical: 5)
                    : const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  children: [
                    Icon(
                      widget.icon,
                      color: colors,
                      size: 26,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class IExpensiveButtons extends StatefulWidget {
  const IExpensiveButtons({
    super.key,
    this.title,
    this.icon,
    this.iconSize = 20,
    this.onPressed,
    this.selectBackgroundColor = const Color.fromARGB(255, 240, 240, 240),
    this.uncheckBackgroundColor = const Color.fromARGB(255, 240, 240, 240),
    this.selectLabelColor = Colors.blue,
    this.uncheckLabelColor = Colors.black,
    this.selectIconColor = Colors.blue,
    this.uncheckIconColor = Colors.black,
  });
  final String? title;
  final IconData? icon;
  final double iconSize;
  final VoidCallback? onPressed;

  ///选中背景
  final Color? selectBackgroundColor;

  ///未选中背景
  final Color? uncheckBackgroundColor;

  ///[title] 选中
  final Color? selectLabelColor;

  ///[title] 选中
  final Color? uncheckLabelColor;

  ///[icon] 选中
  final Color? selectIconColor;

  ///[icon] 选中
  final Color? uncheckIconColor;

  @override
  State<IExpensiveButtons> createState() => _IExpensiveButtonsState();
}

class _IExpensiveButtonsState extends State<IExpensiveButtons> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onHover: (e) {
        setState(() {
          onHover = !onHover;
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 14,
        )),
        backgroundColor: MaterialStateProperty.all(
          onHover
              ? widget.selectBackgroundColor
              : widget.uncheckBackgroundColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      label: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          widget.title ?? '',
          style: TextStyle(
              color:
                  onHover ? widget.selectLabelColor : widget.uncheckLabelColor),
        ),
      ),
      icon: Icon(
        widget.icon,
        color: onHover ? widget.selectIconColor : widget.uncheckIconColor,
        size: widget.iconSize,
      ),
    );
  }
}

class ITextButton extends StatefulWidget {
  const ITextButton({
    this.title,
    this.icon,
    this.onPressed,
    this.isSelect = false,
    this.isIcon = false,
    Key? key,
    this.color = Colors.transparent,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final void Function()? onPressed;
  final bool isSelect;
  final Color color;
  final bool isIcon;

  @override
  State<ITextButton> createState() => _ITextButtonState();
}

class _ITextButtonState extends State<ITextButton> {
  bool onHover = false;

  Color? get colors {
    return onHover ? Colors.white : const Color.fromARGB(255, 80, 197, 162);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.isSelect
                ? Colors.greenAccent
                : onHover
                    ? const Color.fromARGB(255, 80, 197, 162)
                    : const Color.fromARGB(255, 177, 177, 177)),
        onPressed: widget.onPressed,
        onHover: (value) {
          setState(() {
            onHover = !onHover;
          });
        },
        child: widget.isIcon
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  children: [
                    Icon(
                      widget.icon,
                      color: colors,
                      size: 26,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.title ?? '-',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors,
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.language,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.title?.substring(0, 1) ?? "-",
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class ITextTabBarCell extends StatelessWidget {
  const ITextTabBarCell({
    this.title,
    this.onPressed,
    this.isSelect = false,
    Key? key,
  }) : super(key: key);

  final String? title;
  final void Function()? onPressed;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: !isSelect
                  ? [
                      Colors.white12,
                      Colors.white38,
                      Colors.white,
                      Colors.white38,
                      Colors.white12,
                    ]
                  : [
                      Colors.white,
                      Colors.white,
                    ],
            ),
          ),
          child: Text(
            title ?? "-",
            style: const TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
