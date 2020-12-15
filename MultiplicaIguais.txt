import java.util.Random;

import java.util.Scanner;

class Main {
  public static void main(String[] args) {
      java.util.Scanner scan = new Scanner(System.in);
      Random aleatorio = new Random();
      int x = 0;
      int y = 100;
      int x2= (aleatorio.nextInt((y-x)+1)+x);
      double s = (double)x2/100;
      System.out.println("S = " + s);
      int rep = 0;
      double taxa = 0;
      System.out.print("Inira a quantidade de tentivas: ");
      rep = scan.nextInt();
      scan.nextLine();
      System.out.print("Insira o aprendizado: ");
      taxa = scan.nextDouble();
      double pesos = 0;
      double num = 0;
      for (int i = 1; i <= rep; i++){
        pesos = (s*i)+13;
        num = i+13;
        s = s+((num-pesos)*taxa*(double)i);
        System.out.println(i + "+ 13 =" + pesos);
      }
      for (int i = 1; i <= 100; i++){
        pesos = (s*i)+13;
        System.out.println(i+"+ 13 ="+ pesos);
      }
  }
  
}