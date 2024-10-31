import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({super.key,required this.titleAppBar,this.onPressedSearch,required this.onPressedFavIcon,required this.onChanged,required this.controller});
  String titleAppBar;
  void Function()? onPressedSearch;
  void Function()? onPressedFavIcon;
   void Function(String)? onChanged;
   TextEditingController?controller;


   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor)),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: titleAppBar,
                  prefixIcon: IconButton(icon: const Icon(Icons.search),onPressed: onPressedSearch,),),
            ),
          ),
          IconButton(
              onPressed:onPressedFavIcon,
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.red,
                size: 35,
              ),
              padding: EdgeInsets.zero),

        ],
      ),
    );
  }
}
