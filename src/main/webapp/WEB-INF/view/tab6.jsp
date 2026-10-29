<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Tab 6 - Entry</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 100%;
        }

        h2 {
            margin-bottom: 20px;
        }

        .search-section {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            width: 100%;
            box-sizing: border-box;
        }

        .search-section input,
        .search-section select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
            flex: 1 1 0;
            min-width: 0;
            box-sizing: border-box;
        }

        .add-button {
            background-color: #1677c8;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 22px;
            border-radius: 3px;
            cursor: pointer;
            flex: 0 0 auto;
        }

        .add-button:hover {
            background-color: #125fa0;
        }



        .search-button {
            background-color: #1677c8;
            color: white;
            border: none;
            padding: 9px 18px;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
            flex: 0 0 auto;
        }

        .search-button:hover {
            background-color: #125fa0;
        }

        .add-button:hover {
            background-color: #125fa0;
        }

        .create-section {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            display: none;
            background-color: #fafafa;
        }

        .create-section h3 {
            margin-top: 0;
            margin-bottom: 15px;
        }

        .form-row {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-row label {
            font-weight: bold;
        }

        .form-row input,
        .form-row select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .create-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 9px 18px;
            border-radius: 3px;
            cursor: pointer;
        }

        .create-button:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #f2f2f2;
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 3px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .no-record {
            text-align: center;
            color: #777;
        }

    </style>

</head>


<body>

<div class="container">

    <h2>Tab 6 - Entry</h2>


    <!-- =========================
         SEARCH SECTION
         ========================= -->

<div class="search-section">

    <input
            type="text"
            id="tab6SearchPrefix"
            placeholder="Search Prefix">


    <select
            id="tab6SearchGender">

        <option value="">
            Gender
        </option>

        <option value="Male">
            Male
        </option>

        <option value="Female">
            Female
        </option>

        <option value="Other">
            Other
        </option>

    </select>


    <input
            type="text"
            id="tab6SearchPrefixOf"
            placeholder="Search Prefix Of">


    <!-- SEARCH BUTTON -->

    <button
            type="button"
            class="search-button"
            onclick="filterPrefixes()">

        Search

    </button>


    <!-- ADD BUTTON -->

    <button
            type="button"
            class="add-button"
            onclick="showCreateSection()">

        +

    </button>

</div>


    <!-- =========================
         CREATE SECTION
         ========================= -->

    <div
            id="tab6CreateSection"
            class="create-section">

        <h3>
            Create Entry
        </h3>

        <form
                method="post"
                action="${pageContext.request.contextPath}/tab6/create">

            <div class="form-row">

                <label>
                    Prefix:
                </label>

                <input
                        type="text"
                        name="prefix"
                        id="tab6Prefix"
                        placeholder="Enter Prefix"
                        required>


                <label>
                    Gender:
                </label>

                <select
                        name="gender"
                        id="tab6Gender"
                        required>

                    <option value="">
                        Select Gender
                    </option>

                    <option value="Male">
                        Male
                    </option>

                    <option value="Female">
                        Female
                    </option>

                    <option value="Other">
                        Other
                    </option>

                </select>


                <label>
                    Prefix Of:
                </label>

                <input
                        type="text"
                        name="prefixOf"
                        id="tab6PrefixOf"
                        placeholder="Enter Prefix Of"
                        required>


                <button
                        type="submit"
                        class="create-button">

                    Create

                </button>

            </div>

        </form>

    </div>


    <!-- =========================
         TABLE
         ========================= -->

    <table>

        <thead>

        <tr>

            <th>
                Prefix
            </th>

            <th>
                Gender
            </th>

            <th>
                Prefix Of
            </th>

            <th>
                Action
            </th>

        </tr>

        </thead>


        <tbody id="tab6PrefixTableBody">

        <%
            java.util.List prefixes =
                    (java.util.List) request.getAttribute("prefixes");

            if (prefixes != null && !prefixes.isEmpty()) {

                for (Object obj : prefixes) {

                    org.example.entity.Prefix item =
                            (org.example.entity.Prefix) obj;
        %>

        <tr>

            <td>
                <%= item.getPrefix() != null
                        ? item.getPrefix()
                        : "" %>
            </td>

            <td>
                <%= item.getGender() != null
                        ? item.getGender()
                        : "" %>
            </td>

            <td>
                <%= item.getPrefixOf() != null
                        ? item.getPrefixOf()
                        : "" %>
            </td>

            <td>

                <form
                        method="post"
                        action="${pageContext.request.contextPath}/tab6/delete"
                        style="display:inline;">

                    <input
                            type="hidden"
                            name="id"
                            value="<%= item.getId() %>">

                    <button
                            type="submit"
                            class="delete-button"
                            onclick="return confirm('Are you sure you want to delete this record?');">

                        Delete

                    </button>

                </form>

            </td>

        </tr>

        <%
                }

            } else {
        %>

        <tr>

            <td
                    colspan="4"
                    class="no-record">

                No records found

            </td>

        </tr>

        <%
            }
        %>

        </tbody>

    </table>

