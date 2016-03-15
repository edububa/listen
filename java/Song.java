import java.util.*;
import java.io.*;

public class Song {
    private File song;

    public Song(File song) {
        this.song = song;
    }

    public String getName() {
        return this.song.getName();
    }

    public void playSong() {
        System.out.println("Playing " + this.song.getName());
    }

    public String toString() {
        return "Name: " + this.song.getName();
    }
}
