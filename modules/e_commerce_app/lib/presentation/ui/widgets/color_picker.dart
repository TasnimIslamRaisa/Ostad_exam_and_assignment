import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onColorSelected});
  final List<Color> colors;
  final Function(Color) onColorSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _selectedColor=widget.colors.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
        Text('Color',style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),),
        const SizedBox(height: 16,),
        Wrap(
          spacing: 12,
          children:
            widget.colors.map((item){
            return GestureDetector(
              onTap: (){
                _selectedColor=item;
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: item,
                radius: 16,
                child: _selectedColor==item? Icon(Icons.check,color: Colors.white,) : null,

              ),
            );
            }).toList(),
        ) ],
    );
  }
}
