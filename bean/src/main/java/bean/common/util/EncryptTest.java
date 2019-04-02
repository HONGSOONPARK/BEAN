package bean.common.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;



public class EncryptTest {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
    	StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
        pbeEnc.setPassword("!hspark09#$");

        String url = "bean";
        String username = "bean123";
        String password = "jdbc:mysql://192.168.219.10:3306/bean?serverTimezone=UTC";
        String password2 = "jdbc:mysql://192.168.219.111:3306/bean?serverTimezone=UTC";
        String password3 = "jdbc:mysql://116.45.90.231:3306/bean?serverTimezone=UTC";
        String password4 = "http://hongsoon.ga:8888/bean/kakao/kakaoAuth.do";
        String password5 = "http://localhost:8080/bean/kakao/kakaoAuth.do";

        System.out.println("기존  URL :: " + url + " | 변경 URL :: " + pbeEnc.encrypt(url));
        System.out.println("기존  username :: " + username + " | 변경 username :: " + pbeEnc.encrypt(username));
        System.out.println("기존  password :: " + password + " | 변경 password :: " + pbeEnc.encrypt(password));
        System.out.println("기존  password :: " + password2 + " | 변경 password :: " + pbeEnc.encrypt(password2));
        System.out.println("기존  password :: " + password3 + " | 변경 password :: " + pbeEnc.encrypt(password3));
        System.out.println("기존  password :: " + password4 + " | 변경 password :: " + pbeEnc.encrypt(password4));
        System.out.println("기존  password :: " + password5 + " | 변경 password :: " + pbeEnc.encrypt(password5));

    }


}





