import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';

List<String> temp = ["Hiren","Vadher","Raju"];
List<String> value = ["A","B","C"];

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      child: ListView.builder(
          itemCount: temp.length,
          itemBuilder: (context, index) {
            return SimpleFoldingCell(
                frontWidget: _buildFrontWidget(index),
                innerTopWidget: _buildInnerTopWidget(index),
                innerBottomWidget: _buildInnerBottomWidget(index),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('$index cell opened'),
                onClose: () => print('$index cell closed'));
          }),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Material(
          child: InkWell(
              onTap: () {
                SimpleFoldingCellState foldingCellState =
                context.ancestorStateOfType(
                    TypeMatcher<SimpleFoldingCellState>());
                foldingCellState?.toggleFold();
              },
            child: Container(
                color: Color(0xFFffcd3c),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${temp[index]}",
                        style: TextStyle(
                            color: Color(0xFF2e282a),
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800)),
//                    FlatButton(
//                      onPressed: () {
//                        SimpleFoldingCellState foldingCellState =
//                        context.ancestorStateOfType(
//                            TypeMatcher<SimpleFoldingCellState>());
//                        foldingCellState?.toggleFold();
//                      },
//                      child: Text(
//                        "Open",
//                      ),
//                      textColor: Colors.white,
//                      color: Colors.indigoAccent,
//                      splashColor: Colors.white.withOpacity(0.5),
//                    )
                  ],
                )),
          ),
        );
      },
    );
  }

  Widget _buildInnerTopWidget(int index) {
    return Builder(builder: (context)
    {
      return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          SimpleFoldingCellState foldingCellState = context
              .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
          foldingCellState?.toggleFold();
        },
        child: Container(
            color: Color(0xFFff9234),
            alignment: Alignment.center,
            child: Text("${value[index]}",
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800))),
      );
    });
  }

  Widget _buildInnerBottomWidget(int index) {
    return Builder(builder: (context) {
      return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          SimpleFoldingCellState foldingCellState = context
              .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
          foldingCellState?.toggleFold();
        },
        child: Container(
          color: Color(0xFFecf2f9),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
//            child: FlatButton(
//              onPressed: () {
//                SimpleFoldingCellState foldingCellState = context
//                    .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
//                foldingCellState?.toggleFold();
//              },
//              child: Text(
//                "Close",
//              ),
//              textColor: Colors.white,
//              color: Colors.indigoAccent,
//              splashColor: Colors.white.withOpacity(0.5),
//            ),
          ),
        ),
      );
    });
  }
}