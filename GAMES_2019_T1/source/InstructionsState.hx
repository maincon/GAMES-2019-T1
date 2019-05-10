package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;

class InstructionsState extends FlxState
{

	var _TitleInstructions:FlxText;
    var _TitleInstructionsButons:FlxText;
    var _btnVoltarMenu:FlxButton;
    var _btnPlay:FlxButton;
	

	override public function create():Void
	{
		_TitleInstructions = new FlxText(0, 0, 0, "INSTRUCTIONS\n\n\n",40);
		_TitleInstructions.x = FlxG.width/2 - _TitleInstructions.width/2;
		_TitleInstructions.alignment = CENTER;

        _TitleInstructionsButons = new FlxText(0, 0, 0, "Press A or left arrow to move left\n\nPress D or Right arrow to move right\n\nPress mouse1 to shoot\n\n",20);
		_TitleInstructionsButons.screenCenter();
		_TitleInstructionsButons.alignment = CENTER;
		
		add(_TitleInstructions);
        add(_TitleInstructionsButons);

		_btnVoltarMenu = new FlxButton(_TitleInstructionsButons.width/2 + 35, FlxG.height - 120, "Menu", clickMenu);
        _btnPlay = new FlxButton(_btnVoltarMenu.x, _btnVoltarMenu.y + _btnVoltarMenu.height + 10, "Play", clickPlay);
		add(_btnVoltarMenu);
		add(_btnPlay);

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
    
    function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }
}