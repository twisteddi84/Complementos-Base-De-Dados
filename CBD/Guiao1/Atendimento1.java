import java.util.Scanner;

import redis.clients.jedis.Jedis;
public class Atendimento1 {

    public static String timerKey = "timerAtendimento"; //Key timer
    public static int limit = 5; //Limit of produts in timeslot
    public static int timeslot = 60; //Timeslot (seconds)
    public static void main(String[] args) {

        printMenuInicial();
        Scanner scanner = new Scanner(System.in);
        String opcao = scanner.nextLine();
        while(opcao.equals("2") == false){
            if(opcao.equals("1")){
                System.out.print("\033c");
                System.out.printf("Username:");
                String utilizador = scanner.nextLine();
                printMenuUtilizador(utilizador);
                String opcaoUtilizador = scanner.nextLine();
                while(opcaoUtilizador.equals("3") == false){
                    if(opcaoUtilizador.equals("1")){
                        System.out.print("\033c");
                        System.out.printf("Produto:");
                        String produto = scanner.nextLine();
                        storeProduct(utilizador,produto);
                    }else if (opcaoUtilizador.equals("2")){
                        System.out.print("\033c");
                        Jedis jedis = new Jedis();
                        if(jedis.exists(utilizador) == false){
                            System.out.println("Não existem produtos para esse utilizador");
                        }else{
                            System.out.println("Produtos pedidos -> " + jedis.lrange(utilizador,0,-1));
                        }
                        jedis.close();
                    }
                    else{
                        System.out.println("Opção inválida");
                    }
                    printMenuUtilizador(utilizador);
                    opcaoUtilizador = scanner.nextLine();
                }
            }
            else{
                System.out.println("Opção inválida");
            }
            printMenuInicial();
            opcao = scanner.nextLine();
        }
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

    public static void storeProduct(String utilizador,String product){
        Jedis jedis = new Jedis();
        if (jedis.exists(utilizador) == false){
            //jedis.set(utilizador, "1");
            jedis.rpush(utilizador, product);
            jedis.set(utilizador+timerKey,limit+"");
            jedis.expire(utilizador+timerKey,timeslot);
            jedis.decr(utilizador+timerKey);
            System.out.println("Faltam " + jedis.get(utilizador+timerKey) + " produtos para atingir o limite no timeslot");
        }else{
            if(jedis.exists(utilizador+timerKey) == false){
                jedis.set(utilizador+timerKey,limit+"");
                jedis.expire(utilizador+timerKey,timeslot);
            }
            if(Integer.parseInt(jedis.get(utilizador+timerKey)) == 0){
                System.out.println("Limite de produtos atingido");
                jedis.close();
                return;
            }
            jedis.rpush(utilizador, product);
            jedis.decr(utilizador+timerKey);
            System.out.println("Faltam " + jedis.get(utilizador+timerKey) + " produtos para atingir o limite no timeslot");
        }
        System.out.println("Produto adicionado com sucesso -> " + jedis.lrange(utilizador,0,-1));
        jedis.close();
    }

    public static int getLength(String utilizador){
        Jedis jedis = new Jedis();
        Long lengthInit = jedis.llen(utilizador);
        int length = lengthInit.intValue();
        jedis.close();
        return length;
    }
}
