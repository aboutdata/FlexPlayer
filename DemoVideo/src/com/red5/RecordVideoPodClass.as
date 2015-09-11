package com.red5
{
	
	import flash.media.Camera;
	import flash.media.Video;
	import mx.containers.Box;
	import mx.controls.VideoDisplay;
	
	public class RecordVideoPodClass extends Box
	{
			
		 public var recordVideo:VideoDisplay;
		 private var camera : Camera;  //定义一个摄像头   
        
		public function RecordVideoPodClass()
		{
			
		}
		
		//摄像头加入到画面中
	    public function publish():void{
    	  camera = Camera.getCamera();
		  camera.setMode(480,320,100);
 		  camera.setQuality(0,100);
 		
 		  var video:Video = new Video();   
          video.width = 480;   
		  video.height = 320;
		  video.smoothing = true;
          video.attachCamera(camera);   
          recordVideo.addChild(video); 
	    }
	}
}