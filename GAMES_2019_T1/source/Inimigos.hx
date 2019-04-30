package;

import flixel.*;

class Balas extends FlxSprite {
    public function new(){
        super();
    }

    override public function update(elapsed:Float):Void {
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}