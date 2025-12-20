import "graphics" for Canvas, Color
import "input" for Keyboard
import "player" for Player
import "dome" for Process

var turnListDict = {}

class Main{
  construct new(){}
  init(){
    _width = 90
    _height = 90
    // Canvas.resize(_height,_width)
    _red = Player.new(
      Color.rgb(223, 116, 12), "up", [100,100],
      turnListDict
    )
    
  }
  
  update(){
    if(Keyboard.isKeyDown("ESCAPE")) Process.exit(0)
    _red.update(turnListDict)
    
  }
  
  draw(alpha){
    Canvas.cls()
    _red.draw()
  }
}


var Game = Main.new()

