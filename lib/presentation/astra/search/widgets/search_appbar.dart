import 'package:flutter/material.dart';

///Represent widget to display appbar
class SearchAppBar extends StatelessWidget {
  const SearchAppBar({ Key? key, this.title ='', this.onTap}) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
              centerTitle: true,
              title:        
                   Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed:onTap, 
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            );
  }
}