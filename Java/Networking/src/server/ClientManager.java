package server;

import java.util.ArrayList;

public class ClientManager
{
    private static ArrayList<Client> clients;

    /**
     * Initializes the ClientManager. Just did this to make my code OCD happy
     */
    public static void init()
    {
        clients = new ArrayList<Client>();
    }

    /**
     * Sends a message to all Clients
     * @param msg Message to be sent
     */
    public static void sendAll(String msg)
    {
        // Iterates over every client, then sends

        for (Client c : clients)
        {
            c.send(msg);
        }
    }

    /**
     * Adds a new Client to the ArrayList
     * @param c Client to be added
     */
    public static void addClient(Client c)
    {
        clients.add(c);
    }

    /**
     * Returns size of ArrayList
     * @return Size of ArrayList
     */
    public static int getSize()
    {
        return clients.size();
    }

    /**
     * Gets all clients
     * @return ArrayList containing clients
     */
    public static ArrayList<Client> getClients()
    {
        return clients;
    }
}
