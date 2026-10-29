package org.example.service;

import org.example.dao.PrefixDAO;
import org.example.entity.Prefix;
import org.example.util.SpringContextHolder;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

public class PrefixDwrService {

    private PrefixDAO getPrefixDAO() {

        return SpringContextHolder.getBean(
                PrefixDAO.class
        );
    }

    private TransactionTemplate getTransactionTemplate() {

        PlatformTransactionManager transactionManager =
                SpringContextHolder.getBean(
                        PlatformTransactionManager.class
                );

        return new TransactionTemplate(
                transactionManager
        );
    }


    public void createPrefix(
            String prefix,
            String gender,
            String prefixOf
    ) {

        getTransactionTemplate().execute(status -> {

            Prefix newPrefix = new Prefix();

            newPrefix.setPrefix(prefix);
            newPrefix.setGender(gender);
            newPrefix.setPrefixOf(prefixOf);

            getPrefixDAO().savePrefix(newPrefix);

            return null;
        });
    }


    public List<Prefix> getAllPrefixes() {

        return getTransactionTemplate().execute(
                status ->
                        getPrefixDAO().getAllPrefixes()
        );
    }


    public List<Prefix> searchPrefixes(
            String prefix,
            String gender,
            String prefixOf
    ) {

        return getTransactionTemplate().execute(
                status ->
                        getPrefixDAO().searchPrefixes(
                                prefix,
                                gender,
                                prefixOf
                        )
        );
    }


    public void deletePrefix(int id) {

        getTransactionTemplate().execute(status -> {

            getPrefixDAO().deletePrefix(id);

            return null;
        });
    }
}