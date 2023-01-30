import 'package:flutter/material.dart';
import 'package:todo/style.dart';
import 'package:todo/widgets/buttons.dart';
import 'package:todo/widgets/popup_background.dart';

class CustomListTile extends StatefulWidget {
  final bool status;
  final String head;
  final String time;
  const CustomListTile({Key? key, required this.head, required this.time, this.status = false}) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late bool status;

  @override
  void initState() {
    super.initState();
    status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() => status = !status);
            },
            child: Container(
              width: boxConstraints.maxWidth,
              margin: const EdgeInsets.symmetric(horizontal: padding / 2, vertical: padding / 4),
              padding: const EdgeInsets.symmetric(horizontal: padding / 2, vertical: padding / 2),
              constraints: const BoxConstraints(minHeight: 60),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(status ? 0.7 : 1),
                borderRadius: BorderRadius.circular(padding / 2),
                boxShadow: shadow,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Check Icon and Title
                  Row(
                    children: [
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: status ? 1 : 0),
                        duration: duration,
                        builder: (context, value, child) => AnimatedContainer(
                          duration: duration,
                          width: !status ? 0 : iconSize * 2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [
                                Icon(Icons.check, size: iconSize, color: textColor, shadows: shadow),
                                SizedBox(width: padding / 2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Name
                      Text(widget.head, style: head1),
                    ],
                  ),
                  const SizedBox(height: padding / 3),
                  // Time
                  Text(widget.time, style: subTitle1),
                ],
              ),
            ),
          ),
          // Edit buttons row
          Positioned(
            right: padding,
            bottom: padding / 2,
            child: Row(
              children: [
                CustomIconButton(
                  icons: Icons.edit,
                  onTap: () {},
                ),
                CustomIconButton(
                  icons: Icons.delete,
                  onTap: () {
                    // Showing delete confermation
                    return showDialog(
                      context: context,
                      builder: (context) => PopupBackground(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Do you really want to delete?", style: head1),
                            const SizedBox(height: padding / 2),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(onPressed: () {}, child: const Text("Yes")),
                                const SizedBox(width: padding / 2),
                                ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("No")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
