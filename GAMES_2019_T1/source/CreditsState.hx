package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;


class CreditsState extends FlxState
{

	var _TitleCredits:FlxText;
	var _TitleDesenvolvedor:FlxText;
	var _TitleArtista:FlxText;
	var _btnVoltar:FlxButton;
	

	override public function create():Void
	{
		_TitleCredits = new FlxText(0, 0, 0, "CREDITOS",40);
		_TitleCredits.x = FlxG.width/2 - _TitleCredits.width/2;
		_TitleCredits.y = FlxG.height;
		_TitleCredits.moves = true;
		_TitleCredits.velocity.y = -100;
		_TitleCredits.alignment = CENTER;

		_TitleDesenvolvedor = new FlxText(0, 0, 0, "Desenvolvedor:\n\n"+
													"Maicon Brandão", 20);
		_TitleDesenvolvedor.x = FlxG.width/2 - _TitleDesenvolvedor.width/2;
		_TitleDesenvolvedor.y = FlxG.height;
		_TitleDesenvolvedor.moves = true;
		_TitleDesenvolvedor.velocity.y = -100;
		_TitleDesenvolvedor.alignment = CENTER;

		_TitleArtista = new FlxText(0, 0, 0, "Arte\n\n"
											+"Arte Concept:\n" 
											+"Activison\n"
											+"Megamania Activision\n" 
											+"Atari 2600\n"
											+"Artista:\n"
											+"Maicon Brandão\n"
											+"Ferramenta disponivel em:\n"
											+"www.piskelapp.com\n\n\n"
											+"HaxeFlixel", 40);
		_TitleArtista.x = FlxG.width/2 - _TitleArtista.width/2;
		_TitleArtista.y = FlxG.height;
		_TitleArtista.moves = true;
		_TitleArtista.velocity.y = -100;
		_TitleArtista.alignment = CENTER;

		add(_TitleCredits);
		add(_TitleDesenvolvedor);
		add(_TitleArtista);

		_btnVoltar = new FlxButton(FlxG.width - _btnVoltar.width - 10, FlxG.height - _btnVoltar.height - 10, "Menu", clickMenu);

		add(_btnVoltar);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		/*if(_TitleCredits.y + _TitleCredits.height <= 0){
			_TitleCredits.y = FlxG.height;
		}*/
	}


	function clickMenu():Void
    {
        FlxG.switchState(new MenuState());
    }

}