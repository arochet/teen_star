import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class ItemPanelList {
  final IconData? icon;
  final String title;
  final Function()? onTap;
  final bool enable;

  ItemPanelList({required this.title, this.icon, this.onTap, this.enable = true});
}

class PanelList extends StatelessWidget {
  final List<ItemPanelList> list;
  final ElevatedButton? button;
  final String title;
  const PanelList({Key? key, required this.list, required this.title, this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      title: title,
      child: Column(children: [
        ...list
            .map((item) => GestureDetector(
                  onTap: item.enable ? item.onTap : null,
                  child: Container(
                    color: colorpanel(800),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        if (item.icon != null)
                          Icon(item.icon, color: item.enable ? colorpanel(200) : colorpanel(400)),
                        SizedBox(width: 10),
                        Text(item.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: item.enable ? colorpanel(50) : colorpanel(400))),
                      ],
                    ),
                  ),
                ))
            .toList(),
        button ?? Container(),
      ]),
    );
  }
}
