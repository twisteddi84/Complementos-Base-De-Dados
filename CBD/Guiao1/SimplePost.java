import redis.clients.jedis.Jedis; 
public class SimplePost {
    public static String nomesKey = "nomesLista";
    public static String idadesKey = "idadesHash";
    public static void main(String[] args) {
        Jedis jedis = new Jedis();

        String[] nomes = { "Diogo", "Goncalo", "Tomas", "Duarte" };
        String[] idades = { "20", "19", "22", "18" };

        jedis.del(nomesKey); // remove if exists to avoid wrong type
        jedis.del(idadesKey); // remove if exists to avoid wrong type
        
        for (String nome : nomes) {
            jedis.rpush(nomesKey, nome);
        }

        for(int i = 0; i < nomes.length; i++) {
            jedis.hset(idadesKey, nomes[i], idades[i]);
        }

        System.out.println(jedis.lrange(nomesKey, 0, -1));
        System.out.println(jedis.hgetAll(idadesKey));

        jedis.close();
    }
}
