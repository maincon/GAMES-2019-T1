package;

import flixel.FlxSprite;

class Vidas extends FlxSprite
{

    public function new(?X:Float = 0, ?Y:Float = 0)
    {
        super(X, Y);
        
        loadGraphic("assets/images/New Piskel.png");
        
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

}