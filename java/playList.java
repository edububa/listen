import java.util.*;
import java.io.*;

public class playList {
    private static ArrayList<List> listOfLists = new ArrayList<List>();
    private static Scanner sc = new Scanner(System.in);
    private static boolean exit = true;
    private static String listName;
    private static String path;
    private static final String PROMPT = "playSong>";

    private static int posInListOfList(String name) {
        int i = 0;
        while (i < listOfLists.size() && !listOfLists.get(i).getName().equals(name))
            i++;
        return i;
    }

    private static boolean inListOfLists(String name) { // REVISE
        int i = 0;
        while (i < listOfLists.size() && !listOfLists.get(i).getName().equals(name))
            i++;
        return i < listOfLists.size() || i < listOfLists.size() && listOfLists.get(i).getName().equals(name);
    }

    private static void help() {
        System.out.println();
        System.out.println("------------------------------------------------------------------");
        System.out.println("\tnew    -> creates a new list");
        System.out.println("\tadd    -> adds  a new song to a list");
        System.out.println("\tdelete -> removes a song from a list");
        System.out.println("\tplay   -> plays a list");
        System.out.println("\tlist   -> shows all created lists");
        System.out.println("\tshow   -> shows contents of a list");
        System.out.println("\tquit   -> closes playSong");
        System.out.println("------------------------------------------------------------------");
        System.out.println();
    }

    private static void newList() {
        System.out.println("Write the name for the new list:");
        System.out.print(PROMPT + "new> ");
        listName = sc.next();
        if (inListOfLists(listName))
            System.out.println("List \"" + listName + "\" already created");
        else
            listOfLists.add(new List(listName));
    }

    private static void add() {
        if (listOfLists.isEmpty()) {
            System.out.println("ERROR! you must create a list first");
        } else {
            System.out.println("Write the name of the list which you want to add a song:");
            System.out.print(PROMPT + "add> ");
            listName = sc.next();
            if (!inListOfLists(listName))
                System.out.println("ERROR! List \"" + listName + "\" not found");
            else {
                System.out.println("Write the path for a song: ");
                System.out.print(PROMPT + "add>" + listName + "> ");
                path = sc.next();
                File f = new File(path);
                if (!f.exists()) {
                    System.out.println("ERROR! Song not found");
                } else
                    listOfLists.get(posInListOfList(listName)).addSong(new Song(f));
            }
        }
    }

    private static void delete() {
        if (listOfLists.isEmpty())
            System.out.println("No lists to delete");
        else {
            System.out.println("Write the name of the list which you want to delete a song:");
            listName = sc.next();
            if (!inListOfLists(listName))
                System.out.println("ERROR! List \"" + listName + "\" not found");
            else {
                String song = sc.next();
                if (!listOfLists.get(posInListOfList(listName)).inList(song))
                    System.out.println("ERROR! Song \"" + song + "\" not found" );
            }
        }
    }

    private static void show() {
        if (listOfLists.isEmpty())
            System.out.println("No lists to show");
        else {
            System.out.println("Which list would you like to see?");
            System.out.print(PROMPT + "show> ");
            listName = sc.next();
            if (!inListOfLists(listName))
                System.out.println("ERROR! List \"" + listName + "\" not found");
            else {
                System.out.println();
                System.out.println("------------------------------------------------------------------");
                System.out.println("List: \"" + listName + "\". Contents:");
                System.out.println(listOfLists.get(posInListOfList(listName)).toString());
                System.out.println("------------------------------------------------------------------");
                System.out.println();
            }
        }
    }

    private static void list() {
        if (listOfLists.isEmpty())
            System.out.println("No lists created yet");
        else
            for (List l : listOfLists) {
                System.out.println(l.getName());
            }
    }

    private static void play() {
        if (listOfLists.isEmpty())
            System.out.println("No lists to play");
        else {
            System.out.println("Which list would you like to play?");
            System.out.print(PROMPT + "play> ");
            listName = sc.next();
            if (!inListOfLists(listName))
                System.out.println("ERROR! List \"" + listName + "\" not found");
            else
                listOfLists.get(posInListOfList(listName)).playList();
        }
    }

    public static void main(String[] args) {
        while (exit) {
            System.out.print(PROMPT + " ");
            String input = sc.next();
            switch(input) {
            case "help":
                help();
                break;
            case "new":
                newList();
                break;
            case "add":
                add();
                break;
            case "delete":
                delete();
                break;
            case "show":
                show();
                break;
            case "play":
                play();
                break;
            case "list":
                list();
                break;
            case "quit":
                exit = false;
                break;
            default:
                System.out.println("ERROR! Type \"help\" if you are searching for some help");
            }
        }
        sc.close();
    }
}
