package bean.common.common;
import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;



public class PagingRender extends AbstractPaginationRenderer implements ServletContextAware{

	@SuppressWarnings("unused")
	private ServletContext servletContext;

	public PagingRender() {

	}

	public void initVariables(){
		firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">[처음으로]</a>&#160;";
        previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">[&lt;]</a>&#160;";
        currentPageLabel  = "<strong>{0}</strong> ";
        otherPageLabel    = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a> ";
        nextPageLabel     = "<a href=\"#\" onclick=\"{0}({1}); return false;\">[&gt;]</a>";
        lastPageLabel     = "<a href=\"#\" onclick=\"{0}({1}); return false;\">[마지막으로]</a>";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}