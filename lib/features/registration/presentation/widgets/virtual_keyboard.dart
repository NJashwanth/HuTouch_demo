import 'package:flutter/material.dart';
import 'package:demo_app/core/constants/app_colors.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';

typedef KeyboardTextInput = void Function(String text);
typedef KeyboardAction = void Function();

class VirtualKeyboard extends StatelessWidget {
  final KeyboardTextInput onTextInput;
  final KeyboardAction onBackspace;
  final KeyboardAction onSpace;
  final KeyboardAction onReturn;

  const VirtualKeyboard({
    super.key,
    required this.onTextInput,
    required this.onBackspace,
    required this.onSpace,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final isPortrait = ContextExtensionss(context).isPortrait;
    final heightFactor = isPortrait ? 0.33 : 0.45;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.screenHeight * heightFactor,
        minHeight: context.screenHeight * (heightFactor - 0.03),
      ),
      child: Container(
        color: AppColors.keyBoardBg,
        padding: EdgeInsets.fromLTRB(h, h, h, h * 0.8),
        child: Column(
          children: [
            _KeyRow(keys: 'qwertyuiop'.split(''), onTextInput: onTextInput),
            SizedBox(height: h * 1),
            _KeyRow(keys: 'asdfghjkl'.split(''), onTextInput: onTextInput),
            SizedBox(height: h * 1),
            Row(
              children: [
                _SpecialKey(label: 'ABC', flex: 2, onTap: () {}),
                ...'zxcvbnm'.split('').map((c) => Expanded(child: _CharKey(label: c, onTap: () => onTextInput(c)))),
                _IconKey(icon: Icons.backspace_outlined, flex: 2, onTap: onBackspace),
              ],
            ),
            SizedBox(height: h * 1),
            Row(
              children: [
                _SpecialKey(label: '123', flex: 3, onTap: () {}),
                Expanded(flex: 7, child: _SpecialKey(label: 'space', onTap: onSpace)),
                _SpecialKey(label: 'return', flex: 3, onTap: onReturn),
              ],
            ),
            SizedBox(height: h * 1.2),
            Row(
              children: [
                Icon(Icons.emoji_emotions_outlined, color: Colors.white, size: h * 2.4),
                const Spacer(),
                Icon(Icons.mic_none, color: Colors.white, size: h * 2.4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _KeyRow extends StatelessWidget {
  final List<String> keys;
  final KeyboardTextInput onTextInput;
  const _KeyRow({required this.keys, required this.onTextInput});
  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Row(
      children: keys
          .map((k) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: h * 0.5),
                  child: _CharKey(label: k, onTap: () => onTextInput(k)),
                ),
              ))
          .toList(),
    );
  }
}

class _CharKey extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _CharKey({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Material(
      color: AppColors.keyBg,
      borderRadius: BorderRadius.circular(h * 0.9),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: h * 4.8,
          child: Center(
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: h * 2.4)),
          ),
        ),
      ),
    );
  }
}

class _SpecialKey extends StatelessWidget {
  final String label;
  final int flex;
  final VoidCallback onTap;
  const _SpecialKey({required this.label, this.flex = 2, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Expanded(
      flex: flex,
      child: Material(
        color: AppColors.keyBgDark,
        borderRadius: BorderRadius.circular(h * 0.9),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: h * 4.8,
            child: Center(
              child: Text(label, style: TextStyle(color: Colors.white, fontSize: h * 2, fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconKey extends StatelessWidget {
  final IconData icon;
  final int flex;
  final VoidCallback onTap;
  const _IconKey({required this.icon, this.flex = 2, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Expanded(
      flex: flex,
      child: Material(
        color: AppColors.keyBgDark,
        borderRadius: BorderRadius.circular(h * 0.9),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: h * 4.8,
            child: Center(child: Icon(icon, color: Colors.white, size: h * 2.2)),
          ),
        ),
      ),
    );
  }
}
