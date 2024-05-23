import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormBuildTextField extends StatefulWidget {
  final String attribute, hintText, font, errorText;
  final Color color, dividerColor;
  final double fontSize, height;
  final FontWeight fontWeight;
  final TextInputType keybordType;
  final String formType;
  final List dropDownList;
  final Function submitAction;
  final fun;
  final showClear;
  final bool readOnly;
  final bool isRequired;
  final String? initialValue;
  Function(String?)? onChanged;
  final InputBorder? border;

  FormBuildTextField({
    required this.attribute,
    required this.hintText,
    required this.font,
    required this.errorText,
    required this.color,
    required this.dividerColor,
    required this.fontSize,
    required this.height,
    required this.fontWeight,
    required this.keybordType,
    required this.formType,
    required this.dropDownList,
    required this.submitAction,
    this.onChanged,
    this.fun,
    this.showClear,
    required this.readOnly,
    required this.isRequired,
    this.initialValue,
    this.border,
  });

  @override
  State<StatefulWidget> createState() {
    return _formbuildtextfieldState();
  }
}

class _formbuildtextfieldState extends State<FormBuildTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xffffffff)),
        child: FormBuilderTextField(

          initialValue: widget.initialValue,
          name: widget.attribute,
          style: TextStyle(
            fontFamily: "Proxima Nova",
            fontSize: widget.hintText == "Series title" ? 16 : widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
          maxLength:
              widget.hintText.toLowerCase().contains("phonenumber") ? 10 : null,
          obscureText: widget.hintText.toLowerCase().contains("********") ||
                  widget.hintText.contains("Enter Password *")
              ? showPassword
              : false,
          validator:widget.hintText.toLowerCase().contains("email")?FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]) : FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          keyboardType: widget.keybordType,
          onChanged: widget.onChanged,
          textCapitalization: widget.hintText.toLowerCase().contains("email")
              ? TextCapitalization.none
              : TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          showCursor: true,
          enableSuggestions: true,
          decoration: InputDecoration(
            border: widget.border,
            suffixIcon: widget.hintText.toLowerCase().contains("********") ||
                    widget.hintText.contains("Enter Password *")
                ? GestureDetector(
                    child: Icon(
                      showPassword == false
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: widget.color.withOpacity(0.7),
                    ),
                    onTap: () {
                      if (showPassword == true) {
                        setState(() {
                          showPassword = false;
                        });
                      } else {
                        setState(() {
                          showPassword = true;
                        });
                      }
                    },
                  )
                : widget.hintText
                        .toLowerCase()
                        .contains("search by product name")
                    ? Visibility(
                        visible: widget.showClear == true,
                        child: GestureDetector(
                          child: const Icon(Icons.clear),
                          onTap: () {
                            widget.fun();
                          },
                        ),
                      )
                    : widget.hintText
                            .toLowerCase()
                            .contains("what are you looking for?")
                        ? GestureDetector(
                            child: const Icon(
                              Icons.send_outlined,
                              size: 20,
                              color: Color(0xA3898A8D),
                            ),
                            onTap: () {
                              widget.submitAction();
                            },
                          )
                        : const SizedBox(),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: "Proxima Nova",
              color: const Color(0xA3898A8D),
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
        ));
  }
}
