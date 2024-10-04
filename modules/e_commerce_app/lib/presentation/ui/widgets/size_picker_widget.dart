import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.size,
    required this.onSizeSelected, required List<String> sizes,
  });

  final List<String> size;
  final Function(String) onSizeSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize = widget.size.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),),
        const SizedBox(height: 16),
        Wrap(
          spacing: 14,
          children: widget.size.map((item) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = item;
                  widget.onSizeSelected(item);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border:_selectedSize==item? null :  Border.all(color: Colors.grey),
                  color: _selectedSize == item
                      ? AppColors.themeColor
                      :null,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 18,
                    color: _selectedSize == item
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
