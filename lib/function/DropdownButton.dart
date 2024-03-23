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
  final String selectedValue;
  final Function(String?) onChanged;

  DropdownButtonForSNS({Key? key, required this.selectedValue, required this.onChanged}) : super(key: key);

  @override
  _DropdownButtonForSNSState createState() => _DropdownButtonForSNSState();
}

class _DropdownButtonForSNSState extends State<DropdownButtonForSNS> {
  String? _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.selectedValue.isEmpty ? null : widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _dropdownValue,
      icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(167, 0, 0, 0)),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFCFD4DC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF613EEA)),
        ),
        labelText: 'Choose App',
        labelStyle: TextStyle(
          color: Color.fromARGB(167, 0, 0, 0)
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10)),
      elevation: 16,
      items: _snsItems, // Make sure _snsItems is defined somewhere in this class or passed as a parameter
      menuMaxHeight: 300,
      onChanged: (String? newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
        widget.onChanged(newValue); // Notify the external listener about the change
      },
    );
  }
}

