package server;

import java.io.IOException;
import java.net.ServerSocket;

public class ServerMain
{
    public static void main(String[] args)
    {
        ClientManager.init(); // Initialize the ClientManager

        ServerSocket s = null; // It needs to be null to get Java to not hate it
        try
        {
            s = new ServerSocket(443); // 443 - Port to listen on.
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        // Common Ports:
        // 21 - FTP/S
        // 22 - SSH/SFTP
        // 53 - DNS
        // 80 - HTTP
        // 443 HTTPS

        // List of common port denominations:
        // https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers


        // This code is a bit of fun. It's a while(true) loop that infinitely accepts connections. It's recommended to
        // run this in a separate thread, however, using ClientManager.size(), you can quit it if you only need two
        // players, etc.
        while (true)
        {
            try
            {
                // A fun one-liner. Calls the addClient method on ClientManager, with a new Client object that takes
                // s.accept() as a parameter. Fun fact - s.accept() is a blocking method. It will only add *after* it
                // has gotten a new connection. It's annoying, but it's how it's done.

                ClientManager.addClient(new Client(s.accept()));
            }
            catch (IOException e) // Because Java
            {
                e.printStackTrace();
            }
        }
    }
}
