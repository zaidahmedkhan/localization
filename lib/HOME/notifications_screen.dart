import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationView();
}

class _NotificationView extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Notification screen".tr,
            style: const TextStyle(color: Colors.black, fontSize: 30),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 300, top: 500),
            child: FloatingActionButton(
                onPressed: () {
                  _showLanguageSelector(context);
                },
                child: const Icon(Icons.language_outlined)),
          )
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: [
            _buildLanguageItem("English", const Locale('en', 'US')),
            _buildLanguageItem("Urdu", const Locale('ur', 'PK')),
            _buildLanguageItem("Hindi", const Locale('hi', 'IN')),
            _buildLanguageItem("Chinese", const Locale('zh', 'CN')),
            _buildLanguageItem("Arabic", const Locale('ar', 'AR')),
            _buildLanguageItem("Bengali", const Locale('bn', 'BD')),
            _buildLanguageItem("Spanish", const Locale('es', 'ES')),
            _buildLanguageItem("Turkish", const Locale('tr', 'TR')),
            _buildLanguageItem("Japanese", const Locale('ja', 'JP')),
            _buildLanguageItem("Korean", const Locale('ko', 'KR')),
          ],
        );
      },
    );
  }

  Widget _buildLanguageItem(String language, Locale locale) {
    return ListTile(
      title: Text(language),
      onTap: () {
        Get.updateLocale(locale);
        Navigator.pop(context);
      },
    );
  }
}
