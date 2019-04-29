package;

import flixel.FlxState;
import flixel.text.FlxText;

class CreditsState extends FlxState
{

	var _TitleCredits:FlxText;
	var _TitleDesenvolvedor:FlxText;
	var _Desenvolvedor:FlxText;
	var _TitleArtista:FlxText;
	var _Artista:FlxText;

	override public function create():Void
	{
		_TitleCredits = new FlxText(0, 0, 300, "Creditos", 40);
		_TitleDesenvolvedor = new FlxText(0, 0, 300, "Desenvolvedor", 40);
		_Desenvolvedor = new FlxText(0, 0, 300, "Maicon Brandão", 40);
		_TitleArtista = new FlxText(0, 0, 300, "Artistas", 40);
		_Artista = new FlxText(0, 0, 300, "Responsaveis pelos sprits", 40);

		add(_TitleCredits);
		add(_TitleDesenvolvedor);
		add(_Desenvolvedor);
		add(_TitleArtista);
		add(_Artista);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}