package cbd;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.bson.Document;

import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;

public class ex3 {
    public static void main(String[] args) {
        try {
                getLocalidades("Bronx");
                //Liste o restaurant_id, o nome, a localidade e gastronomia dos restaurantes cujo nome começam por "Wil".
                getInfoStartWith("^Wil");

                //Liste o nome, a localidade, o score e gastronomia dos restaurantes que alcançaram sempre pontuações inferiores ou igual a 3.
                getInfEqualDown(3);

                //Apresente o número total de avaliações (numGrades) em cada dia da semana
                getInfoAllDays();

                //Apresente o número de gastronomias diferentes na rua "Fifth Avenue"
                getTotalRua("Fifth Avenue");

                //Apresente o número de localidades diferentes
                System.out.println("Total de localidades diferentes: " + countLocalidades());

                //Apresente o número de restaurantes por localidade
                Map<String, Integer> restaurantCountByLocalidade = countRestByLocalidade();
                System.out.println("Número de restaurantes por localidade:");
                for(Map.Entry<String, Integer> entry : restaurantCountByLocalidade.entrySet()) {
                    System.out.println("-> " + entry.getKey() + " - " + entry.getValue());
                }

                //Apresente o nome dos restaurantes cujo nome contém a palavra "Park"
                String name = "Park";
                List<String> matchingNames = getRestWithNameCloserTo(name);
                System.out.println("Nome dos restaurantes contendo \'" + name + "\' no nome:");
                for (String nome : matchingNames) {
                    System.out.println("-> " + nome);
                }


                } catch (Exception e) {
                e.printStackTrace();
            }
        }

    public static void getLocalidades(String city) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        System.out.println("--------------------------------------------------");
        long count = collection.countDocuments(Filters.eq("localidade", city));
        System.out.println("Total de restaurantes no Bronx: " + count);
        mongoClient.close();
    }

    public static void getInfoStartWith(String city) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        System.out.println("--------------------------------------------------");
        Document doc = new Document("nome", new Document("$regex", city));
        Document projecao = new Document("restaurant_id", 1)
                .append("nome", 1)
                .append("localidade", 1)
                .append("gastronomia", 1)
                .append("_id", 0);

        MongoCursor<Document> cursor1 = collection.find(doc)
                .projection(projecao)
                .iterator();

        while (cursor1.hasNext()) {
        Document document = cursor1.next();
        System.out.println(document.toJson());
        }
        cursor1.close();
        mongoClient.close();
    }

    public static void getInfEqualDown(int value) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        System.out.println("--------------------------------------------------");
        Document filter = new Document("grades",
                new Document("$not",
                        new Document("$elemMatch",
                                new Document("score",
                                        new Document("$gt", value)
                                )
                        )
                )
        );
        Document projection = new Document("nome", 1)
                .append("localidade", 1)
                .append("grades.score", 1)
                .append("gastronomia", 1)
                .append("_id", 0);

        for (Document document : collection.find(filter).projection(projection)) {
                System.out.println(document.toJson());
        }
        mongoClient.close();
    }

    public static void getInfoAllDays() {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        System.out.println("--------------------------------------------------");
        List<Document> pipeline = Arrays.asList(
                new Document("$unwind", "$grades"),
                new Document("$addFields", new Document("dayOfWeek", new Document("$dayOfWeek", "$grades.date"))),
                new Document("$group", new Document("_id", "$dayOfWeek").append("numGrades", new Document("$sum", 1))),
                new Document("$sort", new Document("_id", 1))
        );

        AggregateIterable<Document> result = collection.aggregate(pipeline);

        for (Document document : result) {
                System.out.println(document.toJson());
        }
        mongoClient.close();
    }

    public static void getTotalRua(String rua) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        System.out.println("--------------------------------------------------");
        AggregateIterable<Document> resultado = collection.aggregate(
                Arrays.asList(
                Aggregates.match(new Document("address.rua", rua)),
                Aggregates.group("$gastronomia")
                )
        );

        for (Document document : resultado) {
                System.out.println(document.toJson());
        }
        mongoClient.close();
    }

    public static int countLocalidades() {
        System.out.println("--------------------------------------------------");
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        Document groupStage = new Document("$group", new Document("_id", null)
                .append("localidades", new Document("$addToSet", "$localidade")));

        Document projectStage = new Document("$project", new Document("_id", 0)
                .append("localidadesCount", new Document("$size", "$localidades")));

        Document result = collection.aggregate(Arrays.asList(groupStage, projectStage)).first();

        if (result != null) {
            return result.getInteger("localidadesCount");
        } else {
            return 0;
        }
    }

    public static Map<String, Integer> countRestByLocalidade() {
        System.out.println("--------------------------------------------------");
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        Map<String, Integer> restaurantCountByLocalidade = new HashMap<>();

        AggregateIterable<Document> results = collection.aggregate(
            Arrays.asList(
                new Document("$group", new Document("_id", "$localidade")
                    .append("count", new Document("$sum", 1))
                )
            )
        );

        for (Document document : results) {
            String localidade = document.getString("_id");
            int count = document.getInteger("count");
            restaurantCountByLocalidade.put(localidade, count);
        }

        return restaurantCountByLocalidade;
    }

    public static List<String> getRestWithNameCloserTo(String name) {
        System.out.println("--------------------------------------------------");
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        List<String> matchingNames = new ArrayList<>();

        FindIterable<Document> results = collection.find(Filters.regex("nome", ".*" + name + ".*", "i"));

        for (Document document : results) {
            matchingNames.add(document.getString("nome"));
        }

        return matchingNames;
    }

}