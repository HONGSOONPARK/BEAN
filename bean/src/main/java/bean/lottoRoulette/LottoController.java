package bean.lottoRoulette;

import java.util.Arrays;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LottoController {

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/lotto_view.do")
	public String Lotto(Locale locale, Model model, HttpServletRequest request) {

		int cnt = 0;
		if(request.getParameter("countNum") == null){
			cnt = 0;
		}else{
			cnt = Integer.parseInt(request.getParameter("countNum"));
		}


		int[][] result = new int[cnt][6];
		int[] lottoNumber = new int[6];

		Random rd = new Random();

		for(int v = 0; v < cnt; v++){
			for(int i = 0; i < lottoNumber.length; i++){
				lottoNumber[i] =rd.nextInt(45)+1;
				for(int j = 0; j < i; j++){
					if(lottoNumber[j] == lottoNumber[i]){
						i--;
						break;
					}
				}
			}

			Arrays.sort(lottoNumber);

			for(int b = 0; b < lottoNumber.length; b++){
				result[v][b] = lottoNumber[b];
			}
		}
		model.addAttribute("result", result );


		return "/lottoRoulette/lotto_view";
	}
}
