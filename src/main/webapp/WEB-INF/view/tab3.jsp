<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>User List</title>

    <style>

        body {
            font-family: Arial, sans-serif;
        }

        .container {
            padding: 15px;
        }

        .search-form {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }

        .search-input,
        .search-select {
            height: 32px;
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        .name-input {
            width: 180px;
        }

        .code-input {
            width: 130px;
        }

        .type-select {
            width: 130px;
        }

        .department-select {
            width: 180px;
        }

        .status-select {
            width: 130px;
        }

        .btn {
            height: 32px;
            padding: 0 15px;
            border: 1px solid #999;
            background: #f5f5f5;
            cursor: pointer;
            border-radius: 3px;
        }

        .btn:hover {
            background: #e5e5e5;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .user-table th {
            text-align: left;
            border-bottom: 1px solid #ddd;
            background: #f5f5f5;
            padding: 8px;
        }

        .user-table td {
            border-bottom: 1px solid #eee;
            padding: 8px;
        }

        .pagination {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 15px;
            padding: 8px;
            border-top: 1px solid #ddd;
            font-size: 12px;
        }

        .page-number {
            border: 1px solid #ccc;
            padding: 5px 12px;
        }

        .total-info {
            margin-left: 20px;
        }

        .message {
            margin-top: 10px;
            color: red;
            font-size: 13px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2 style="margin-bottom: 15px;">
        User List
    </h2>


    <!-- =====================================================
         SEARCH FORM
         ===================================================== -->

    <form id="tab3SearchForm"
          action="${pageContext.request.contextPath}/tab3"
          method="get"
          class="search-form"
          onsubmit="return validateTab3Search();">


        <!-- =====================================================
             SEARCH NAME
             ===================================================== -->

        <input type="text"
               id="tab3Name"
               name="name"
               value="${searchName}"
               placeholder="Search Name"
               class="search-input name-input">


        <!-- =====================================================
             SEARCH CODE
             ===================================================== -->

        <input type="text"
               id="tab3Code"
               name="code"
               value="${searchCode}"
               placeholder="Search Code"
               class="search-input code-input">


        <!-- =====================================================
             USER TYPE
             ===================================================== -->

        <select id="tab3UserType"
                name="userType"
                class="search-select type-select">

            <option value="">
                User Type
            </option>

            <c:forEach var="type"
                       items="${userTypes}">

                <option value="${type}"
                    <c:if test="${type == userType}">
                        selected
                    </c:if>>
                    ${type}
                </option>

            </c:forEach>

        </select>


        <!-- =====================================================
             DEPARTMENT
             ===================================================== -->

        <select id="tab3Department"
                name="department"
                class="search-select department-select">

            <option value="">
                Department
            </option>

            <c:forEach var="dept"
                       items="${departments}">

                <option value="${dept}"
                    <c:if test="${dept == department}">
                        selected
                    </c:if>>
                    ${dept}
                </option>

            </c:forEach>

        </select>


        <!-- =====================================================
             STATUS
             ===================================================== -->

        <select id="tab3Status"
                name="status"
                class="search-select status-select">

            <option value="">
                Status
            </option>

            <c:forEach var="stat"
                       items="${statuses}">

                <option value="${stat}"
                    <c:if test="${stat == status}">
                        selected
                    </c:if>>
                    ${stat}
                </option>

            </c:forEach>

        </select>


        <!-- =====================================================
             SEARCH BUTTON
             ===================================================== -->

        <button type="submit"
                class="btn">

            Search

        </button>


        <!-- =====================================================
             CLEAR BUTTON
             ===================================================== -->

        <button type="button"
                class="btn"
                onclick="clearTab3Search();">

            Clear

        </button>

    </form>


    <!-- =====================================================
         JAVASCRIPT MESSAGE
         ===================================================== -->

    <div id="tab3Message"
         class="message">
    </div>


    <!-- =====================================================
         USER TABLE
         ===================================================== -->

    <table class="user-table">

        <thead>

        <tr>

            <th>Name</th>

            <th>Code</th>

            <th>User Type</th>

            <th>Phone</th>

            <th>Department</th>

            <th>Status</th>

            <th>Joining Date</th>

        </tr>

        </thead>


        <tbody>

        <!-- =================================================
             DISPLAY USERS
             ================================================= -->

        <c:forEach var="user"
                   items="${users}">

            <tr>

                <td>
                    ${user.name}
                </td>

                <td>
                    ${user.code}
                </td>

                <td>
                    ${user.userType}
                </td>

                <td>
                    ${user.phone}
                </td>

                <td>
                    ${user.department}
                </td>

                <td>
                    ${user.status}
                </td>

                <td>
                    ${user.joiningDate}
                </td>

            </tr>

        </c:forEach>


        <!-- =================================================
             NO RECORDS
             ================================================= -->

        <c:if test="${empty users}">

            <tr>

                <td colspan="7"
                    style="text-align: center; padding: 20px;">

                    No records found

                </td>

            </tr>

        </c:if>

        </tbody>

    </table>


    <!-- =====================================================
         PAGINATION
         ===================================================== -->

    <div class="pagination">


        <span>
            PAGE
        </span>


        <!-- =================================================
             PREVIOUS BUTTON
             ================================================= -->

        <c:choose>

            <c:when test="${currentPage > 1}">

                <a href="${pageContext.request.contextPath}/tab3?page=${currentPage - 1}&name=${searchName}&code=${searchCode}&userType=${userType}&department=${department}&status=${status}">

                    <button type="button"
                            class="btn">

                        ◀

                    </button>

                </a>

            </c:when>


            <c:otherwise>

                <button type="button"
                        class="btn"
                        disabled>

                    ◀

                </button>

            </c:otherwise>

        </c:choose>


        <!-- =================================================
             CURRENT PAGE
             ================================================= -->

        <span class="page-number">

            ${currentPage}

        </span>


        <!-- =================================================
             NEXT BUTTON
             ================================================= -->

        <c:choose>

            <c:when test="${currentPage < totalPages}">

                <a href="${pageContext.request.contextPath}/tab3?page=${currentPage + 1}&name=${searchName}&code=${searchCode}&userType=${userType}&department=${department}&status=${status}">

                    <button type="button"
                            class="btn">

                        ▶

                    </button>

                </a>

            </c:when>


            <c:otherwise>

                <button type="button"
                        class="btn"
                        disabled>

                    ▶

                </button>

            </c:otherwise>

        </c:choose>


        <!-- =================================================
             TOTAL PAGES
             ================================================= -->

        <span>

            / ${totalPages} PAGES

        </span>


        <!-- =================================================
             PAGE SIZE
             ================================================= -->

        <span class="total-info">

            PAGE SIZE

        </span>

        <span class="page-number">

            ${pageSize}

        </span>


        <!-- =================================================
             TOTAL RECORDS
             ================================================= -->

        <span class="total-info">

            TOTAL RECORDS

        </span>


        <span class="page-number">

            ${totalRecords}

        </span>


    </div>

</div>


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<script>


    /* ========================================================
       SEARCH VALIDATION
       ========================================================

       This function checks whether the user has entered
       or selected at least ONE search condition.

       We use the FORM itself instead of searching the
       entire document.

       This prevents conflicts with other tabs.
       ======================================================== */

    function validateTab3Search() {

        const form =
            document.getElementById("tab3SearchForm");


        const name =
            form.querySelector('[name="name"]').value.trim();


        const code =
            form.querySelector('[name="code"]').value.trim();


        const userType =
            form.querySelector('[name="userType"]').value;


        const department =
            form.querySelector('[name="department"]').value;


        const status =
            form.querySelector('[name="status"]').value;


        const message =
            document.getElementById("tab3Message");


        /* ====================================================
           CHECK IF ALL SEARCH CONDITIONS ARE EMPTY
           ==================================================== */

        if (
            name === "" &&
            code === "" &&
            userType === "" &&
            department === "" &&
            status === ""
        ) {

            message.innerHTML =
                "Please enter or select at least one search condition.";

            return false;
        }


        /* ====================================================
           CLEAR ERROR MESSAGE
           ==================================================== */

        message.innerHTML = "";


        /* ====================================================
           ALLOW FORM TO SUBMIT
           ==================================================== */

        return true;

    }


    /* ========================================================
       CLEAR SEARCH
       ========================================================

       Clears all Tab 3 search fields and returns to
       /home without search parameters.
       ======================================================== */

    function clearTab3Search() {

        const form =
            document.getElementById("tab3SearchForm");


        /* Clear Name */

        form.querySelector('[name="name"]').value = "";


        /* Clear Code */

        form.querySelector('[name="code"]').value = "";


        /* Clear User Type */

        form.querySelector('[name="userType"]').value = "";


        /* Clear Department */

        form.querySelector('[name="department"]').value = "";


        /* Clear Status */

        form.querySelector('[name="status"]').value = "";


        /* Clear Error Message */

        document.getElementById("tab3Message").innerHTML = "";


        /* Go back to normal User List */

        window.location.href =
            "${pageContext.request.contextPath}/home";

    }


    /* ========================================================
       ENTER KEY
       ========================================================

       When Enter is pressed inside any Tab 3 search field:

       1. Stop the browser's default action.
       2. Run validation.
       3. If validation succeeds, submit the form.

       IMPORTANT:
       We DO NOT directly call this.submit()
       because that would bypass onsubmit validation.
       ======================================================== */

    document
        .getElementById("tab3SearchForm")
        .addEventListener("keypress", function(event) {

            if (event.key === "Enter") {

                event.preventDefault();

                if (validateTab3Search()) {

                    this.submit();

                }

            }

        });


</script>

</body>
</html>