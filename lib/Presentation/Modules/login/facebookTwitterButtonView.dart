import 'package:booking_app/Application/Widgets/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookTwitterButtonView extends StatelessWidget {
  const FacebookTwitterButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return _fTButtonUI();
  }

  Widget _fTButtonUI() {
    return Container(
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: CommonButton(
              padding: EdgeInsets.zero,
              backgroundColor: Color(
                0x0FF3C5799,
              ),
              buttonTextWidget: _buttonTextUI(),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: CommonButton(
              padding: EdgeInsets.zero,
              backgroundColor: Color(
                0x0FF05A9F0,
              ),
              buttonTextWidget: _buttonTextUI(
                isFacebook: false,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
    );
  }

  Widget _buttonTextUI({
    bool isFacebook = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          isFacebook ? FontAwesomeIcons.facebookF : FontAwesomeIcons.twitter,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          isFacebook ? "Facebook" : "Twitter",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
