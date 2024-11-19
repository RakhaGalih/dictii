// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dictii/constants/constant.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final int? minLines;
  final String label;
  final TextEditingController controller;
  final void Function(String)?  validator;
  final void Function(String)? onChanged;
  final VoidCallback onSearch;
  const SearchTextField({
    super.key,
    this.minLines,
    required this.label,
    required this.controller,
    this.validator,
    this.onChanged,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      style: kSemiBoldTextStyle.copyWith(fontSize: 16),
      decoration: basicInputDecoration(label).copyWith(
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: onSearch,
        ),
      ),
    );
  }
}
