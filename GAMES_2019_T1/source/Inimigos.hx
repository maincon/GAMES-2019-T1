package;

import flixel.*;

class Inimigos extends FlxSprite {

    public static var SPRITE_FRAMES:Map<Int, Array<Int>> = [
        0 => [0, 1, 2],
        1 => [1, 3 ,4]
    ];

    public function new(X:Float = 0, Y:Float = 0, _SpriteInimigo:String, nivelInimigo:Int){
        super(X, Y);
        loadGraphic("assets/images/"+_SpriteInimigo + ".png", true);
        animation.add("moves", SPRITE_FRAMES.get(nivelInimigo), 10, true);
        animation.play("moves", true);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }
}