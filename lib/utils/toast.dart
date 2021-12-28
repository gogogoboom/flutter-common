import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'asset_file.dart';

class ToastUtil {
  static void show(String? msg, {IconData? iconData}) {
    if (msg != null) {
      if (msg.length <= 6) {
        BotToast.showCustomText(
          toastBuilder: (_) => SizedBox(
            width: 120,
            height: 120,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.zero,
              color: Colors.black87,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (iconData == null)
                      SvgPicture.asset(
                        Utils.getSvgPath('icon_success'),
                        color: Colors.white,
                        width: 40,
                      )
                    else
                      Icon(
                        iconData,
                        color: Colors.white,
                        size: 40,
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      msg,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          align: Alignment.center,
          wrapToastAnimation: null,
          onlyOne: true,
        );
      } else {
        BotToast.showText(
          text: msg,
          align: Alignment.center,
          wrapToastAnimation: null,
          contentColor: Colors.black87,
        );
      }
    }
  }

  static void success(String msg) => show(msg);

  static void error(String msg) =>
      show(msg, iconData: CupertinoIcons.clear_circled);
}

CancelFunc toastLoading() => BotToast.showCustomLoading(
      toastBuilder: (_) => Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const CircularProgressIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
        ),
      ),
    );

void cancelLoading() {
  BotToast.closeAllLoading();
}
