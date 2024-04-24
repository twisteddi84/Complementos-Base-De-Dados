import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import redis.clients.jedis.Jedis;
public class Autocomplete1 {
    public static String nomesKey = "nomesAutocomplete";
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        //Carregar nomes para o Redis
        carregarNomes(jedis);

        System.out.printf("Search for ('Enter' for quit): ");
        Scanner scanner = new Scanner(System.in);
        String search = scanner.nextLine();

        while(search.equals("") == false){
            for (String nome : jedis.lrange(nomesKey, 0, -1)) {
                if(nome.startsWith(search)){
                    System.out.println(nome);
                }
            }


            System.out.printf("Search for ('Enter' for quit):");
            search = scanner.nextLine();
        }
    }

    public static void carregarNomes(Jedis jedis){
        jedis.del(nomesKey);
        try {
            File myObj = new File("names.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                jedis.rpush(nomesKey, data);
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
