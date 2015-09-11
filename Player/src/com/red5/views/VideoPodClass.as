package com.red5.views
{
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import mx.containers.Box;
	import mx.controls.Label;
	import mx.controls.VideoDisplay;   
	public class VideoPodClass extends Box
	{
		
//		[Bindable]	
//		public var media :Media;
		public var videoPlay :VideoDisplay;
		
		//public var myVideoBox : Box;
		public var statusLabel :Label;
		//private var camera : Camera;  //定义一个摄像头  
		
		private var netConnection:NetConnection;
		private var netStream:NetStream;
		private var appServer:String="rtmp://localhost/oflaDemo";
		
		//private var flexVideo:Video;; 
		
		public function VideoPodClass()
		{
			
		}


		public function start(): void{
			//camera = Camera.getCamera();
			//camera.setMode(640,480,100);
			//camera.setQuality(0,1000);

 			videoPlay.source=netStream;
 			
 			// media.videoRemote = new Video(360, 240);

            // media.videoRemote.attachNetStream(netStream);
            
             netStream.play("stream1441934193034");
		}
		
		public function connect(): void{
 			netConnection = new NetConnection();
 			netConnection.connect(appServer);
 			netConnection.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler);
		}
		
		
		private function netStatusHandler(evt:NetStatusEvent):void
		{
		 if ( evt.info.code=="NetConnection.Connect.Success" )
			 {
			  statusLabel.text="red5连接成功";
			  netStream = new NetStream(netConnection);
			 }
			 else
			 {
			 	 statusLabel.text="red5连接失败";
			  //Alert.show("fms连接失败");
			 }
		}
	}
}