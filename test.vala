using Allegro5;

class Demo.HelloWorld : GLib.Object {

    public static int main(string[] args) {

		/* Init systems */
		int FPS = 60;

		stdout.printf("T:%d\n", Allegro5.Constants.C_ALLEGRO_VERSION_INT);

		Allegro5.Manager.al_install_system(Allegro5.Constants.C_ALLEGRO_VERSION_INT,0);

		Allegro5.Manager.al_set_new_display_flags(Allegro5.Constants.C_ALLEGRO_OPENGL | Allegro5.Constants.C_ALLEGRO_OPENGL_3_0);
		Allegro5.Display demoDisplay = new Allegro5.Display(640,480);
		Allegro5.EventQueue demoQueue = new Allegro5.EventQueue();
		Allegro5.Event event;
		Allegro5.Timer t = new Allegro5.Timer(1/FPS);

		/* Init event systems */
		if(!Allegro5.Manager.al_install_keyboard()){
			stdout.printf ("CANNOT INSTALL KEYBOARD\n");
		}

		if(!Allegro5.Manager.al_install_mouse()){
			stdout.printf ("CANNOT INSTALL MOUSE\n");
		}

		/* Register event sources */
		Allegro5.Manager.al_register_event_source(demoQueue, Allegro5.Manager.al_get_display_event_source(demoDisplay));
		Allegro5.Manager.al_register_event_source(demoQueue, Allegro5.Manager.al_get_timer_event_source(t));
		Allegro5.Manager.al_register_event_source(demoQueue, Allegro5.Manager.al_get_keyboard_event_source());
		Allegro5.Manager.al_register_event_source(demoQueue, Allegro5.Manager.al_get_mouse_event_source());


		/* Redraw flag */
		bool needs_redraw = false;

		/* Event Loop */
		while(true){
			Allegro5.Manager.al_wait_for_event(demoQueue, out event);

			if(event.type == Allegro5.Constants.C_ALLEGRO_EVENT_TIMER) {
				needs_redraw = true;
    	    }

			stdout.printf("Event type: %d\n", event.type);
			stdout.printf("Event code: %d\n", event.keyboard.keycode);

			//
			if (event.type == Allegro5.Constants.C_ALLEGRO_EVENT_DISPLAY_CLOSE){
				break;	
			}


			if(needs_redraw && demoQueue.Queue_empty()){
				Allegro5.Manager.al_flip_display();
				needs_redraw = false;
			}
			
		}

		stdout.printf ("FINISH\n");

		//Allegro5.Manager.al_uninstall_system();	
        return 0;
    }
}
