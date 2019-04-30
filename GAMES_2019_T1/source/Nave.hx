package;


import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;


class Nave extends FlxSprite
{

    var _Balas:FlxTypedGroup<Balas>;

    public function new(?X:Float = 0, ?Y:Float = 0, Bullet:FlxTypedGroup<Balas>)
    {
        super(X, Y);
        _Balas = Bullet;

        loadGraphic("assets/images/Nave.png");
        
    }

    override public function update(elapsed:Float):Void
    {
        if(FlxG.keys.pressed.A){
            if(x > 0){
                x -= 5;
            }        
        }

        if(FlxG.keys.pressed.D){
            if(x + width < FlxG.width){
                x += 5;
            }
        }
        
        if(FlxG.keys.pressed.LEFT){
            if(x > 0){
                x -= 5;
            }
        }

        if(FlxG.keys.pressed.RIGHT){
            if(x + width < FlxG.width){
                x += 5;
            }
        }

        if(FlxG.mouse.justPressed){
            var s = _Balas.getFirstAvailable();
            if(s != null){
                s.reset(getGraphicMidpoint().x - 13, getGraphicMidpoint().y - height - 1);
                s.velocity.y = -80;
            }
                       
        }

        super.update(elapsed);
    }



}