import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/core/constants/app_colors.dart';
import 'package:demo_app/core/constants/app_strings.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';
import 'package:demo_app/features/registration/presentation/viewmodels/create_account_email_view_model.dart';
import 'package:demo_app/features/registration/presentation/widgets/back_circle_button.dart';
import 'package:demo_app/features/registration/presentation/widgets/text_input_box.dart';
import 'package:demo_app/features/registration/presentation/widgets/virtual_keyboard.dart';
import 'package:demo_app/shared/components/primary-button.dart';

class CreateAccountEmailScreen extends ConsumerStatefulWidget {
  const CreateAccountEmailScreen({super.key});
  @override
  ConsumerState<CreateAccountEmailScreen> createState() => _CreateAccountEmailScreenState();
}

class _CreateAccountEmailScreenState extends ConsumerState<CreateAccountEmailScreen> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final selection = _controller.selection;
    final newText = text.replaceRange(selection.start.clamp(0, text.length), selection.end.clamp(0, text.length), myText);
    _controller.value = TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: selection.start.clamp(0, newText.length) + myText.length));
    ref.read(createAccountEmailViewModelProvider.notifier).updateEmail(_controller.text);
  }

  void _backspace() {
    final text = _controller.text;
    final selection = _controller.selection;
    if (selection.start != selection.end) {
      final newText = text.replaceRange(selection.start, selection.end, '');
      _controller.value = TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: selection.start));
    } else if (selection.start > 0) {
      final newText = text.replaceRange(selection.start - 1, selection.start, '');
      _controller.value = TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: selection.start - 1));
    }
    ref.read(createAccountEmailViewModelProvider.notifier).updateEmail(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAccountEmailViewModelProvider);
    final vm = ref.read(createAccountEmailViewModelProvider.notifier);
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 4, vertical: h * 1.6),
              child: Row(
                children: [
                  BackCircleButton(onTap: () => Navigator.of(context).maybePop()),
                  Expanded(
                    child: Center(
                      child: Text(
                        AppStrings.createAccount,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: h * 2),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: false,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: w * 6),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: context.screenHeight * 0.35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 2),
                        Text(
                          AppStrings.whatsYourEmail,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: h * 2.4),
                        ),
                        SizedBox(height: h * 2),
                        TextInputBox(
                          controller: _controller,
                          hint: AppStrings.emailHint,
                          onChanged: vm.updateEmail,
                          readOnly: true,
                        ),
                        SizedBox(height: h * 1.2),
                        Text(
                          AppStrings.emailConfirmNote,
                          style: TextStyle(color: Colors.white, fontSize: h * 1.4, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: h * 4),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: context.screenWidth * 0.45,
                            child: PrimaryButton(
                              label: AppStrings.next,
                              onPress: state.isValid
                                  ? () async {
                                      final ok = await vm.submit();
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'Proceeding to next step' : 'Enter a valid email')));
                                    }
                                  : null,
                              enabled: state.isValid && !state.isSubmitting,
                              color: AppColors.pillGrey,
                              textColor: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: h * 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            VirtualKeyboard(
              onTextInput: _insertText,
              onBackspace: _backspace,
              onSpace: () => _insertText(' '),
              onReturn: () => FocusScope.of(context).unfocus(),
            ),
          ],
        ),
      ),
    );
  }
}
