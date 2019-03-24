package bean.login;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import bean.menu.MenuVO;



public class CustomUserDetail implements UserDetails {

	private static final long serialVersionUID = -5634620436147793548L;

	private Integer member_no;
	private String member_id;
	private String member_pwd;
	private String member_role;
	private String member_role_name;
	private String member_nick;
	private String member_name;
	private String member_type;

	private String del_yn;
	private List<MenuVO> menuvo;
	private List<MenuVO> menuparentsvo;

	private String msg;
	private Integer code;
	private String id;

	private JSONObject properties;

	private String profile_image;
	private String thumbnail_image;
	private String nickname;


	public String getMember_role_name() {
		return member_role_name;
	}
	public void setMember_role_name(String member_role_name) {
		this.member_role_name = member_role_name;
	}

	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getThumbnail_image() {
		return thumbnail_image;
	}

	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
          // TODO Auto-generated method stub
          List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
          authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
          return authorities;
    }

    public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public List<MenuVO> getMenuvo() {
		return menuvo;
	}

	public void setMenuvo(List<MenuVO> menuvo) {
		this.menuvo = menuvo;
	}

	public List<MenuVO> getMenuparentsvo() {
		return menuparentsvo;
	}

	public void setMenuparentsvo(List<MenuVO> menuparentsvo) {
		this.menuparentsvo = menuparentsvo;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public JSONObject getProperties() {
		return properties;
	}

	public void setProperties(JSONObject properties) {
		this.properties = properties;
	}

	@Override
    public String getPassword() {
          // TODO Auto-generated method stub
          return getMember_pwd();
    }
    @Override
    public String getUsername() {
          // TODO Auto-generated method stub
          return getMember_id();
    }
    @Override
    public boolean isAccountNonExpired() {
          // TODO Auto-generated method stub
          return true;
    }
    @Override
    public boolean isAccountNonLocked() {
          // TODO Auto-generated method stub
          return true;
    }
    @Override
    public boolean isCredentialsNonExpired() {
          // TODO Auto-generated method stub
          return true;
    }
    @Override
    public boolean isEnabled() {
          // TODO Auto-generated method stub
          return true;
    }


}