</div>


<script>

    /*
     * Store database records in JavaScript
     * for searching.
     */

    var prefixData = [

        <%
            if (prefixes != null) {

                for (int i = 0; i < prefixes.size(); i++) {

                    org.example.entity.Prefix item =
                            (org.example.entity.Prefix) prefixes.get(i);
        %>

        {
            id: <%= item.getId() %>,
            prefix: "<%= item.getPrefix() != null
                    ? item.getPrefix().replace("\\", "\\\\").replace("\"", "\\\"")
                    : "" %>",
            gender: "<%= item.getGender() != null
                    ? item.getGender().replace("\\", "\\\\").replace("\"", "\\\"")
                    : "" %>",
            prefixOf: "<%= item.getPrefixOf() != null
                    ? item.getPrefixOf().replace("\\", "\\\\").replace("\"", "\\\"")
                    : "" %>"
        }

        <%= (i < prefixes.size() - 1) ? "," : "" %>

        <%
                }
            }
        %>

    ];


    /*
     * SHOW / HIDE CREATE SECTION
     */

    function showCreateSection() {

        var section =
                document.getElementById(
                        "tab6CreateSection"
                );

        if (
                section.style.display === "none"
                ||
                section.style.display === ""
        ) {

            section.style.display = "block";

        } else {

            section.style.display = "none";

        }

    }


    /*
     * DISPLAY FILTERED DATA
     */

    function displayPrefixes(data) {

        var tableBody =
                document.getElementById(
                        "tab6PrefixTableBody"
                );

        tableBody.innerHTML = "";


        if (!data || data.length === 0) {

            tableBody.innerHTML =
                    "<tr>" +
                    "<td colspan='4' class='no-record'>" +
                    "No records found" +
                    "</td>" +
                    "</tr>";

            return;

        }


        for (
                var i = 0;
                i < data.length;
                i++
        ) {

            var item = data[i];

            var row =
                    document.createElement("tr");


            row.innerHTML =

                    "<td>" +
                    (item.prefix || "") +
                    "</td>" +

                    "<td>" +
                    (item.gender || "") +
                    "</td>" +

                    "<td>" +
                    (item.prefixOf || "") +
                    "</td>" +

                    "<td>" +

                    "<form method='post' " +
                    "action='${pageContext.request.contextPath}/tab6/delete' " +
                    "style='display:inline;'>" +

                    "<input type='hidden' " +
                    "name='id' " +
                    "value='" +
                    item.id +
                    "'>" +

                    "<button type='submit' " +
                    "class='delete-button' " +
                    "onclick=\"return confirm('Are you sure you want to delete this record?');\">" +

                    "Delete" +

                    "</button>" +

                    "</form>" +

                    "</td>";


            tableBody.appendChild(row);

        }

    }


    /*
     * SEARCH / FILTER
     */

    function filterPrefixes() {

        var searchPrefix =
                document.getElementById(
                        "tab6SearchPrefix"
                )
                .value
                .trim()
                .toLowerCase();


        var searchGender =
                document.getElementById(
                        "tab6SearchGender"
                )
                .value
                .trim()
                .toLowerCase();


        var searchPrefixOf =
                document.getElementById(
                        "tab6SearchPrefixOf"
                )
                .value
                .trim()
                .toLowerCase();


        var filteredPrefixes =
                prefixData.filter(
                        function(item) {

                            var prefix =
                                    String(
                                            item.prefix || ""
                                    )
                                    .toLowerCase();

                            var gender =
                                    String(
                                            item.gender || ""
                                    )
                                    .toLowerCase();

                            var prefixOf =
                                    String(
                                            item.prefixOf || ""
                                    )
                                    .toLowerCase();


                            return (

                                    prefix.indexOf(
                                            searchPrefix
                                    ) !== -1

                                    &&

                                    gender.indexOf(
                                            searchGender
                                    ) !== -1

                                    &&

                                    prefixOf.indexOf(
                                            searchPrefixOf
                                    ) !== -1

                            );

                        }
                );


        displayPrefixes(
                filteredPrefixes
        );

    }

</script>


</body>

</html>