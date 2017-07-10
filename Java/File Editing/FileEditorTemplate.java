import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class FileFixer_Template
{

	public static BufferedReader br;
	public static BufferedWriter bw;
	public static ArrayList<String> lines;
	
	public static String filename = "file.txt";

	public static void run()
	{

	}

	public static void init()
	{
		try
		{
			br = new BufferedReader(new FileReader(filename));
			bw = new BufferedWriter(new FileWriter("fixed_" + filename));
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public static void write()
	{
		for (String s : lines)
		{
			try
			{
				bw.write(s);
				bw.flush();
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
	}

	public static void read()
	{
		String temp = "";
		try
		{
			while ((temp = br.readLine()) != null)
			{
				lines.add(temp);
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public static void main(String[] args)
	{
		init();
		read();
		run();
		write();
	}
}
