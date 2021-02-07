import 'package:bloc_listener_poc/bloc/appBarBloc/app_bar_bloc.dart';
import 'package:bloc_listener_poc/bloc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/models/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HeadTitleBar extends StatefulWidget implements PreferredSizeWidget {
  HeadTitleBar(this.displayBack, this.searchAutoFocus);
  bool displayBack;
  bool searchAutoFocus;
  final double contentHeight = 80.0;
  final TextEditingController searchController = TextEditingController();
  @override
  _HeadTitleBarState createState() => _HeadTitleBarState();

  @override
  Size get preferredSize => new Size.fromHeight(contentHeight);
}

class _HeadTitleBarState extends State<HeadTitleBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc, AppBarState>(builder: (context, state) {
      if (state is AppBarPopState) {
        widget.displayBack = true;
        widget.searchAutoFocus = false;
      } else {
        widget.displayBack = false;
        widget.searchAutoFocus = false;
      }

      return Container(
        color: Colors.white,
        height: widget.contentHeight,
        child: SafeArea(
          top: true,
          child: Container(
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(

              color: Color(0xFFFFCC80),
              //borderRadius: BorderRadius.circular(0.0)
            ),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(

                  color: Color(0xFFFFCC80),
                  borderRadius: BorderRadius.circular(0.0)),
              child: //FadeAnimationX(              1.0,
              Row(
                children: <Widget>[
                  /*Container(
                width: 20,
                height: 40,
              ),*/

                  widget.displayBack
                      ?  Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_back),
                    )

                      : Container(
                    height: 0,
                    width: 0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        onTap: () {
                          context.bloc<SearchBloc>().add(SearchTapEvent());

                        },
                        onChanged: (String value) {
                          context
                              .bloc<SearchBloc>()
                              .add(SearchTypeEvent(searchText: value));
                        },
                        onSubmitted: (String value) {
                          // print("search submitted event");
                          FocusScope.of(context).unfocus();

                            global.searchText = value;

                            context
                                .bloc<SearchBloc>()
                                .add(SearchProductsEvent(searchText: value));

                        },
                        controller: widget.searchController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            //hintText: "Search Snapsale",
                            hintText: 'Search snapsale',
                            hintStyle: TextStyle(color: Colors.black87),
                            focusColor: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
          ),
        ),
      );
    });
  }
}
