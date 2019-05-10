package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState
{
    var _btnPlay:FlxButton;
    var _btnCredits:FlxButton;
    var _btnInstructions:FlxButton;
    var _Title:FlxText;

	override public function create():Void
	{
        _Title = new FlxText(0, 0, 500, "MEGATARI 2600", 40);
        _Title.x = FlxG.width/2 - _Title.width/2.5;
        _Title.y = FlxG.height/2 - 100;
        _btnPlay = new FlxButton(0, 0, "Play", clickPlay);
        _btnPlay.screenCenter();
        _btnCredits = new FlxButton(_btnPlay.x, _btnPlay.y + _btnPlay.height + 10, "Credits", clickCredits);
        _btnInstructions = new FlxButton(_btnPlay.x, _btnCredits.y + _btnCredits.height + 10, "Instruções", clickInstructions);
        add(_Title);
        add(_btnPlay);
        add(_btnCredits);
        add(_btnInstructions);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

    function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }

    function clickCredits():Void
    {
        FlxG.switchState(new CreditsState());
    }
    
    function clickInstructions():Void
    {
        FlxG.switchState(new InstructionsState());
    }
}