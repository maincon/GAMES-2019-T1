package;

import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxTimer;

class Inimigos extends FlxSprite {

    var _TimerTiros:FlxTimer;
    var _TiroPorSegundo:Float = 9/10;
    var _BalasInimigos:FlxTypedGroup<BalasInimigos>;
    var direcao:Int = 1;

    public static var SPRITE_FRAMES:Map<Int, Array<Int>> = [
        0 => [0, 1, 2],
        1 => [0, 1],
        2 => [0, 1, 2, 3],
        3 => [0, 1, 2],
        4 => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        5 => [0, 1, 2],
        6 => [0, 1, 2, 3, 4, 5, 6, 7]
    ];

    public static var SPRITE_NAMES:Map<Int, String> = [
        0 => "InimigoUm",
        1 => "InimigoDois",
        2 => "InimigoTres",
        3 => "InimigoQuatro",
        4 => "InimigoCinco",
        5 => "InimigoSeis",
        6 => "InimigoSete"
    ];

    public function new(X:Float = 0, Y:Float = 0, nivelInimigo:Int, bullet:FlxTypedGroup<BalasInimigos>){
        super(X, Y);
        loadGraphic("assets/images/"+ SPRITE_NAMES.get(nivelInimigo) + ".png", true);
        animation.add("moves", SPRITE_FRAMES.get(nivelInimigo), 10, true);
        animation.play("moves", true);
        _BalasInimigos = bullet;
        _TimerTiros = new FlxTimer();
    }


    override public function update(elapsed:Float):Void {
        /*if(_BalasInimigos.countLiving() > 1){
            _TimerTiros.start(_TiroPorSegundo);
            
        }*/
        //atirar();

        movimentacao();

        x += direcao*2;
        
        super.update(elapsed);
    }


    public function atirar():Void {
        /*if(_TimerTiros.active) return;
        _TimerTiros.start(_TiroPorSegundo);*/
        var _Tiro = _BalasInimigos.getFirstAvailable();
        if(_Tiro != null){
            _Tiro.reset(getGraphicMidpoint().x - 15, getGraphicMidpoint().y + 1);
            _Tiro.velocity.y = 110;
        }

    }

    function movimentacao() {
        if(x <= 0) {
            direcao = 1;
            y += height + 4;
        }
        if(x >= FlxG.width){
            direcao = -1;
            y += height + 4;
        }
    }
}