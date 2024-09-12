import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onColorSelected});
  final List<Color> colors;
  final Function(Color) onColorSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
        Text('Color',style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: 16,),
        Wrap(
          spacing: 12,
          children:
            widget.colors.map((item){
            return CircleAvatar(
              backgroundColor: item,
              radius: 16,

            );
            }).toList(),
        ) ],
    );
  }
}
