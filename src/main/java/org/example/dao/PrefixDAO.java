package org.example.dao;

import org.example.entity.Prefix;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PrefixDAO {

    @Autowired
    private SessionFactory sessionFactory;


    // =========================================================
    // CREATE PREFIX
    // =========================================================

    public void savePrefix(Prefix prefix) {

        Session session =
                sessionFactory.getCurrentSession();

        session.save(prefix);
    }


    // =========================================================
    // GET ALL PREFIXES
    // =========================================================

    public List<Prefix> getAllPrefixes() {

        Session session =
                sessionFactory.getCurrentSession();

        Query<Prefix> query =
                session.createQuery(
                        "FROM Prefix ORDER BY id",
                        Prefix.class
                );

        return query.getResultList();
    }


    // =========================================================
    // SEARCH PREFIXES
    // =========================================================

    public List<Prefix> searchPrefixes(
            String prefix,
            String gender,
            String prefixOf) {

        Session session =
                sessionFactory.getCurrentSession();


        StringBuilder hql =
                new StringBuilder(
                        "FROM Prefix WHERE 1=1"
                );


        // PREFIX SEARCH

        if (prefix != null &&
                !prefix.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(prefix) LIKE LOWER(:prefix)"
            );
        }


        // GENDER SEARCH

        if (gender != null &&
                !gender.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(gender) = LOWER(:gender)"
            );
        }


        // PREFIX OF SEARCH

        if (prefixOf != null &&
                !prefixOf.trim().isEmpty()) {

            hql.append(
                    " AND LOWER(prefixOf) LIKE LOWER(:prefixOf)"
            );
        }


        hql.append(
                " ORDER BY id"
        );


        Query<Prefix> query =
                session.createQuery(
                        hql.toString(),
                        Prefix.class
                );


        // SET PREFIX PARAMETER

        if (prefix != null &&
                !prefix.trim().isEmpty()) {

            query.setParameter(
                    "prefix",
                    "%" + prefix.trim() + "%"
            );
        }


        // SET GENDER PARAMETER

        if (gender != null &&
                !gender.trim().isEmpty()) {

            query.setParameter(
                    "gender",
                    gender.trim()
            );
        }


        // SET PREFIX OF PARAMETER

        if (prefixOf != null &&
                !prefixOf.trim().isEmpty()) {

            query.setParameter(
                    "prefixOf",
                    "%" + prefixOf.trim() + "%"
            );
        }


        return query.getResultList();
    }


    // =========================================================
    // DELETE PREFIX
    // =========================================================

    public void deletePrefix(int id) {

        Session session =
                sessionFactory.getCurrentSession();


        Prefix prefix =
                session.get(
                        Prefix.class,
                        id
                );


        if (prefix != null) {

            session.delete(prefix);
        }
    }

}