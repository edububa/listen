import java.util.*;
import java.io.*;

public class List {
    private String name;
    private ArrayList<Song> songs;

    public List(String name) {
        this.name = name;
        this.songs = new ArrayList<Song>();
    }

    public String getName() {
        return this.name;
    }
    public void addSong(Song s) {
        songs.add(s);
    }

    public void addSong(Song s, int i) {
        songs.add(i, s);
    }

    public void playList() {
        for (Song s : this.songs) {
            s.playSong();
        }
    }

    public void playSong(int i) {
        this.songs.get(i-1).playSong();
    }

    public void removeSong(int i){
        this.songs.remove(i-1);
    }

    public boolean inList(String name) {
        int i = 0;
        while (i < this.songs.size() && !this.songs.get(i).getName().equals(name))
            i++;
        return !(i < this.songs.size() && !this.songs.get(i).getName().equals(name));
    }

    public String toString() {
        String r = "";
        int track = 1;
        for (Song s : this.songs) {
            r += "\tTrack: " + track + " " + s.toString();
            if (track < this.songs.size())
                r += "\n";
            track++;
        }
        return r;
    }
}
