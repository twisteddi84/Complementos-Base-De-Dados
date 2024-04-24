import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import redis.clients.jedis.Jedis;
public class Autocomplete2 {
    public static String nomesKey = "nomesAutocomplete";
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        //Carregar nomes para o Redis
        carregarNomes(jedis);

        System.out.printf("Search for ('Enter' for quit): ");
        Scanner scanner = new Scanner(System.in);
        String search = scanner.nextLine();

        while(search.equals("") == false){
            System.out.printf("%-15s -> %s","Nome","Popularidade");
            System.out.println();
            for (String nome : jedis.zrevrange(nomesKey, 0, -1)) {
                if(nome.startsWith(search)){
                    System.out.printf("%-15s -> %s",nome,jedis.zscore(nomesKey,nome));
                    System.out.println();
                }
            }


            System.out.printf("Search for ('Enter' for quit):");
            search = scanner.nextLine();
        }

        jedis.close();
    }

    public static void carregarNomes(Jedis jedis){
        jedis.del(nomesKey);
        try {
            File myObj = new File("nomes-pt-2021.csv");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                //jedis.rpush(nomesKey, data);
                String[] data_split = data.split(";");
                jedis.zadd(nomesKey, Integer.parseInt(data_split[1]), data_split[0]);
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
