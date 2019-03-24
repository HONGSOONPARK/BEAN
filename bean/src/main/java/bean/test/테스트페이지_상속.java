package bean.test;

public class 테스트페이지_상속 {


	public String name;
	public String age;

	public void print(){
		System.out.println("이름:"+this.name);
		System.out.println("나이:"+this.age);
	}

	public String print(String name){

		System.out.println("오버로딩 : "+name);

		return name;
	}


}
