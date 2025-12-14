import "input" for Keyboard
import "graphics" for Canvas, Color
import "dome" for Process

class Player{
  construct new(color, facing, coordsStart){
    _color = color
    _facing = facing
    _x = coordsStart[0]
    _y = coordsStart[1]
    _turnCoords = []
    _speed = 1
    _w = 10
    _h = 10
    _turnCoords.add([_x,_y])
  }
  coords{
    [_x,_y]
  }
  turnCoords{
    _turnCoords
  }
  
  update(){
    // _turnCoords.add([_x,_y])
    // collisionList.add([_x,_y])
    // System.print(_turnCoords)
    
    // store facing for later check
    _lastfacing = _facing
    // change facing on input
    if      (Keyboard.isKeyDown("w")&&_facing!="down"){
      _facing = "up"
    }else if(Keyboard.isKeyDown("a")&&_facing!="right"){
      _facing = "left"
    }else if(Keyboard.isKeyDown("s") && _facing!="up"){
      _facing = "down"
    }else if(Keyboard.isKeyDown("d") && _facing!="left"){
      _facing = "right"
    }
    // detect a turn, this way needs less copypaste code
    if(_facing != _lastfacing) _turnCoords.add([_x,_y])
    // finally actually move
    if      (_facing=="up"){
      _y = _y - _speed
    }else if(_facing=="down"){
      _y = _y + _speed
    }else if(_facing=="left"){
      _x = _x - _speed
    }else if(_facing=="right"){
      _x = _x + _speed
    }

    for(turnList in turnListMap){
      _i = 0
      while(_i<turnList.count-2){
        if(turnList[i][0]==turnList[i+1][0] && _x==turnList[i][0]){
          // TODO: change to specific w/l cons
          Process.exit(0)
        }
        if(turnList[i][1]==turnList[i+1][1] && _y==turnList[i][0]){
          // TODO: change to specific w/l cons
          Process.exit(0)
        }
      } 
    }
  }
  draw(){
    Canvas.rectfill(_x-(_w/2),_y-(_h/2), _w,_h, _color)
    // for(coord in _turnCoords){
    //   Canvas.rectfill(coord[0]-2,coord[1]-2, 4,4, _color)
    // }
    _i = 0
    while(_i < _turnCoords.count-1){  
      Canvas.line(
        _turnCoords[_i][0],_turnCoords[_i][1],
        _turnCoords[_i+1][0],_turnCoords[_i+1][1],
        _color
      )
      _i = _i+1
    }
    if(_turnCoords.count>0) Canvas.line(
      _x,_y,
      _turnCoords[-1][0],_turnCoords[-1][1],
      _color
    )
  }
}
