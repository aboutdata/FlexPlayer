package com.red5.ui
{

	import flash.events.Event;
	import flash.media.Video;
	
	import mx.core.UIComponent;
	
	/**
	 * Video object in Actionscript for displaying streaming video in MXML components.
	 * 
	 * @author Thijs Triemstra
	 */	
	public class VideoContainer extends UIComponent
	{
		
        /**
        * Video object instance.
        */		
        private var _video:Video;
        
		/**
		 * Display live and on-demand NetStream input. 
		 * <p>Listens for resize events.</p>
		 */        
		public function VideoContainer()
		{
			super();
			addEventListener( Event.RESIZE, resizeHandler );
		}

        /**
         * Accept a Video object as source input.
         * @param video Object displaying live or on-demand streaming video.
         */		
        public function set video( video : Video ) : void
        {
            if ( _video != null )
            {
                removeChild( _video );
            }

			_video = video;

           	if ( _video != null )
            {
	            _video.width = width;
                _video.height = height;
                addChild( _video );
            }
        }

        /**
         * Resize the <code>Video</code> object so it matches the dimensions of
         * the interface component.
         * @param event <code>Event.RESIZE</code> 
         */		
        private function resizeHandler( event : Event ) : void
        {
            if ( _video != null )
            {
               _video.width = width;
               _video.height = height;
            }
        }
        
	}
}
