package com.red5
{
	import flash.events.*;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import mx.containers.Box;
	import mx.controls.Button;
	import mx.controls.VideoDisplay;
        
	public class VideoPodClass extends Box
	{
		
		 private var videoURL:String = "stream1441957350700";   
         private var connection:NetConnection;   
		 public var sprct:VideoDisplay;
		 public var startBtn:Button;
		 
		public function VideoPodClass()
		{
		}
		
	   public function start():void
	   {
	      	connection = new NetConnection();   
	        connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);   
	        connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler); 
	        connection.connect("rtmp://localhost/oflaDemo");   
	      	
	   }
               
        private function netStatusHandler(event:NetStatusEvent):void {   
                  switch (event.info.code) {   
                      case "NetConnection.Connect.Success":   
                          connectStream(); 
                          break;   
                      case "NetStream.Play.StreamNotFound":   
                          trace("Unable to locate video: " + videoURL);   
                          break;   
                  }   
            }   
         
         private function connectStream():void {   
                  var stream:NetStream = new NetStream(connection);   
                  stream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);   
                  stream.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);   
                  var video:Video = new Video();   
                  video.width = 480;   
    			  video.height = 320;
    			  video.smoothing = true;
                  video.attachNetStream(stream);   
                  stream.play(videoURL);   
                  sprct.addChild(video);   
              }   
                
        private function securityErrorHandler(event:SecurityErrorEvent):void {   
                  trace("securityErrorHandler: " + event);   
              }   
                
        private function asyncErrorHandler(event:AsyncErrorEvent):void {   
                  // ignore AsyncErrorEvent events.   
              }   

	}
}