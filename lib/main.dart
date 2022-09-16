//import 'dart:js';

// ignore_for_file: deprecated_member_use

//import 'dart:html';

import "package:flutter/material.dart";
import "package:flutter/src/widgets/icon.dart";
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Tic Tac Toe",
  home: TicTacToeApp()
));

class TicTacToeApp extends StatefulWidget {
  const TicTacToeApp({Key? key}) : super(key: key);

  @override
  State<TicTacToeApp> createState() => _TicTacToeAppState();
}

class _TicTacToeAppState extends State<TicTacToeApp> {

  var cross=Icon(Icons.cancel_rounded ,size: 80);
  var edit=Icon(Icons.edit);
  var circle=Icon(Icons.circle_outlined,size: 80);

  bool isCross= true;
  String message="";
late List<String> gameState;

  @override
  void initState() {
    gameState = List.filled(9, "empty");
         this.message = "";

    // TODO: implement initState
    super.initState();
  }


  playGame(int index){
    if(this.gameState[index]=="empty"){
      setState(() {
        if(this.isCross){
          this.gameState[index]= "cross";
        }
        else
          this.gameState[index]= "circle";
        isCross=!isCross;
        checkWin();

      });
    }
  }
  
resetGame(){
  setState(() {
     gameState = List.filled(9, "empty");

     this.message = "";
  });
}

Icon getImage(String title){
  var newVariable;
  switch(title){
    case ('empty'):
    newVariable = edit;
    break;

    case ('cross'):
    newVariable = cross;
    break;

    case ('circle'):
    newVariable = circle;
    break;
  }
  return newVariable;
}


checkWin(){
  if((this.gameState[0]!= "empty")&&(this.gameState[0]==this.gameState[1])&&(this.gameState[1]==this.gameState[2])){
    setState(() {
          this.message= this.gameState[0]+ " wins";
    });
  }
  else if((this.gameState[0]!= "empty")&&(this.gameState[0]==this.gameState[3])&&(this.gameState[3]==this.gameState[6])){
    setState(() {
          this.message= this.gameState[0]+ " wins";
    });
    }
  else if((this.gameState[0]!= "empty")&&(this.gameState[0]==this.gameState[4])&&(this.gameState[4]==this.gameState[8])){
    setState(() {
          this.message= this.gameState[0]+ " wins";

    });
    }
  else if((this.gameState[1]!= "empty")&&(this.gameState[1]==this.gameState[4])&&(this.gameState[4]==this.gameState[7])){
    setState(() {
          this.message= this.gameState[1]+ " wins";

    });
    }
  else if((this.gameState[2]!= "empty")&&(this.gameState[2]==this.gameState[5])&&(this.gameState[5]==this.gameState[8])){
    setState(() {
          this.message= this.gameState[2]+ " wins";

    });
    }
  else if((this.gameState[3]!= "empty")&&(this.gameState[3]==this.gameState[4])&&(this.gameState[4]==this.gameState[5])){
    setState(() {
          this.message= this.gameState[3]+ " wins";

    });
    }
  else if((this.gameState[6]!= "empty")&&(this.gameState[6]==this.gameState[7])&&(this.gameState[7]==this.gameState[8])){
    setState(() {
          this.message= this.gameState[6]+ " wins";

    });
    }
  else if((this.gameState[2]!= "empty")&&(this.gameState[2]==this.gameState[4])&&(this.gameState[4]==this.gameState[6])){
    setState(() {
          this.message= this.gameState[2]+ " wins";

    });
    }
  else if(!gameState.contains("empty")){
    setState(() {
          message= "Draw";
    });
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tic Tac Toe App")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1) , 
                itemCount: gameState.length,
              itemBuilder: (context, i) => SizedBox(
                height: 5,
                width: 5,
            
                child: MaterialButton(onPressed: () {
                  this.playGame(i);
                },
                
                child: getImage(this.gameState[i]),
                
                ),
                

              ) )
              ),
               Divider(color: Colors.black, thickness: 1.0),


              Text(message.toUpperCase(),style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Center(
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: resetGame,
                child: Text("Reset Game", style: TextStyle(fontSize: 20, color: Colors.white),),
                )
              ),
              SizedBox(height: 20),


      ],),
    );
    
  }
}