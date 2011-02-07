public class BeatBox.Settings : Object {
	GConf.Client client;
	
	public static const string LASTFM_USERNAME = "/apps/beatbox/preferences/lastfm/username";
	public static const string LASTFM_PASSWORD = "/apps/beatbox/preferences/lastfm/pass";
	public static const string LASTFM_AUTO_LOGIN = "/apps/beatbox/preferences/lastfm/auto_login";
	public static const string LASTFM_SESSION_KEY = "/apps/beatbox/preferences/lastfm/lastfm_session_key";
	
	public static const string MUSIC_FOLDERS = "/apps/beatbox/preferences/music/music_locations";
	public static const string WRITE_TO_METADATA = "/apps/beatbox/preferences/music/write_to_metadata";
	public static const string UPDATE_FOLDER_HIERARCHY = "/apps/beatbox/preferences/music/update_folder_hierarchy";
	public static const string COPY_IMPORTED_MUSIC = "/apps/beatbox/preferences/music/copy_imported_music";
	
	public static const string WINDOW_MAXIMIZED = "/apps/beatbox/preferences/ui/window_maximized";
	public static const string WINDOW_WIDTH = "/apps/beatbox/preferences/ui/window_width";
	public static const string WINDOW_HEIGHT = "/apps/beatbox/preferences/ui/window_height";
	public static const string SIDEBAR_WIDTH = "/apps/beatbox/preferences/ui/sidebar_width";
	
	public Settings() {
		client = GConf.Client.get_default();
	}
	
	private bool getBool(string path, bool def) {
		bool rv = def;
		
		try {
			if(client.get(path) != null) {
				rv = client.get_bool(path);
			}
			else
				rv = def;
		}
		catch(GLib.Error err) {
			stdout.printf("Could not get bool value %s from gconf: %s\n", path, err.message);
		}
		
		return rv;
	}
	
	private string getString(string path, string def) {
		string rv = def;
		
		try {
			if(client.get(path) != null) {
				rv = client.get_string(path);
			}
			else
				rv = def;
		}
		catch(GLib.Error err) {
			stdout.printf("Could not get string value %s from gconf: %s\n", path, err.message);
		}
		
		return rv;
	}
	
	private int getInt(string path, int def) {
		int rv = def;
		
		try {
			if(client.get(path) != null) {
				rv = client.get_int(path);
			}
			else
				rv = def;
		}
		catch(GLib.Error err) {
			stdout.printf("Could not get int value %s from gconf: %s\n", path, err.message);
		}
		
		return rv;
	}
	
	private void setBool(string path, bool val) {
		try {
			client.set_bool(path, val);
		}
		catch(GLib.Error err) {
			stdout.printf("Could not set bool value %s from gconf: %s\n", path, err.message);
		}
	}
	
	private void setString(string path, string val) {
		try {
			client.set_string(path, val);
		}
		catch(GLib.Error err) {
			stdout.printf("Could not set string value %s from gconf: %s\n", path, err.message);
		}
	}
	
	private void setInt(string path, int val) {
		try {
			client.set_int(path, val);
		}
		catch(GLib.Error err) {
			stdout.printf("Could not set int value %s from gconf: %s\n", path, err.message);
		}
	}
	
	/** Get values **/
	public string getMusicFolders() {
		return getString(MUSIC_FOLDERS, "");
	}
	
	public Gee.LinkedList<string> getMusicFoldersList() {
		Gee.LinkedList<string> rv = new Gee.LinkedList<string>();
		string[] locations = getMusicFolders().split("<location_seperator>", 0);
		
		int index;
		for(index = 0; index < locations.length - 1; ++index) {
			if("/" in locations[index]) //make sure it is not empty
				rv.add(locations[index]);
		}
		
		return rv;
	}
	
	public bool getWindowMaximized() {
		return getBool(WINDOW_MAXIMIZED, false);
	}
	
	public int getWindowWidth() {
		return getInt(WINDOW_WIDTH, 900);
	}
	
	public int getWindowHeight() {
		return getInt(WINDOW_HEIGHT, 600);
	}
	
	public int getSidebarWidth() {
		return getInt(SIDEBAR_WIDTH, 200);
	}
	
	public bool getWriteToMetadata() {
		return getBool(WRITE_TO_METADATA, false);
	}
	
	public bool getUpdateFolderHierarchy() {
		return getBool(UPDATE_FOLDER_HIERARCHY, false);
	}
	
	public bool getCopyImportedMusic() {
		return getBool(COPY_IMPORTED_MUSIC, false);
	}
	
	public string getLastFMUsername() {
		return getString(LASTFM_USERNAME, "");
	}
	
	public string getLastFMPassword() {
		return getString(LASTFM_PASSWORD, "");
	}
	
	public bool getLastFMAutoLogin() {
		return getBool(LASTFM_AUTO_LOGIN, false);
	}
	
	public string getLastFMSessionKey() {
		return getString(LASTFM_SESSION_KEY, "");
	}
	
	/** Set Values **/
	public void setMusicFolders(string path) {
		setString(MUSIC_FOLDERS, path);
	}
	
	public void setMusicFoldersFromList(Gee.LinkedList<string> locations) {
		string rv = "";
		
		foreach(string location in locations) {
			rv += location + "<location_seperator>";
		}
		
		setMusicFolders(rv);
	}
	
	public void setWindowMaximized(bool val) {
		setBool(WINDOW_MAXIMIZED, val);
	}
	
	public void setWindowWidth(int val) {
		setInt(WINDOW_WIDTH, val);
	}
	
	public void setWindowHeight(int val) {
		setInt(WINDOW_HEIGHT, val);
	}
	
	public void setSidebarWidth(int val) {
		setInt(SIDEBAR_WIDTH, val);
	}
	
	public void setWriteToMetadata(bool val) {
		setBool(WRITE_TO_METADATA, val);
	}
	
	public void setUpdateFolderHierarchy(bool val) {
		setBool(UPDATE_FOLDER_HIERARCHY, val);
	}
	
	public void setCopyImportedMusic(bool val) {
		setBool(COPY_IMPORTED_MUSIC, val);
	}
	
	public void setLastFMUsername(string val) {
		setString(LASTFM_USERNAME, val);
	}
	
	public void setLastFMPassword(string val) {
		setString(LASTFM_PASSWORD, val);
	}
	
	public void setLastFMAutoLogin(bool val) {
		setBool(LASTFM_AUTO_LOGIN, val);
	}
	
	public void setLastFMSessionKey(string val) {
		setString(LASTFM_SESSION_KEY, val);
	}
}
