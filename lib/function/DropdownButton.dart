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
    value: 'WhatsApp',
    child: Text('WhatsApp'),
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
    value: 'LinkedIn',
    child: Text('LinkedIn'),
  ),
  DropdownMenuItem(
    value: 'Other',
    child: Text('Other'),
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
      icon: const Icon(Icons.arrow_drop_down,
          color: Color.fromARGB(167, 0, 0, 0)),
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCFD4DC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF613EEA)),
          ),
          labelText: 'Choose App',
          labelStyle: TextStyle(color: Color.fromARGB(167, 0, 0, 0)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10)),
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
