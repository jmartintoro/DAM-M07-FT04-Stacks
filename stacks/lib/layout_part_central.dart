import 'package:cupertino_base/widget_popover.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({Key? key}) : super(key: key);

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

class LayoutPartCentralState extends State<LayoutPartCentral> {
  final GlobalKey _settingsButtonKey = GlobalKey();
  Color centralTextColor = CupertinoColors.black; // Variable para el color del texto "Central"

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: appData.toggleSidebarLeft,
          child: Icon(
            CupertinoIcons.sidebar_left,
            color: appData.isSidebarLeftVisible
                ? CupertinoColors.activeBlue
                : CupertinoColors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
        
        middle: CupertinoButton(
          key: _settingsButtonKey,
          padding: const EdgeInsets.all(0.0),
          onPressed: () {
            WidgetPopover.showPopover(
                context: context,
                key: _settingsButtonKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          centralTextColor = CupertinoColors.black; 
                          setState(() {}); 
                          WidgetPopover.hidePopover();
                        },
                        child: Text('Negro'),
                      ),
                      GestureDetector(
                        onTap: () {
                          centralTextColor = CupertinoColors.systemRed; 
                          setState(() {}); 
                          WidgetPopover.hidePopover();
                        },
                        child: Text('Rojo'),
                      ),
                      GestureDetector(
                        onTap: () {
                          centralTextColor = CupertinoColors.systemGreen; 
                          setState(() {}); 
                          WidgetPopover.hidePopover();
                        },
                        child: Text('Verde'),
                      ),
                      GestureDetector(
                        onTap: () {
                          centralTextColor = CupertinoColors.systemBlue; 
                          setState(() {}); 
                          WidgetPopover.hidePopover();
                        },
                        child: Text('Azul'),
                      ),
                    ],
                  ),
                ));
          },
          child: const Icon(
            CupertinoIcons.settings,
            color: CupertinoColors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
      ), child: Padding(
    padding: EdgeInsets.only(top: 50.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Central",
          style: TextStyle(color: centralTextColor),
            ),
          ],
        ),
      ));
  }
}
