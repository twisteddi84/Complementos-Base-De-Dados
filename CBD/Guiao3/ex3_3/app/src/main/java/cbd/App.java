package cbd;

import com.datastax.driver.core.*;

public class App {
    private static Cluster cluster = Cluster.builder().addContactPoint("127.0.0.1").build();
    private static final String KEYSPACE_NAME = "partilha_videos";
    private static Session session;

    public static void main(String[] args) {
        connectToCassandra();

        insertUtilizador("tomasmatos123", "Tomás Matos", "tm123@gmail.com");

        searchData();

        //query 2
        searchTagsFromVideo("1");

        //query 4 
        searchVideoEventFromUser("joao1", "1");

        //query 3
        searchAllVideoByTag("Aveiro");

        //query 11
        searchAllTags();

        closeConnection();
    }

    private static void connectToCassandra() {
        session = cluster.connect(KEYSPACE_NAME);
    }

    private static void closeConnection() {
        cluster.close();
    }

    private static void insertUtilizador(String username, String nome, String email) {
        String insertQuery = "INSERT INTO utilizadores (username, nome, email, tempo_registo) VALUES ('" + username + "', '" + nome + "', '" + email + "', toTimestamp(now()));";
        session.execute(insertQuery);
    }

    private static void searchData() {
        String searchQuery = "SELECT * FROM utilizadores WHERE username = 'tomasmatos123';";
        ResultSet resultSet = session.execute(searchQuery);
        System.out.println("Utilizador:");
        printResultSet(resultSet);
    }

    private static void searchAllTags() {
        String searchQuery = "SELECT tag, COUNT(*) as num_videos FROM videos_by_tag GROUP BY tag;";
        ResultSet resultSet = session.execute(searchQuery);
        System.out.println("Tags:");
        printResultSet(resultSet);
    }

    private static void searchTagsFromVideo(String video_id) {
        String searchQuery = "SELECT tags FROM videos WHERE video_id = "+ video_id+";";
        ResultSet resultSet = session.execute(searchQuery);
        System.out.println("Tags do video " + video_id + ":");
        printResultSet(resultSet);
    }

    private static void searchVideoEventFromUser(String username, String video_id) {
        String searchQuery = "SELECT * FROM eventos WHERE video_id = "+ video_id+" and username = '"+ username+"' ORDER BY tempo_evento DESC LIMIT 5;";
        ResultSet resultSet = session.execute(searchQuery);
        System.out.println("Eventos do video " + video_id + " do utilizador " + username + ":");
        printResultSet(resultSet);
    }

    private static void searchAllVideoByTag(String tag) {
        String searchQuery = "SELECT * FROM videos_by_tag WHERE tag = '"+ tag +"';";
        ResultSet resultSet = session.execute(searchQuery);
        System.out.println("Videos com a tag " + tag + ":");
        printResultSet(resultSet);
    }

    private static void printResultSet(ResultSet resultSet) {
        for (Row row : resultSet) {
            System.out.println(row.toString());
        }
    }
}
