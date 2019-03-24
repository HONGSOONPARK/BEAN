package bean.common.common;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class CommonController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private static final String filePath = Globals.BOARD_UPLOAD_PATH;
	Logger log = Logger.getLogger(this.getClass());
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Resource(name="commonService")
    private CommonService commonService;

	@RequestMapping(value="/common/downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception{

	    Map<String,Object> map = commonService.selectFileInfo(commandMap.getMap());

	    String storedFileName = (String)map.get("STORED_FILE_NAME");
	    String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");


	    byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath+storedFileName));
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);

	    response.getOutputStream().flush();
	    response.getOutputStream().close();

	}


	@RequestMapping(value="/common/selectCommonCode.do" , method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> selectCommonCode(@RequestBody Map<String, Object> map) throws Exception{

	    List<Map<String,Object>> list = commonService.selectCommonCode(map);

	    return list;

	}

	@RequestMapping(value="/common/selectCommonRef1Code.do" , method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> selectCommonRef1Code(@RequestBody Map<String, Object> map) throws Exception{

	    List<Map<String,Object>> list = commonService.selectCommonRef1Code(map);

	    return list;

	}

}
