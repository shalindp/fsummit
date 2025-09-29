
part of '../ChatPage.dart';

class _ChatInput extends StatelessWidget {
  final FocusNode _focusNode;

  static const height = 56.0;
  static const innerHeight = 38.0;

  const _ChatInput({super.key, required FocusNode focusNode}) : _focusNode = focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.s4),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: Container(color: Colors.green, height: innerHeight),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: innerHeight,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: Color(0xFF0C0C0C)),
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      // contentPadding: EdgeInsets.zero,
                      hintText: "Aa",
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(99),
                        borderSide: BorderSide.none, // remove border if you want
                      ),
                      // focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(color: Colors.purpleAccent, height: 38, width: 38),
          ],
        ),
      ),
    );
  }
}
