package bean.test;

public class 테스트메인 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		테스트페이지 테스트 = new 테스트페이지();
		테스트.name = "순홍박";
		테스트.age = "28";
		테스트.job = "백수";


		테스트.print();

		테스트페이지_상속 상속 = new 테스트페이지_상속();

		상속.name = "순홍박";
		상속.age = "28";
		상속.print();

		테스트.print("순홍박");

	}

}
