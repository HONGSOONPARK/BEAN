package bean.test;

public class 테스트페이지 extends 테스트페이지_상속 {


	public String job;

	@Override
	public void print(){
		System.out.println("이름:"+this.name);
		System.out.println("나이:"+this.age);
		System.out.println("직업:"+this.job);
	}


}
