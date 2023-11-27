import 'package:booky_project/styles/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.hasBackground = true,
  });

  /// Text of type String is required for this widget to display the text of the button
  final String? text;
  final Widget? child;

  /// A VoidCallback function to identify the functionality of the button. can be either null or () {}
  final VoidCallback? onPressed;
  final bool hasBackground;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    var buttonHeight = 56.0;
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: _getButton(context),
    );
  }

  ElevatedButton _getButton(BuildContext context) {
    //TODO: change the background color based on device mode
    var color = AppColors.textColorLight;
    Widget buildChild() {
      return Padding(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.text != null) ...[
              Text(
                widget.text!,
                style: TextStyle(
                  color:
                      widget.onPressed != null ? color : color.withOpacity(0.6),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ],
        ),
      );
    }

    var textWidget = widget.text != null
        ? Text(
            widget.text!,
            style: TextStyle(
              color: widget.onPressed != null ? color : color.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          )
        : widget.child ?? buildChild();

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white30),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: widget.hasBackground
            ? MaterialStateProperty.all(widget.onPressed != null
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.4))
            : MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: widget.hasBackground
                      ? Colors.transparent
                      : AppColors.primaryColor)),
        ),
      ),
      child: Ink(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(widthFactor: 1, heightFactor: 1, child: textWidget),
      ),
    );
  }
}
