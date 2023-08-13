import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {

  final bool value;
  final Function onTap;
  final String label0;
  final String label1;
  final double w;
  final double h;
  final bool border;

  const SliderButton({Key? key,
    required this.value,
    required this.onTap,
    required this.label0,
    required this.label1,
    required this.w,
    required this.h,
    required this.border,
  }) : super(key: key);

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: widget.w,
        height: widget.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(60),
          border: widget.border ? Border.all(width: 3, color: Colors.white) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: widget.border ? (widget.w / 2) - 3 : widget.w / 2,
                height: widget.h,
                decoration: BoxDecoration(
                  color: widget.value ? Colors.blue.shade900 : Colors.transparent,
                  borderRadius: BorderRadius.circular(60),
                  border: widget.border ? Border.all(width: 2, color: widget.value ? Colors.white : Colors.transparent) : null,
                ),
                child: Center(
                  child: Text(widget.label0,
                    style: TextStyle(color: widget.value ? Colors.white : Colors.white70, fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            // Text('  ON',
            //   style: TextStyle(color: Colors.white, fontSize: 21),
            //   textAlign: TextAlign.center,
            // ),

            Container(
                width: widget.border ? (widget.w / 2) - 3 : widget.w / 2,
                height: widget.h,
                decoration: BoxDecoration(
                  color: !widget.value ? Colors.blue.shade900 : Colors.transparent,
                  borderRadius: BorderRadius.circular(60),
                  border: widget.border ? Border.all(width: 3, color: !widget.value ? Colors.white : Colors.transparent) : null,
                ),
                child:  Center(
                  child: Text(widget.label1,
                    style: TextStyle(color: !widget.value ? Colors.white : Colors.white70, fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            // Text('OFF  ',
            //   style: TextStyle(color: Colors.white, fontSize: 21),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
