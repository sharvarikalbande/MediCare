package org.example.service;

import org.example.dao.MainDao;
import org.example.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MainService {

    @Autowired
    private MainDao mainDao;


    // =========================================================
    // GET ALL USERS
    // =========================================================

    public List<User> getAllUsers() {

        return mainDao.getAllUsers();
    }


    // =========================================================
    // SEARCH USERS WITH ALL FILTERS + PAGINATION
    // =========================================================

    public List<User> searchUsers(
            String name,
            String code,
            String userType,
            String department,
            String status,
            int pageNumber,
            int pageSize) {

        return mainDao.searchUsers(
                name,
                code,
                userType,
                department,
                status,
                pageNumber,
                pageSize
        );
    }


    // =========================================================
    // COUNT FILTERED USERS
    // =========================================================

    public long countUsers(
            String name,
            String code,
            String userType,
            String department,
            String status) {

        return mainDao.countUsers(
                name,
                code,
                userType,
                department,
                status
        );
    }


    // =========================================================
    // OLD METHODS
    // =========================================================

    public List<User> searchUsersByName(String name) {

        return mainDao.searchUsersByName(name);
    }


    public List<User> searchUsersByCode(String code) {

        return mainDao.searchUsersByCode(code);
    }


    public List<User> filterByUserType(String userType) {

        return mainDao.filterByUserType(userType);
    }


    public List<User> filterByDepartment(String department) {

        return mainDao.filterByDepartment(department);
    }


    public List<User> filterByStatus(String status) {

        return mainDao.filterByStatus(status);
    }


    // =========================================================
    // GET USERS FOR ONE PAGE
    // =========================================================

    public List<User> getUsersByPage(
            int pageNumber,
            int pageSize) {

        return mainDao.getUsersByPage(
                pageNumber,
                pageSize
        );
    }


    // =========================================================
    // GET TOTAL USERS
    // =========================================================

    public long getTotalUsers() {

        return mainDao.getTotalUsers();
    }


    // =========================================================
    // GET USER TYPES
    // =========================================================

    public List<String> getUserTypes() {

        return mainDao.getUserTypes();
    }


    // =========================================================
    // GET DEPARTMENTS
    // =========================================================

    public List<String> getDepartments() {

        return mainDao.getDepartments();
    }


    // =========================================================
    // GET STATUSES
    // =========================================================

    public List<String> getStatuses() {

        return mainDao.getStatuses();
    }

}