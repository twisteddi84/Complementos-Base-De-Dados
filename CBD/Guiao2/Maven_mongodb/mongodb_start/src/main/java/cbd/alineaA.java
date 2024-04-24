package cbd;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;

public class alineaA {
    public static void main(String[] args) {
        try {
            MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
            MongoDatabase database = mongoClient.getDatabase("testdb");
            MongoCollection<Document> collection = database.getCollection("testcollection");

            // Inserção de um novo documento
            Document documentToInsert = new Document("name", "John")
                    .append("age", 30)
                    .append("city", "New York");
            collection.insertOne(documentToInsert);
            System.out.println("Documento inserido: " + documentToInsert.toJson());

            // Pesquisa de documentos
            Document foundDocument = collection.find(Filters.eq("name", "John")).first();
            if (foundDocument != null) {
                System.out.println("Documento encontrado: " + foundDocument.toJson());
            } else {
                System.out.println("Nenhum documento encontrado com o nome 'John'.");
            }

            // Edição de um documento
            if (foundDocument != null) {
                foundDocument.put("age", 31); // Atualiza a idade para 31
                collection.replaceOne(Filters.eq("_id", foundDocument.get("_id")), foundDocument);
                System.out.println("Documento atualizado: " + foundDocument.toJson());
            } else {
                System.out.println("Não foi possível encontrar o documento para atualização.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

