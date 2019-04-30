package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{

	var _FundoDados:FlxSprite;
	var _Vidas:FlxTypedGroup<Vidas>;
	var _Score:FlxText;
	var _Pontos:Int = 0;

	override public function create():Void
	{
		_FundoDados = new FlxSprite();
		_FundoDados.makeGraphic(FlxG.width, 50, 0xff696969);
		_FundoDados.y = FlxG.height - _FundoDados.height;
		add(_FundoDados);

		_Vidas = new FlxTypedGroup<Vidas>(5);
		for(i in 0...5){
			var minhaNovaVida = new Vidas(_FundoDados.x + i*20 + 16, _FundoDados.getMidpoint().y - 5);
			_Vidas.add(minhaNovaVida);
		}

		_Score = new FlxText(_FundoDados.getGraphicMidpoint().x + FlxG.width/4, _FundoDados.getGraphicMidpoint().y - 12, " "+_Pontos, 16);
		_Score.color = 0xff0000CD;
		add(_Score);

		add(_Vidas);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
