package bean.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bean.brd.BrdFileVO;
import bean.common.common.Globals;

@Component("fileUtils")
public class FileUtils {
//    private static final String filePath = "C:\\eGovFrameDev\\uploadFile\\";
//	private static final String filePath = "C:\\eGovFrameDev\\workspace\\bean\\src\\main\\webapp\\uploadFile\\";

	private static final String filePath = Globals.BOARD_UPLOAD_PATH;


	private BrdFileVO returnFileVo;
	private List<BrdFileVO> list;

    public List<BrdFileVO> parseInsertFileInfo(BrdFileVO brdfilevo, MultipartHttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        list = new ArrayList<>();


        File file = new File(filePath);
        if(file.exists() == false){
            file.mkdirs();
        }

        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;

                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file);

                returnFileVo = new BrdFileVO();

                returnFileVo.setBrdid(brdfilevo.getBrdid());
                returnFileVo.setBrdidx(brdfilevo.getBrdidx());
                returnFileVo.setOriginalfilename(originalFileName);
                returnFileVo.setStoredfilename(storedFileName);
                returnFileVo.setFilesize(multipartFile.getSize());
                returnFileVo.setRegid(brdfilevo.getRegid());
                returnFileVo.setFileext(originalFileName.substring(originalFileName.lastIndexOf(".") + 1));


                list.add(returnFileVo);


            }
        }

        return list;
    }



    public List<BrdFileVO> parseUpdateFileInfo(BrdFileVO brdfilevo, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
	   	String requestName = null;
	   	String fileidx = null;
        list = new ArrayList<>();
//        int count = 0;

        while(iterator.hasNext()){



            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;


                multipartFile.transferTo(new File(filePath + storedFileName));

                returnFileVo = new BrdFileVO();

                returnFileVo.setIs_new("Y");
                returnFileVo.setBrdid(brdfilevo.getBrdid());
                returnFileVo.setBrdidx(brdfilevo.getBrdidx());
                returnFileVo.setOriginalfilename(originalFileName);
                returnFileVo.setStoredfilename(storedFileName);
                returnFileVo.setFilesize(multipartFile.getSize());
                returnFileVo.setRegid(brdfilevo.getRegid());
                returnFileVo.setFileext(originalFileName.substring(originalFileName.lastIndexOf(".") + 1));

                list.add(returnFileVo);
            }

            else{

                if(brdfilevo.getFileidx() != null){
                	requestName = multipartFile.getName();
                	fileidx = requestName.substring(requestName.indexOf("_")+1);


                	returnFileVo = new BrdFileVO();
                	returnFileVo.setIs_new("N");
                	returnFileVo.setBrdidx(brdfilevo.getBrdidx());
                	returnFileVo.setFileidx(Integer.parseInt(fileidx));

                    list.add(returnFileVo);
                }
            }
        }


        return list;
    }





















}





//@Component("fileUtils")
//public class FileUtils {
//    private static final String filePath = "C:\\eGovFrameDev\\uploadFile\\";
//
//    public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
//        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
//
//        MultipartFile multipartFile = null;
//        String originalFileName = null;
//        String originalFileExtension = null;
//        String storedFileName = null;
//
//        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//        Map<String, Object> listMap = null;
//
//        String brdIdx = (String)map.get("idx");
//        String regId = (String)map.get("regid");
//
//        File file = new File(filePath);
//        if(file.exists() == false){
//            file.mkdirs();
//        }
//
//        while(iterator.hasNext()){
//            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
//            if(multipartFile.isEmpty() == false){
//                originalFileName = multipartFile.getOriginalFilename();
//                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
//                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
//
//                file = new File(filePath + storedFileName);
//                multipartFile.transferTo(file);
//
//                listMap = new HashMap<String,Object>();
//                listMap.put("BRDIDX", brdIdx);
//                listMap.put("ORIGINALFILENAME", originalFileName);
//                listMap.put("STOREDFILENAME", storedFileName);
//                listMap.put("FILESIZE", multipartFile.getSize());
//                listMap.put("REGID", regId);
//                list.add(listMap);
//            }
//        }
//        return list;
//    }
//
//
//
//
//
//
//
//    public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
//        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
//
//        MultipartFile multipartFile = null;
//        String originalFileName = null;
//        String originalFileExtension = null;
//        String storedFileName = null;
//
//        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//
//        Map<String, Object> listMap = null;
//
//        String brdIdx = (String)map.get("idx");
//        String regId = (String)map.get("regid");
//        String requestName = null;
//        String idx = null;
//
//        while(iterator.hasNext()){
//            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
//            if(multipartFile.isEmpty() == false){
//                originalFileName = multipartFile.getOriginalFilename();
//                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
//                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
//
//                multipartFile.transferTo(new File(filePath + storedFileName));
//
//                listMap = new HashMap<String,Object>();
//                listMap.put("IS_NEW", "Y");
//                listMap.put("BRDIDX", brdIdx);
//                listMap.put("ORIGINALFILENAME", originalFileName);
//                listMap.put("STOREDFILE_NAME", storedFileName);
//                listMap.put("FILESIZE", multipartFile.getSize());
//                listMap.put("REGID", regId);
//                list.add(listMap);
//            }
//
//            else{
//
//                requestName = multipartFile.getName();
//                idx = "idx_"+requestName.substring(requestName.indexOf("_")+1);
//                if(map.containsKey(idx) == true && map.get(idx) != null){
//                    listMap = new HashMap<String,Object>();
//                    listMap.put("IS_NEW", "N");
//                    listMap.put("FILEIDX", map.get(idx));
//                    list.add(listMap);
//                }
//            }
//        }
//        return list;
//    }
//
//
//}