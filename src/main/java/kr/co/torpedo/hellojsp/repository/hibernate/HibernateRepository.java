package kr.co.torpedo.hellojsp.repository.hibernate;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import kr.co.torpedo.hellojsp.domain.Manager;
import kr.co.torpedo.hellojsp.domain.User;

public class HibernateRepository {
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction tx;

	public HibernateRepository() {
		sessionFactory = HibernateConnectionFactory.getSessionFactory();
	}

	public boolean checkManager(String id, String passwd) {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		Manager manager = (Manager) session.get(Manager.class, id);
		tx.commit();
		session.close();
		if (!manager.getId().equals(id) || !manager.getPwd().equals(passwd)) {
			return false;
		}
		return true;
	}
	
	public List<User> selectUserList() {
		session = sessionFactory.openSession();
		session.beginTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<User> criteriaQuery = builder.createQuery(User.class);
		criteriaQuery.from(User.class);
		List<User> list = session.createQuery(criteriaQuery).getResultList();
		session.close();
		
		return list;
	}
}
