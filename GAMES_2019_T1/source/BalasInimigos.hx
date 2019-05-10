package;

import flixel.*;

class BalasInimigos extends FlxSprite {
    public function new(?X:Float = 0, ?Y:Float = 0){
        super(X, Y);
        loadGraphic("assets/images/BalaInimigos.png");
    }


    override public function update(elapsed:Float):Void {
        if(!this.isOnScreen()){
            this.kill();
        }
        if(this.y > FlxG.height - 98){
            this.kill();
        }
        super.update(elapsed);
    }
}