import java.util.Scanner;

import redis.clients.jedis.Jedis;

public class Atendimento2 {

    public static String timerKey = "timerAtendimento"; //Key timer
    public static int limit_quantity = 30; //Limit of produts in timeslot
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
                        System.out.printf("Quantidade:");
                        int quantidade = scanner.nextInt();
                        scanner.nextLine();
                        storeProduct(utilizador,produto,quantidade);
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

    public static void storeProduct(String utilizador,String product,int quantidade){
        Jedis jedis = new Jedis();
        String pedido = product + "-" + quantidade;
        String timer = utilizador + "timer";
        if(jedis.exists(utilizador) == false){
            jedis.set(timer,limit_quantity+"");
            jedis.expire(timer,timeslot);
            addPedido(utilizador, pedido, timer, quantidade);
        }else{
            addPedido(utilizador, pedido, timer, quantidade);
        }
    }

    public static int getLength(String utilizador){
        Jedis jedis = new Jedis();
        Long lengthInit = jedis.llen(utilizador);
        int length = lengthInit.intValue();
        jedis.close();
        return length;
    }

    public static void decrTimer (String timer, int quantidade){
        Jedis jedis = new Jedis();
        for (int i = 0; i < quantidade; i++) {
            jedis.decr(timer);
        }
        System.out.println("Faltam " + jedis.get(timer) + " produtos para o timeslot");
    }

    public static void addPedido(String utilizador, String pedido,String timer, int quantidade){
        Jedis jedis = new Jedis();
        if(jedis.exists(timer) == false){
            jedis.set(timer,limit_quantity+"");
            jedis.expire(timer,timeslot);
        }
        if(quantidade>Integer.parseInt(jedis.get(timer))){
            System.out.println("Não é possível adicionar o produto");
            return;
        }
        for (int i = 0;i<getLength(utilizador);i++){
            String pedidos_feitos = jedis.lindex(utilizador,i);
            String[] parts = pedidos_feitos.split("-");
            String produto_anterior = parts[0];
            String produto_atual = pedido.split("-")[0];
            if(produto_anterior.equals(produto_atual)){
                int quantidade_total = Integer.parseInt(parts[1]) + quantidade;
                if(quantidade>Integer.parseInt(jedis.get(timer))){
                    System.out.println("Não é possível adicionar o produto");
                    return;
                }
                pedido = produto_atual + "-" + quantidade_total;
                jedis.lset(utilizador,i,pedido);
                decrTimer(timer, quantidade);
                return;
            }
        }
        jedis.rpush(utilizador, pedido);
        decrTimer(timer, quantidade);
    }
}