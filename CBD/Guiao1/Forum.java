import redis.clients.jedis.Jedis;
public class Forum {
    public static void main(String[] args) {
    // Ensure you have redis-server running
    Jedis jedis = new Jedis();
    System.out.println(jedis.ping());
    System.out.println(jedis.set("foo", "bar"));
    System.out.println(jedis.get("foo"));
    jedis.close();
    }
}