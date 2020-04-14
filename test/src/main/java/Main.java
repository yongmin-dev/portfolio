import java.io.BufferedInputStream;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		int num1 = 0; // 처음 입력받은 수
		int num2 = 0; // 
		Scanner sc = new Scanner(new BufferedInputStream(System.in));
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(num1 + num2);
	}
}