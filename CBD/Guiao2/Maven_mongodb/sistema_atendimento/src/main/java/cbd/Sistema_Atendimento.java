package cbd;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.atomic.AtomicInteger;

import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

public class Sistema_Atendimento {
    public static MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
    public static MongoDatabase database = mongoClient.getDatabase("atendimento");

    public static int limite_produtos = 3;
    public static int tempo = 120;

    public static AtomicInteger produtosAdicionados = new AtomicInteger(0);
    public static void main(String[] args) {
        Timer timer = new Timer();
        TimerTask resetProductCounterTask = new TimerTask() {
            @Override
            public void run() {
                produtosAdicionados.set(0);
            }
        };
        timer.scheduleAtFixedRate(resetProductCounterTask, tempo * 1000, tempo * 1000);
        
        while(true){ 
            printMenuInicial();
            Scanner scanner = new Scanner(System.in);
            int opcao = scanner.nextInt(); 
            if(opcao == 1){
                System.out.println("Insira o seu username");
                String utilizador = scanner.next();
                printMenuUtilizador(utilizador);
                opcao = scanner.nextInt();
                while(true){
                    if(opcao == 1){
                        if (produtosAdicionados.get() < limite_produtos) {
                            System.out.println("Insira o nome do produto");
                            String nome_produto = scanner.next();
                            System.out.println("Produto Adicionado com sucesso !");

                            //Insert the product into MongoDB
                            MongoCollection<Document> collection = getCollection(utilizador);
                            Document produto = new Document("nome", nome_produto);
                            collection.insertOne(produto);

                            //Increment the product counter
                            produtosAdicionados.incrementAndGet();
                        } else {
                            System.out.println("Você atingiu o limite de produtos.");
                        }
                    }else if(opcao == 2){
                        MongoCollection<Document> collection = getCollection(utilizador);
                        FindIterable<Document> documentos = collection.find();
                        for (Document document : documentos) {
                            System.out.println("Nome do produto: " + document.get("nome"));
                        }
                        
                    }else if(opcao == 3){
                        break;
                    }
                    else{
                        System.out.println("Opção inválida");
                    }
                    printMenuUtilizador(utilizador);
                    opcao = scanner.nextInt();
                }

            }else if(opcao == 2){
                break;
            }else{
                System.out.println("Opção inválida");
            }
        }
        mongoClient.close();
        System.exit(0);
    }

    public static void printMenuInicial(){
        System.out.print("\033c");
        System.out.println("1 - Escolher utilizador");
        System.out.println("2 - Sair");
    }

    public static void printMenuUtilizador(String utilizador){
        System.out.println("Username -> " + utilizador);
        System.out.println("1 - Pedir produto");
        System.out.println("2 - Ver produtos pedidos");
        System.out.println("3 - Sair");
    }

    public static MongoCollection<Document> getCollection(String utilizador){
        String nome_collection = utilizador; // Nome da coleção que você deseja verificar
        boolean collectionExists = database.listCollectionNames().into(new ArrayList<>()).contains(nome_collection);
        if(collectionExists){
            MongoCollection<Document> collection = database.getCollection(nome_collection);
            return collection;
        }else{
            database.createCollection(nome_collection);
            MongoCollection<Document> collection = database.getCollection(nome_collection);
            return collection;
        }
    } 

}

