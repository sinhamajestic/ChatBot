package frontend;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.scene.paint.Color;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Client extends Application {

    private DataInputStream dis;
    private DataOutputStream dos;
    private Socket socket;

    private TextArea chatArea;
    private TextField chatInput;
    private Button sendButton;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("ChatBot @sinhamajestic");

        chatArea = new TextArea();
        chatArea.setEditable(false);
        chatArea.setPrefHeight(500);
        chatArea.setStyle("-fx-control-inner-background:rgba(68,70,84,255)");
        chatInput = new TextField();
        chatInput.setPrefHeight(70);
        chatInput.setPrefWidth(650);
        chatInput.setPromptText("Write Your Message");
        chatInput.setStyle("-fx-control-inner-background: rgba(64,65,79,255);-fx-text-fill: #fff;-fx-prompt-text-fill: gray;");
        sendButton = new Button("Send");
        sendButton.setStyle("-fx-base: rgba(25,195,125,255);-fx-prompt-text-fill: gray;");
        sendButton.setPrefHeight(70);
        sendButton.setPrefWidth(90);
        sendButton.setOnAction(event -> sendMessage());

        HBox inputBox = new HBox(chatInput, sendButton);
        // inputBox.setSpacing(10);
        VBox root = new VBox(chatArea, inputBox);
        // root.setSpacing(10);
        root.setStyle("-fx-background-color: lightblue;");

        Scene scene = new Scene(root, 700, 500);
        primaryStage.setScene(scene);
        primaryStage.show();

        try {
            socket = new Socket("127.0.0.1", 1239);
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
        } catch (IOException e) {
            Logger.getLogger(client.class.getName()).log(Level.SEVERE, null, e);
        }

        chatInput.setOnKeyPressed(keyEvent -> {
            if (keyEvent.getCode().equals(javafx.scene.input.KeyCode.ENTER)) {
                sendMessage();
            }
        });
    }

    private void sendMessage() {
        String message = chatInput.getText().trim();
        if (!message.isEmpty()) {
            try {
                dos.writeUTF(message);
                if (message.equalsIgnoreCase("/quit")) {
                    System.out.println("App has been terminated");
                    System.exit(0);
                } else {
                    String botResponse = dis.readUTF();
                    Platform.runLater(() -> {
                        chatArea.appendText("You: " + message + "\n" + botResponse + "\n");
                        chatInput.clear();
                    });
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            chatArea.appendText("\nBot: You cannot enter an empty message\n");
        }
    }
}

