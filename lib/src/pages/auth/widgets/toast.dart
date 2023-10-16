import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Toast {
  static void success() {
    showSimpleNotification(
      const _BaseToast(
        title: 'Well done!',
        text: 'Lorem ipsum dolor sit amet,\n consectetur',
        icon: Icons.check_circle,
        color: Color.fromRGBO(0, 179, 126, 1),
      ),
      position: NotificationPosition.top,
      autoDismiss: true,
      background: Colors.transparent,
    );
  }

  static void error({required String title, required String text}) {
    showSimpleNotification(
      _BaseToast(
        title: title,
        text: text,
        icon: Icons.cancel,
        color: const Color.fromRGBO(225, 46, 13, 1),
      ),
      position: NotificationPosition.top,
      slideDismissDirection: DismissDirection.horizontal,
      autoDismiss: true,
      background: Colors.transparent,
    );
  }
}

class _BaseToast extends StatelessWidget {
  const _BaseToast(
      {Key? key,
      required this.title,
      required this.text,
      required this.color,
      required this.icon})
      : super(key: key);

  final String title;
  final String text;

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(width: 12),
            Text.rich(
              TextSpan(
                text: '$title \n',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 20, color: Colors.white, height: 1.2),
                children: [
                  TextSpan(
                    text: text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

sda(content) => showSimpleNotification(content);
