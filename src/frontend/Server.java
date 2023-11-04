package frontend;

import backend.Answer;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Server {

    private static DataInputStream dis;
    private static DataOutputStream dos;
    private static ServerSocket ss;
    private static Socket s;
    private static String message = "";
    private static String chatBot;
    private static int portServer = 1239;
    public static void main(String[] args) {
        try {
            ss = new ServerSocket(portServer);
            s = ss.accept();
            Server server = new Server();
            dis = new DataInputStream(s.getInputStream());
            dos = new DataOutputStream(s.getOutputStream());
            System.out.println("Server Running On Port " + portServer);
            while (!message.equalsIgnoreCase("/quit")) {
                message = dis.readUTF();
                String category;
                Answer answer = new Answer();
                ArrayList<Answer> list = answer.filterAsk(message);
                
                if (message.equalsIgnoreCase("/quit")) {
                    System.out.println("Application Stopped");
                    System.exit(0);
                } else if (list.isEmpty()) {
                    category = "Bot: I'm currently in the development phase, and I don't understand this.";
                    System.out.println("You: " + message + "\n" + category + "\n");
                    dos.writeUTF(category);
                } else {
                    for (Answer ans : list) {
                        category = ans.getCategory();
                        chatBot = "Bot: " + answer.cariLur(category);
                        System.out.println("You: " + message + "\n" + chatBot + "\n");
                        dos.writeUTF(chatBot);
                    }
                }
            }
        } catch (IOException e) {
            Logger.getLogger(Server.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
