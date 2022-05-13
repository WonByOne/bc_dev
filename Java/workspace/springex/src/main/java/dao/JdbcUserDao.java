package dao;

import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcUserDao implements UserDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public void addUser(User user) {
		String sql = "insert into dbtest values(?, ?, ?, ?, sysdate)";
		jdbcTemplate.update(sql, user.getId(), user.getPasswd(), user.getName(), user.getTel());
	}
	public void delUser(String id) {
		String sql = "delete from dbtest where id=?";
		jdbcTemplate.update(sql, id);
	}
}
