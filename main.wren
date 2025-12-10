import "graphics" for Canvas, Color
import "input" for Keyboard

class Main{
  construct new(){}
  init(){
    _x = 100
    _y = 100
    _w = 5
    _h = 5
    _red = Player.new(Color.rgb(223, 116, 12), "up", [100,100])
  }
  
  update(){
    _red.update()
  }
  
  draw(alpha){
    Canvas.cls()
    _red.draw()
  }
}

class Player{
  construct new(color, facing, coordsStart){
    _color = color
    _facing = facing
    _x = coordsStart[0]
    _y = coordsStart[1]
    _lastCoords = []
    _w = 10
    _h = 10
  }
  update(){
    _lastCoords.add([_x,_y])
    if      (Keyboard.isKeyDown("w") && _facing!="down"){
      _facing = "up"
    }else if(Keyboard.isKeyDown("a") && _facing!="right"){
      _facing = "left"
    }else if(Keyboard.isKeyDown("s") && _facing!="up"){
      _facing = "down"
    }else if(Keyboard.isKeyDown("d") && _facing!="left"){
      _facing = "right"
    }
    
    if      (_facing=="up"){
      _y = _y - 1
    }else if(_facing=="down"){
      _y = _y + 1
    }else if(_facing=="left"){
      _x = _x - 1
    }else if(_facing=="right"){
      _x = _x + 1
    }
  }
  draw(){
    Canvas.rectfill(_x-(_w/2),_y-(_h/2), _w,_h, _color)
    for(coord in _lastCoords){
      Canvas.rectfill(coord[0]-2,coord[1]-2, 4,4, _color)
    }
  }
}
var Game = Main.new()
