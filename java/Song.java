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
        try {
            Process p = Runtime.getRuntime().exec("afplay " + this.song.getAbsolutePath());
            String s = "";
            while (p.isAlive() && !s.equals("next")) {
                Scanner sc = new Scanner(System.in);
                s = sc.next();
                if (!s.equals("next"))
                    System.out.println("type next if you want to skip");
            }
            p.destroy();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public String toString() {
        return "Name: " + this.song.getName();
    }
}
