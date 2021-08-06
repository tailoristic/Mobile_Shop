import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final VoidCallback onTap;
  final bool isLoading;
  const CustomButton({
    Key key,
    @required this.title,
    @required this.height,
    @required this.width,
    @required this.onTap,
    @required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isLoading ? 60.0 : height,
      width: isLoading ? 60.0 : width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: ElevatedButton(
          onPressed: onTap,
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(),
                  ),
                )
              : Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
