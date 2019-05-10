package;


import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxTimer;


class Nave extends FlxSprite
{
    var _TimerTiros:FlxTimer;
    var _TiroPorSegundo:Float = 5/10;
    var _Balas:FlxTypedGroup<Balas>;
    var _Cartucheira:Int = 500;

    public function new(?X:Float = 0, ?Y:Float = 0, Bullet:FlxTypedGroup<Balas>)
    {
        super(X, Y);
        _Balas = Bullet;
        _TimerTiros = new FlxTimer();
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
            if(_Cartucheira>0)atirar();
        }

        super.update(elapsed);
    }

    function atirar():Void {
        if(_TimerTiros.active) return;
        _TimerTiros.start(_TiroPorSegundo);
        var _Tiro = _Balas.getFirstAvailable();
        if(_Tiro != null){
            _Tiro.reset(getGraphicMidpoint().x - 13, getGraphicMidpoint().y - height - 1);
            _Tiro.velocity.y = -150;
        }
        _Cartucheira--;
    }



}