package bean.common.common;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commonService")
public class CommonServiceImple implements CommonService{

    @Resource(name="commonDAO")

    private CommonDAO commonDAO;

    @Override
    public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
        return commonDAO.selectFileInfo(map);
    }

    @Override
    public List<Map<String, Object>> selectCommonCode(Map<String, Object> map) throws Exception {
        return commonDAO.selectCommonCode(map);
    }

    @Override
    public List<Map<String, Object>> selectCommonRef1Code(Map<String, Object> map) throws Exception {
        return commonDAO.selectCommonRef1Code(map);
    }


    @Override
    public int selectSeq(String code) throws Exception {
        return commonDAO.selectSeq(code);
    }

    @Override
    public void updateSeq(String code) throws Exception {
        commonDAO.updateSeq(code);

    }

}
