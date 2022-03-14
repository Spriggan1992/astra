import 'package:astra_app/application/chat/chat_bloc.dart';
import 'package:astra_app/presentation/core/theming/icons/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent bottom bar for chat screen with text field and sending message button.
class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(30, 49, 90, 1),
            Color.fromRGBO(24, 38, 71, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocSelector<ChatBloc, ChatState, bool>(
          selector: (state) => state.hasConnection,
          builder: (context, hasConnection) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Form(
                      child: TextFormField(
                        maxLines: null,
                        style: const TextStyle(color: AstraColors.white),
                        readOnly: !hasConnection,
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: AstraColors.white01,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0,
                          ),
                          hintText: hasConnection
                              ? 'Cooбщение...'
                              : 'Ожидание сети...',
                          hintStyle:
                              const TextStyle(color: AstraColors.white03),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_controller.text.isNotEmpty && hasConnection) {
                      context
                          .read<ChatBloc>()
                          .add(ChatEvent.messageSent(_controller.text));
                      _controller.text = '';
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(251, 251, 251, 0.2),
                      radius: 16,
                      child: SvgIcon(
                        height: 24,
                        asset: 'assets/icons/paper-plane.svg',
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
