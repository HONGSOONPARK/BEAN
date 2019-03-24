package bean.test;

import java.util.Scanner;

public class 테스트정렬_연습
{

    public static void main(String[] args) {


    	SortTest sort = new SortTest();

//    	int [] totalNum = {10,55,5,20,1,17,8};

    	Scanner sc = new Scanner(System.in);


    	System.out.print("총 갯수 : ");
    	int num = sc.nextInt();

    	int[] totalNum = new int[num];


    	for(int i=0; i<totalNum.length; i++){
    		System.out.print("입력 : ");
    		totalNum[i] = sc.nextInt();
    	}



    	System.out.println("입력데이터 >");
    	for(int a : totalNum){
    		System.out.printf("%3d",a);
    	}


    	System.out.println("\n정렬 선택 >");
    	System.out.println("1. 선택정렬 / 2. 삽입정렬 / 3.버블정렬");


    	boolean check = false;
    	do{
    		int selectNum = sc.nextInt();
	    	if(selectNum == 1){
	    		sort.select(totalNum);
	    		check=true;
	    	}
	    	else if(selectNum == 2){
	    		sort.insert(totalNum);
	    		check=true;
	    	}else if(selectNum == 3){
	    		sort.bubble(totalNum);
	    		check=true;
	    	}else{
	    		System.out.println("실패! 다시입력");
	    	}
    	}while(!check);

    	sc.close();

//    	System.out.println("입력데이터 >");
//    	for(int a : input){
//    		System.out.printf("%3d",a);
//    	}
//    	System.out.println("\n===============================");
//    	sort.select(input);
//    	sort.bubble(input);

    }




}



class SortTest{

	public void select(int[] input){
		for(int i=0; i<input.length - 1; i++){
			int min = i;
			for(int l=i+1; l<input.length; l++){
				if(input[l] < input[min]){
					min = l;
				}
			}
			swap(input, min, i);

			System.out.printf("\n 선택정렬 %d 단계 \n", i+1 );

			for(int a : input){
				System.out.printf("%3d", a);
			}
			System.out.println();
		}
	}


	public void insert(int[] input){

		for(int i=1; i<input.length; i++){

			int key = input[i];

			System.out.printf("\n 삽입정렬 %d 단계 \n", i );
			System.out.println("\nkey :"+key);

			for(int a : input){
				System.out.printf("%3d", a);
			}
			System.out.println();

			for(int l=i-1; l>=0 && input[l] > key; l--){
				input[l+1] = input[l];
				input[l] = key;

				for(int a : input){
					System.out.printf("%3d", a);
				}
				System.out.println();
			}
			System.out.println("===============================");
		}
	}


	public void bubble(int[] input){

	 for(int i=input.length-1; i>0; i--) {
	     System.out.printf("\n버블 정렬 %d 단계 : ", input.length-i);
	     for(int l=0; l<i; l++) {
	         if(input[l] > input[l+1]) {
	             swap(input,l,l+1);
	         }
	         System.out.printf("\n\t");
	         for(int a : input) {
	             System.out.printf("%3d ", a);
	         }
	     }
	 }
	 System.out.println();
	}


	public void swap(int[] input, int idx1, int idx2){
		int temp;
		temp = input[idx1];
		input[idx1] = input[idx2];
		input[idx2] = temp;
	}

}