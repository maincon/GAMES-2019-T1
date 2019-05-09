package;

import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.text.FlxText;


class PlayState extends FlxState
{

	var _FundoDados:FlxSprite;
	var _Vidas:FlxTypedGroup<Vidas>;
	var _Vida:Int = 5;
	var _Score:FlxText;
	var _Pontos:Int = 0;
	var _Nave:Nave;
	var _Balas:FlxTypedGroup<Balas>;
	var _BalasInimigos:FlxTypedGroup<BalasInimigos>;
	var _Inimigos:FlxTypedGroup<Inimigos>;
	var _Nivel:Int = 0;
	var _NumeroInimigosNivel:Array<Int> = [13, 8, 11, 14, 17, 20, 23];


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
		add(_Vidas);

		_Score = new FlxText(_FundoDados.getGraphicMidpoint().x + FlxG.width/4, _FundoDados.getGraphicMidpoint().y - 12, " "+_Pontos, 16);
		_Score.color = 0xff0000CD;
		add(_Score);


		_Balas = new FlxTypedGroup<Balas>(50);
		add(_Balas);
		for(i in 0...50){
			var minhaNovaBala = new Balas();
			minhaNovaBala.kill();
			_Balas.add(minhaNovaBala);
		}

		_Nave = new Nave(_FundoDados.getGraphicMidpoint().x - 24, _FundoDados.getGraphicMidpoint().y - _FundoDados.height - 32, _Balas);
		add(_Nave);

		_BalasInimigos = new FlxTypedGroup<BalasInimigos>();
		for(i in 0...100){
			var NovaBalaInimigo = new BalasInimigos();
			NovaBalaInimigo.kill();
			_BalasInimigos.add(NovaBalaInimigo);
		}
		add(_BalasInimigos);

		_Inimigos = new FlxTypedGroup<Inimigos>();
		for(i in 0..._NumeroInimigosNivel[_Nivel]){
			var meuNovoInimigo = new Inimigos(0, 0, _Nivel, _BalasInimigos);
			meuNovoInimigo.x = (meuNovoInimigo.width+15)*i;
			_Inimigos.add(meuNovoInimigo);
		}
		add(_Inimigos);

		super.create();
	}

	function onOverlap(a:FlxObject, b:FlxObject):Void{
		if(Std.is (a, Balas)){
			a.kill();
			b.kill();
			_Pontos += 25;
		}
		if( Std.is (a, BalasInimigos)){
			a.kill();
			b.kill();
			_Vida -= 1;
			
		}
		if( Std.is (a, _Inimigos)){
			a.kill();
			b.kill();
			_Vida -= 1;
		}
	}

	override public function update(elapsed:Float):Void
	{
		
		FlxG.overlap(_Balas, _Inimigos, onOverlap);
       	FlxG.overlap(_BalasInimigos, _Nave, onOverlap);
		FlxG.overlap(_Inimigos, _Nave, onOverlap);
       
	   super.update(elapsed);
	}
}
