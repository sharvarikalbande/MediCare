package org.example.dao;

import org.example.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MainDao {

    @Autowired
    private SessionFactory sessionFactory;


    // =========================================================
    // GET ALL USERS
    // =========================================================

    public List<User> getAllUsers() {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query =
                session.createQuery(
                        "FROM User ORDER BY id",
                        User.class
                );

        return query.getResultList();
    }


    // =========================================================
    // SEARCH USERS WITH MULTIPLE FILTERS + PAGINATION
    // =========================================================

    public List<User> searchUsers(
            String name,
            String code,
            String userType,
            String department,
            String status,
            int pageNumber,
            int pageSize) {

        Session session = sessionFactory.getCurrentSession();

        StringBuilder hql = new StringBuilder(
                "FROM User WHERE 1=1"
        );


        // =====================================================
        // NAME
        // =====================================================

        if (name != null && !name.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(name) LIKE LOWER(:name)"
            );
        }


        // =====================================================
        // CODE
        // =====================================================

        if (code != null && !code.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(code) LIKE LOWER(:code)"
            );
        }


        // =====================================================
        // USER TYPE
        // =====================================================

        if (userType != null && !userType.trim().isEmpty()) {

            hql.append(
                    " AND userType = :userType"
            );
        }


        // =====================================================
        // DEPARTMENT
        // =====================================================

        if (department != null && !department.trim().isEmpty()) {

            hql.append(
                    " AND department = :department"
            );
        }


        // =====================================================
        // STATUS
        // =====================================================

        if (status != null && !status.trim().isEmpty()) {

            hql.append(
                    " AND status = :status"
            );
        }


        // =====================================================
        // ORDER
        // =====================================================

        hql.append(" ORDER BY id");


        Query<User> query =
                session.createQuery(
                        hql.toString(),
                        User.class
                );


        // =====================================================
        // SET PARAMETERS
        // =====================================================

        if (name != null && !name.trim().isEmpty()) {

            query.setParameter(
                    "name",
                    "%" + name.trim() + "%"
            );
        }


        if (code != null && !code.trim().isEmpty()) {

            query.setParameter(
                    "code",
                    "%" + code.trim() + "%"
            );
        }


        if (userType != null && !userType.trim().isEmpty()) {

            query.setParameter(
                    "userType",
                    userType.trim()
            );
        }


        if (department != null && !department.trim().isEmpty()) {

            query.setParameter(
                    "department",
                    department.trim()
            );
        }


        if (status != null && !status.trim().isEmpty()) {

            query.setParameter(
                    "status",
                    status.trim()
            );
        }


        // =====================================================
        // PAGINATION
        // =====================================================

        int firstResult =
                (pageNumber - 1) * pageSize;

        query.setFirstResult(firstResult);

        query.setMaxResults(pageSize);


        return query.getResultList();
    }


    // =========================================================
    // COUNT USERS WITH MULTIPLE FILTERS
    // =========================================================

    public long countUsers(
            String name,
            String code,
            String userType,
            String department,
            String status) {

        Session session = sessionFactory.getCurrentSession();

        StringBuilder hql = new StringBuilder(
                "SELECT COUNT(u.id) FROM User u WHERE 1=1"
        );


        // =====================================================
        // NAME
        // =====================================================

        if (name != null && !name.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(u.name) LIKE LOWER(:name)"
            );
        }


        // =====================================================
        // CODE
        // =====================================================

        if (code != null && !code.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(u.code) LIKE LOWER(:code)"
            );
        }


        // =====================================================
        // USER TYPE
        // =====================================================

        if (userType != null && !userType.trim().isEmpty()) {

            hql.append(
                    " AND u.userType = :userType"
            );
        }


        // =====================================================
        // DEPARTMENT
        // =====================================================

        if (department != null && !department.trim().isEmpty()) {

            hql.append(
                    " AND u.department = :department"
            );
        }


        // =====================================================
        // STATUS
        // =====================================================

        if (status != null && !status.trim().isEmpty()) {

            hql.append(
                    " AND u.status = :status"
            );
        }


        Query<Long> query =
                session.createQuery(
                        hql.toString(),
                        Long.class
                );


        // =====================================================
        // SET PARAMETERS
        // =====================================================

        if (name != null && !name.trim().isEmpty()) {

            query.setParameter(
                    "name",
                    "%" + name.trim() + "%"
            );
        }


        if (code != null && !code.trim().isEmpty()) {

            query.setParameter(
                    "code",
                    "%" + code.trim() + "%"
            );
        }


        if (userType != null && !userType.trim().isEmpty()) {

            query.setParameter(
                    "userType",
                    userType.trim()
            );
        }


        if (department != null && !department.trim().isEmpty()) {

            query.setParameter(
                    "department",
                    department.trim()
            );
        }


        if (status != null && !status.trim().isEmpty()) {

            query.setParameter(
                    "status",
                    status.trim()
            );
        }


        return query.getSingleResult();
    }


    // =========================================================
    // OLD SEARCH BY NAME
    // =========================================================

    public List<User> searchUsersByName(String name) {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery(
                "FROM User " +
                        "WHERE LOWER(name) LIKE LOWER(:name) " +
                        "ORDER BY id",
                User.class
        );

        query.setParameter(
                "name",
                "%" + name + "%"
        );

        return query.getResultList();
    }


    // =========================================================
    // OLD SEARCH BY CODE
    // =========================================================

    public List<User> searchUsersByCode(String code) {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery(
                "FROM User " +
                        "WHERE LOWER(code) LIKE LOWER(:code) " +
                        "ORDER BY id",
                User.class
        );

        query.setParameter(
                "code",
                "%" + code + "%"
        );

        return query.getResultList();
    }


    // =========================================================
    // OLD FILTER BY USER TYPE
    // =========================================================

    public List<User> filterByUserType(String userType) {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery(
                "FROM User " +
                        "WHERE userType = :userType " +
                        "ORDER BY id",
                User.class
        );

        query.setParameter(
                "userType",
                userType
        );

        return query.getResultList();
    }


    // =========================================================
    // OLD FILTER BY DEPARTMENT
    // =========================================================

    public List<User> filterByDepartment(String department) {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery(
                "FROM User " +
                        "WHERE department = :department " +
                        "ORDER BY id",
                User.class
        );

        query.setParameter(
                "department",
                department
        );

        return query.getResultList();
    }


    // =========================================================
    // OLD FILTER BY STATUS
    // =========================================================

    public List<User> filterByStatus(String status) {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery(
                "FROM User " +
                        "WHERE status = :status " +
                        "ORDER BY id",
                User.class
        );

        query.setParameter(
                "status",
                status
        );

        return query.getResultList();
    }


    // =========================================================
    // GET USERS FOR ONE PAGE
    // =========================================================

    public List<User> getUsersByPage(
            int pageNumber,
            int pageSize) {

        Session session =
                sessionFactory.getCurrentSession();

        Query<User> query =
                session.createQuery(
                        "FROM User ORDER BY id",
                        User.class
                );

        int firstResult =
                (pageNumber - 1) * pageSize;

        query.setFirstResult(firstResult);

        query.setMaxResults(pageSize);

        return query.getResultList();
    }


    // =========================================================
    // GET TOTAL NUMBER OF USERS
    // =========================================================

    public long getTotalUsers() {

        Session session =
                sessionFactory.getCurrentSession();

        Query<Long> query =
                session.createQuery(
                        "SELECT COUNT(u.id) FROM User u",
                        Long.class
                );

        return query.getSingleResult();
    }


    // =========================================================
    // GET USER TYPES
    // =========================================================

    public List<String> getUserTypes() {

        Session session =
                sessionFactory.getCurrentSession();

        Query<String> query =
                session.createQuery(
                        "SELECT DISTINCT userType " +
                                "FROM User " +
                                "WHERE userType IS NOT NULL " +
                                "ORDER BY userType",
                        String.class
                );

        return query.getResultList();
    }


    // =========================================================
    // GET DEPARTMENTS
    // =========================================================

    public List<String> getDepartments() {

        Session session =
                sessionFactory.getCurrentSession();

        Query<String> query =
                session.createQuery(
                        "SELECT DISTINCT department " +
                                "FROM User " +
                                "WHERE department IS NOT NULL " +
                                "ORDER BY department",
                        String.class
                );

        return query.getResultList();
    }


    // =========================================================
    // GET STATUSES
    // =========================================================

    public List<String> getStatuses() {

        Session session =
                sessionFactory.getCurrentSession();

        Query<String> query =
                session.createQuery(
                        "SELECT DISTINCT status " +
                                "FROM User " +
                                "WHERE status IS NOT NULL " +
                                "ORDER BY status",
                        String.class
                );

        return query.getResultList();
    }
}