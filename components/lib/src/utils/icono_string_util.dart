import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_oper': Icons.folder_open
};

Icon getIcon(String nombreIcono, Color color) {
  return Icon(_icons[nombreIcono], color: color);
}