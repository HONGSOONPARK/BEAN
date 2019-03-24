package bean.test;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class 서브스트링테슷 {


	public static final String RELATIVE_PATH_PREFIX = 서브스트링테슷.class.getResource("").getPath().substring(0, 서브스트링테슷.class.getResource("").getPath().lastIndexOf("bean"));
    public static final String GLOBALS_PROPERTIES_FILE = RELATIVE_PATH_PREFIX + "egovProps/globals.properties";

	public static void main(String[] args) {
		String var = "홍.순이.jpg";
		System.out.println(var);
		System.out.println(var.substring(var.lastIndexOf(".") + 1));


		System.out.println(GLOBALS_PROPERTIES_FILE);




		String value = "에러코드";
		value="99";
		Properties props = new Properties();
		FileInputStream fis = null;


		String key = "Globals.ServerIP";


		try{
			fis = new FileInputStream(GLOBALS_PROPERTIES_FILE);
			props.load(new BufferedInputStream(fis));
			value = props.getProperty(key).trim();
			fis.close();

		}catch(FileNotFoundException fne){
		}catch(IOException ioe){
		}finally{
			try {
				if (fis != null) fis.close();
			} catch (Exception ex) {
				//ex.printStackTrace();
				//System.out.println("IGNORE: " + ex);	// 2011.10.10 보안점검 후속조치
			}
		}


		System.out.println(value);


	}


	public void getValue(){






	}





}







