[CCode (cheader_filename="allegro5/allegro5.h")]
namespace Allegro5{

	class Constants{

		[CCode (cname="ALLEGRO_VERSION_INT")] public static int C_ALLEGRO_VERSION_INT;

		[CCode (cname="ALLEGRO_OPENGL")] public static int C_ALLEGRO_OPENGL;
		[CCode (cname="ALLEGRO_OPENGL_3_0")] public static int C_ALLEGRO_OPENGL_3_0;

		[CCode (cname="ALLEGRO5_WINDOWED")] public static int C_ALLEGRO5_WINDOWED;
		[CCode (cname="ALLEGRO_EVENT_DISPLAY_CLOSE")] public static int C_ALLEGRO_EVENT_DISPLAY_CLOSE;
		[CCode (cname="ALLEGRO_EVENT_TIMER")] public static int C_ALLEGRO_EVENT_TIMER;
	}


	/* AL_EVENT_QUEUE */
	[Compact]
	[CCode(cname="ALLEGRO_EVENT_QUEUE", free_function="al_destroy_event_queue")]
	class EventQueue {
		
		[CCode (cname = "al_create_event_queue")]
	    public EventQueue ();

		[CCode (cname = "al_is_event_queue_empty")]
		public bool Queue_empty();

	}


	/* AL_DISPLAY */
	[Compact]
	[CCode(cname="ALLEGRO_DISPLAY", free_function="al_destroy_display")]
	class Display {

		[CCode (cname = "al_create_display")]
	    public Display (int width, int height);
	}

	/* AL_TIMER */
	[Compact]
	[CCode(cname="ALLEGRO_TIMER", free_function="al_destroy_timer")]
	class Timer {
		
		[CCode (cname = "al_create_timer")]
	    public Timer (int ticks);
	}


	/* ALLEGRO_EVENTS */	

	[Compact]
	[CCode(cname="ALLEGRO_DISPLAY_EVENT", destroy_function = "")]
	struct DisplayEvent {
		int x;
		int y;
		int width;
		int height;
		int orientation;
	}

	[Compact]
	[CCode(cname="ALLEGRO_KEYBOARD_EVENT", destroy_function = "")]
	struct KeyboardEvent {
		int keycode;
		int unichar;
		uint modifiers;
		bool repeat;
	}

	[Compact]
	[CCode(cname="ALLEGRO_TIMER_EVENT", destroy_function = "")]
	struct TimerEvent {
		uint count; // ? DUNNO
		double error;
	}

	[Compact]
	[CCode(cname="ALLEGRO_MOUSE_EVENT", destroy_function = "")]
	struct MouseEvent {
		int x;
		int y;
		int z;
		int w;
		int dx;
		int dy;
		int dz;
		int dw;

		uint button;
		float pressure;
	}

	[Compact]
	[CCode(cname="ALLEGRO_EVENT", destroy_function = "")]
	struct Event {
		int type;
		KeyboardEvent keyboard;
		MouseEvent mouse;
		DisplayEvent display;
		TimerEvent time;
	}


	/* ALLEGRO_EVENT_SOURCE */
	[Compact]
	[CCode(cname="ALLEGRO_EVENT_SOURCE", destroy_function = "")]
	class EventSource {
	}


	/* MANAGER */

	class Manager{

		[CCode(cname="al_install_system")]
		public static bool al_install_system(int version, int b);

		[CCode(cname="al_uninstall_system")]
		public static void al_uninstall_system();

		[CCode(cname="al_set_new_display_flags")]
		public static void al_set_new_display_flags(int flags);

		// Timers
		[CCode(cname="al_start_timer")]
		public static void al_start_timer(Timer tm);

		[CCode(cname="al_wait_for_event")]
		public static void al_wait_for_event(Allegro5.EventQueue queue, out Allegro5.Event ev);

		// Install Systems
		[CCode(cname="al_install_keyboard")]
		public static bool al_install_keyboard();

		[CCode(cname="al_install_mouse")]
		public static bool al_install_mouse();


		[CCode(cname="al_flip_display")]
		public static void al_flip_display();

		// Get event sources

		[CCode(cname="al_get_keyboard_event_source")]
		public static unowned Allegro5.EventSource al_get_keyboard_event_source();
		
		[CCode(cname="al_get_mouse_event_source")]
		public static unowned Allegro5.EventSource al_get_mouse_event_source();

		[CCode(cname="al_get_timer_event_source")]
		public static unowned Allegro5.EventSource al_get_timer_event_source(Timer t);

		[CCode(cname="al_get_display_event_source")]
		public static unowned Allegro5.EventSource al_get_display_event_source(Display d);

	
		[CCode(cname="al_register_event_source")]
		public static void al_register_event_source(Allegro5.EventQueue queue, Allegro5.EventSource source);


	}

}


