package bean.common.common;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 *  Class Name : Globals.java
 *  Description : 시스템 구동 시 프로퍼티를 통해 사용될 전역변수를 정의한다.
 *  Modification Information
 *
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.01.19    박지욱          최초 생성
 *
 *  @author 공통 서비스 개발팀 박지욱
 *  @since 2009. 01. 19
 *  @version 1.0
 *  @see
 *
 */

public class Globals {

	  public static final String REAL_PATH = Globals.class.getResource("").getPath().substring(0, Globals.class.getResource("").getPath().lastIndexOf("bean"));
	  public static final String GLOBALS_PROPERTIES_FILE = REAL_PATH + "egovProps/globals.properties";
	  public static final String BOARD_PROPERTIES_FILE = REAL_PATH + "egovProps/conf/board.properties";

	  public static final String BOARD_UPLOAD_PATH = Globals.getProperty(BOARD_PROPERTIES_FILE,"file.upload.dir");

	  public static final String KAKAO_REST_API = Globals.getProperty(GLOBALS_PROPERTIES_FILE,"Globals.kakaoRestApi");
	  public static final String KAKAO_JS_API = Globals.getProperty(GLOBALS_PROPERTIES_FILE,"Globals.kakaoJsApi");
	  public static final String KAKAO_NATIVE_API = Globals.getProperty(GLOBALS_PROPERTIES_FILE,"Globals.kakaoNativeApi");
	  public static final String KAKAO_ADMIN_API = Globals.getProperty(GLOBALS_PROPERTIES_FILE,"Globals.kakaoAdminApi");
	  public static final String KAKAO_REDIRECT_URL = Globals.getProperty(GLOBALS_PROPERTIES_FILE,"Globals.kakaoRedirectURL");








	  public static String getProperty(String propertiesFile, String key){



		String value = "";
		Properties props = new Properties();
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(propertiesFile);
			props.load(new BufferedInputStream(fis));
			value = props.getProperty(key).trim();
			fis.close();

		}catch(FileNotFoundException fne){
			fne.getMessage();
		}catch(IOException ioe){
			ioe.getMessage();
		}finally{
			try {
				if (fis != null) fis.close();
			} catch (Exception ex) {
			}
		}

		return value;
	  }




}
