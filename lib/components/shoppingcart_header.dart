import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_app/components/shoppingcart_detail.dart';
import 'package:flutter_shopping_cart_app/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  @override
  _ShoppingCartHeaderState createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.directions_bike),
          _buildHeaderSelectorButton(1, Icons.motorcycle),
          _buildHeaderSelectorButton(2, CupertinoIcons.car_detailed),
          _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
        ],
      ),
    );
  }

  Widget _buildHeaderSelectorButton(int id, IconData mIcon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          setState(() {
            selectedId = id;
            _showButtonSpecificBottomSheet(context, id);
          });
        },
      ),
    );
  }

  void _showButtonSpecificBottomSheet(BuildContext context, int id) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // 각 버튼에 따른 다른 내용을 여기에 추가
        // 예를들어, id에 따라 다른 텍스트를 표시
        Widget bottomSheetContent;
        if (id == 0) {
          bottomSheetContent =
              ShoppingCartDetail(); // Button 0에 대한 내용을 보여주는 위젯으로 변경
        } else if (id == 1) {
          bottomSheetContent =
              ShoppingCartDetail(); // Button 1에 대한 내용을 보여주는 위젯으로 변경
        } else if (id == 2) {
          bottomSheetContent =
              ShoppingCartDetail(); // Button 2에 대한 내용을 보여주는 위젯으로 변경
        } else if (id == 3) {
          bottomSheetContent =
              ShoppingCartDetail(); // Button 3에 대한 내용을 보여주는 위젯으로 변경
        }

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          height: 200,
          child: ListView(children: [ShoppingCartDetail()]),
        );
      },
    );
  }
}
