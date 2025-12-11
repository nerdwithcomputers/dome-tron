import "graphics" for Canvas, Color
import "input" for Keyboard
import "player" for Player
import "dome" for Process

var collisionList = []

class Main{
  construct new(){}
  init(){
    _width = 90
    _height = 90
    // Canvas.resize(1600,900)
    _red = Player.new(Color.rgb(223, 116, 12), "up", [100,100])
    _l = [1,2,3]
    System.print(_l[-1])
  }
  
  update(){
    if(Keyboard.isKeyDown("ESCAPE")) Process.exit(0)
    _red.update()
    
  }
  
  draw(alpha){
    Canvas.cls()
    _red.draw()
  }
}


var Game = Main.new()

