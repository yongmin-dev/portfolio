package baekjoon;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.PrintStream;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		int num = 0; // 처음 입력받은 수
		int sum = 0; // 계산하여 나온 결과
		int cal = 0; // 반복문을 위하여 계산값 설정
		int cnt = 0; // 최종 반복 횟수
		Scanner sc = new Scanner(new BufferedInputStream(System.in));
		num = sc.nextInt();
		cal = num;
		while (num != sum) {
			sum = (cal % 10) * 10 + ((cal / 10) + (cal % 10)) % 10;
			cal = sum;
			cnt = cnt + 1;
		}
		
		System.setOut(new PrintStream(new BufferedOutputStream(System.out)));
		System.out.println(cnt);
	}
}