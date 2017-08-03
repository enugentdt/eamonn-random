package client;

public class ClientMain
{
    public static void main(String[] args)
    {
        // Creates a new Client object, with
        // an IP of "172.0.0.1", and a port
        // of 443
        Client c = new Client("172.0.0.1", 443);

        // Connect to the server
        c.connect();
    }

    public static void gotMessage(String msg)
    {
        // This is where you get to have fun with the message
    }
}
