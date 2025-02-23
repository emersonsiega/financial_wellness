import 'package:financial_wellness/src/presentation/design_system/design_system.dart';
import 'package:financial_wellness/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

/// Custom TextFormField to work with monetary input
class CurrencyFormField extends StatefulWidget {
  final String label;
  final double? value;
  final String? errorText;
  final ValueChanged<double>? onChanged;

  const CurrencyFormField({
    super.key,
    required this.label,
    this.onChanged,
    this.value,
    this.errorText,
  });

  @override
  State<CurrencyFormField> createState() => _CurrencyFormFieldState();
}

class _CurrencyFormFieldState extends State<CurrencyFormField> {
  final controller = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
      controller.updateValue(widget.value!);
    }
    controller.afterChange = (_, rawValue) {
      if (widget.value != rawValue) {
        widget.onChanged?.call(rawValue);
      }
    };
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CurrencyFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (controller.numberValue != widget.value && widget.value != null) {
      controller.updateValue(widget.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: context.colors.background.light,
        width: 1.0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.text.xs.description.copyWith(
            color: context.colors.foreground.darker,
          ),
        ),
        context.spacing.xs.vertical,
        TextFormField(
          controller: controller,
          scrollPadding: const EdgeInsets.only(bottom: 100),
          keyboardType: TextInputType.number,
          style: context.text.lg.headingSmall.copyWith(
            color: context.colors.foreground.dark,
          ),
          decoration: InputDecoration(
            border: defaultBorder,
            errorText: widget.errorText,
            // Hack to keep a reserved space for the error text take its place...
            helperText: ' ',
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.colors.feedback.attention,
                width: 1.0,
              ),
            ),
            prefixIcon: SizedBox(
              width: 40,
              child: Align(
                alignment: Alignment.center,
                child: AppIcons.dollarSign.icon(
                  size: 24,
                  color: context.colors.foreground.lighter,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
