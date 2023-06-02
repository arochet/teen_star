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
      componentName: title,
      child: Column(children: [
        ...list
            .map((item) => GestureDetector(
                  onTap: item.enable ? item.onTap : null,
                  child: Container(
                    color: colorpanel(900),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        if (item.icon != null)
                          Icon(item.icon, color: item.enable ? actioncolor['primary'] : colorpanel(400)),
                        SizedBox(width: 10),
                        Text(item.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: item.enable ? actioncolor['primary'] : colorpanel(400))),
                        Expanded(child: Container()),
                        SizedBox(width: 10),
                        if (item.onTap != null)
                          Icon(Icons.arrow_forward_ios,
                              color: item.enable ? colorpanel(100) : colorpanel(400), size: 15),
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
