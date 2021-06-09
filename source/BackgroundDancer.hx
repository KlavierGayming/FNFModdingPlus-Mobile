package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flash.display.BitmapData;
import lime.utils.Assets;
import lime.system.System;
import haxe.Json;
import haxe.format.JsonParser;
class BackgroundDancer extends FlxSprite
{
	public function new(x:Float, y:Float, ?type:String = "normal")
	{
		super(x, y);
		if (type == "normal") {
			frames = FlxAtlasFrames.fromSparrow("assets/images/limo/limoDancer.png", "assets/images/limo/limoDancer.xml");
		} else {
			var rawPic:BitmapData;
			var rawXml:String;
			if (FNFAssets.exists('assets/images/custom_stages/'+type+"/limoDancer.png")) {
				rawPic =FNFAssets.getBitmapData('assets/images/custom_stages/'+type+"/limoDancer.png");
			} else {
				// fall back on base game file to avoid crashes
				rawPic =FNFAssets.getBitmapData("assets/images/limo/limoDancer.png");
			}
			if (FNFAssets.exists('assets/images/custom_stages/'+type+"/limoDancer.xml")) {
			   rawXml = FNFAssets.getText('assets/images/custom_stages/'+type+"/limoDancer.xml");
			} else {
			   // fall back on base game file to avoid crashes
				 rawXml = Assets.getText("assets/images/limo/limoDancer.xml");
			}
			frames = FlxAtlasFrames.fromSparrow(rawPic, rawXml);
		}

		animation.addByIndices('danceLeft', 'bg dancer sketch PINK', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'bg dancer sketch PINK', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.play('danceLeft');
		antialiasing = true;
	}

	var danceDir:Bool = false;

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}
