/*
 * Copyright 2008-2009 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package bean.common.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class HTMLTagFilter implements Filter{

	private FilterConfig config;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

//		if (excludeUrl((HttpServletRequest)request)) {
//			chain.doFilter(request, response);
//		}
//		else{
			chain.doFilter(new HTMLTagFilterRequestWrapper((HttpServletRequest)request), response);
//		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.setConfig(config);
	}

	@Override
	public void destroy() {

	}

//	private boolean excludeUrl(final HttpServletRequest request) {
//		final String url = request.getServerName().trim();
//		final String xssExclude = "gcms.";
//
//		final String[] xssExclues = org.springframework.util.StringUtils.tokenizeToStringArray(xssExclude, ",; \t\n");
//		for (final String exclude : xssExclues) {
//			if(url.startsWith(exclude)){
//				return true;
//			}
//		}
//		return false;
//	}

	public FilterConfig getConfig() {
		return config;
	}

	public void setConfig(FilterConfig config) {
		this.config = config;
	}

}
