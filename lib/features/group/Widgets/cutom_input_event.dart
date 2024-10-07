import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputStatus { help, verify, error }

class CustomInputEventWidget extends StatefulWidget {
  final String title;
  final TextInputType inputType;
  final Function(String) onValueChanged;
  final bool isPassword;
  final String hintText;
  final String helpText;
  final String verifyText;
  final String errorText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEnabled;

  CustomInputEventWidget({
    Key? key,
    required this.title,
    required this.inputType,
    required this.onValueChanged,
    this.isPassword = false,
    this.hintText = '',
    this.helpText = '',
    this.verifyText = '',
    this.errorText = '',
    required this.controller,
    this.isEnabled = true,
    FocusNode? focusNode,
  })  : focusNode = focusNode ?? FocusNode(),
        super(key: key);

  @override
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputEventWidget> {
  bool _obscureText = true;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isNotEmpty = false;
  InputStatus _status = InputStatus.help;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
    widget.controller.addListener(_handleTextChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus != _isFocused) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  void _handleTextChange() {
    if (widget.controller.text.isNotEmpty != _isNotEmpty) {
      setState(() {
        _isNotEmpty = widget.controller.text.isNotEmpty;
        _status = _isNotEmpty ? InputStatus.verify : InputStatus.help;
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String iconPath;
    String displayText;

    switch (_status) {
      case InputStatus.verify:
        iconPath = 'assets/images/icon-verify-check.png';
        displayText = widget.verifyText;
        break;
      case InputStatus.error:
        iconPath = 'assets/images/icon-error.png';
        displayText = widget.errorText;
        break;
      default:
        iconPath = 'assets/images/icon-check.png';
        displayText = widget.helpText;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 10),
          TextField(
            enabled: widget.isEnabled,
            focusNode: _focusNode,
            controller: widget.controller,
            keyboardType: widget.inputType,
            onChanged: widget.onValueChanged,
            obscureText: widget.isPassword ? _obscureText : false,
            decoration: InputDecoration(
              hintText: widget.hintText.isEmpty
                  ? 'Nhập ${widget.title.toLowerCase()}'
                  : widget.hintText,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFFDEDEDE), width: 1.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFFFFD200))),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _togglePasswordVisibility)
                  : null,
            ),
            inputFormatters: widget.inputType == TextInputType.number
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
          ),
          Visibility(
            visible: _isFocused && displayText.isNotEmpty,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: widget.title == 'Họ và tên' ? 30 : 0),
                  child: Image.asset(iconPath, height: 24, width: 24),
                ),
                Expanded(
                  child: Text(
                    displayText,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: _status == InputStatus.error
                            ? Colors.red
                            : (_isNotEmpty ? Color(0xFF3E9462) : Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}