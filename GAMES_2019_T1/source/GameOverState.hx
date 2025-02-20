package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;


class GameOverState extends FlxState
{

	var _TitleGameOver:FlxText;
	var _TitleWin:FlxText;
    var _TitlePontos:FlxText;
    var _btnVoltarMenu:FlxButton;
    var _score:Int = 0;
	var _win:Bool;

    public function new(Score:Int, Win:Bool){
		_score = Score;
		_win = Win;
		super();
    }
	

	override public function create():Void
	{
		_TitleGameOver = new FlxText(0, 0, 0, "GAME OVER\n\n\n",50);
		_TitleGameOver.screenCenter();
		_TitleGameOver.alignment = CENTER;
		
		_TitleWin = new FlxText(0, 0, 0, "VICTORY!\n\n\n",50);
		_TitleWin.screenCenter();
		_TitleWin.alignment = CENTER;

        _TitlePontos = new FlxText(0, 0, 0, Std.string(_score),30);
		_TitlePontos.x = _TitleGameOver.x + _TitleGameOver.width/2 - _TitlePontos.width/2;
		_TitlePontos.y = _TitleGameOver.y + _TitleGameOver.height;
		_TitlePontos.alignment = CENTER;
		
		if(!_win){
			add(_TitleGameOver);
		}else if(_win){
			add(_TitleWin);
		}
        add(_TitlePontos);

		_btnVoltarMenu = new FlxButton(FlxG.width - 10, FlxG.height - 10, "Menu", clickMenu);
		_btnVoltarMenu.x -= _btnVoltarMenu.width;
		_btnVoltarMenu.y -= _btnVoltarMenu.height;
		add(_btnVoltarMenu);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}


	function clickMenu():Void
    {
        FlxG.switchState(new MenuState());
    }

}