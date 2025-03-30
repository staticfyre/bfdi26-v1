package states.stages;

import states.stages.objects.*;
import objects.Character;
import flixel.tweens.FlxTween;
class Amongus extends BaseStage
{
	var amongus:BGSprite;
	var beam:BGSprite;
	override function create()
	{
		camGame.visible = false;
		var blackShit:FlxSprite = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
			-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.WHITE);
		blackShit.scrollFactor.set();
		add(blackShit);


		beam = new BGSprite('iloveamongus/rendersnlogos/line',170,1800);
		beam.scrollFactor.set(1,1);
		add(beam);
		
		var leggy:BGSprite = new BGSprite('iloveamongus/rendersnlogos/walkinglegs',750,1690, ['walk', 'walk'],true );
		leggy.animation.play('walk');
		add(leggy);
		
		amongus = new BGSprite('iloveamongus/rendersnlogos/amongus', 1550,250, ['iloveamongus', 'amongus'],true );
		amongus.scale.set(2,2);
		
		add(amongus);
		amongus.cameras = [camHUD];
	}
	
	override function createPost()
	{
		dad.visible = false;
		FlxTween.tween(beam, {x: -700}, 10);
		FlxTween.tween(amongus, {x: 850}, 1.75, {ease: FlxEase.circOut});
		FlxTween.tween(amongus, {alpha: 1}, 2, {ease: FlxEase.quadOut});
	}

	override function stepHit()
	{
		if (curStep == 32) {
			FlxTween.tween(amongus, {x: 1550}, 2, {ease: FlxEase.quadIn});
			FlxTween.tween(amongus, {alpha: 0}, 2, {ease: FlxEase.quadOut});
		}
	}
}