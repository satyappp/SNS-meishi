// DropdoenMenuItem
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

const _snsItems = [
  DropdownMenuItem(
    value: 'X(Twitter)',
    child: Text('X(Twitter)'),
  ),
  DropdownMenuItem(
    value: 'Instagram',
    child: Text('Instagram'),
  ),
  DropdownMenuItem(
    value: 'Facebook',
    child: Text('Facebook'),
  ),
  DropdownMenuItem(
    value: 'LINE',
    child: Text('LINE'),
  ),
  DropdownMenuItem(
    value: 'WhatApp',
    child: Text('WhatApp'),
  ),
  DropdownMenuItem(
    value: 'Snapchat',
    child: Text('Snapchat'),
  ),
  DropdownMenuItem(
    value: 'KakaoTalk',
    child: Text('KakaoTalk'),
  ),
  DropdownMenuItem(
    value: 'Discord',
    child: Text('Discord'),
  ),
  DropdownMenuItem(
    value: 'TikTok',
    child: Text('TikTok'),
  ),
  DropdownMenuItem(
    value: 'Youtube',
    child: Text('Youtube'),
  ),
  DropdownMenuItem(
    value: 'Twitch',
    child: Text('Twitch'),
  ),
  DropdownMenuItem(
    value: 'Pinterest',
    child: Text('Pinterest'),
  ),
  DropdownMenuItem(
    value: 'GitHub',
    child: Text('GitHub'),
  ),
  DropdownMenuItem(
    value: 'pixiv',
    child: Text('pixiv'),
  ),
  DropdownMenuItem(
    value: 'others',
    child: Text('others'),
  ),
];

// ignore: must_be_immutable
class DropdownButtonForSNS extends StatefulWidget {
  String selectedValue;
  DropdownButtonForSNS({Key? key, required this.selectedValue})
      : super(key: key);

  @override
  State<DropdownButtonForSNS> createState() => _DropdownButtonForSNS_State();
}

class _DropdownButtonForSNS_State extends State<DropdownButtonForSNS> {
  // String dropdownValue = _snsItems[0].value!;
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Enter your SNS NAME'),
      elevation: 16,
      items: _snsItems,
      menuMaxHeight: 300,
      onChanged: (String? value) {
        // ignore: avoid_print
        // This is called when the user selects an item.
        setState(() {
          _dropdownValue = value!;
          widget.selectedValue = _dropdownValue!;
        });
      },
    );
  }
}
