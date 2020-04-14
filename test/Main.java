
public class Main {
	public static void main(String[] args) {
		int num1 = 0; // 처음 입력받은 수
		int num2 = 0; // 
		Scanner sc = new Scanner(new BufferedInputStream(System.in));
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		
		Thread.sleep(1000);
		
		System.out.println(num1 + num2);
	}
}