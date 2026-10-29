<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="tab4-container">

    <!-- =========================================================
         TITLE
         ========================================================= -->

    <h2 class="tab4-title">
        Tab 4 - Prefix Management
    </h2>

    <div class="tab4-subtitle">
        Create, search and manage Prefix records.
    </div>


    <!-- =========================================================
         CREATE PREFIX
         ========================================================= -->

    <div class="section-box">

        <div class="section-title">
            Prefix Entry
        </div>

        <div class="section-description">
            Enter the details below to create a new Prefix record.
        </div>

        <div class="form-row">

            <!-- PREFIX -->

            <div class="form-group">



                <label>
                    Prefix
                </label>

                <input
                        type="text"
                        id="tab4CreatePrefix"
                        placeholder="Enter Prefix">

            </div>


            <!-- GENDER -->

            <div class="form-group">

                <label>
                    Gender
                </label>

                <select id="tab4CreateGender">

                    <option value="">
                        -- Select Gender --
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

            </div>


            <!-- PREFIX OF -->

            <div class="form-group">

                <label>
                    Prefix Of
                </label>

                <input
                        type="text"
                        id="tab4CreatePrefixOf"
                        placeholder="Enter Prefix Of">

            </div>


            <!-- SAVE -->

            <button
                    type="button"
                    class="button save-button"
                    onclick="tab4CreatePrefix()">

                Save

            </button>


            <!-- CLEAR -->

            <button
                    type="button"
                    class="button clear-button"
                    onclick="tab4ClearCreateForm()">

                Clear

            </button>

        </div>

    </div>


    <!-- =========================================================
         SEARCH PREFIX
         ========================================================= -->

    <div class="section-box">

        <div class="section-title">
            Search Prefix
        </div>

        <div class="section-description">
            Search Prefix records using the available fields.
        </div>

        <div class="search-row">

            <!-- PREFIX -->

            <div class="search-group">

                <label>
                    Prefix
                </label>

                <input
                        type="text"
                        id="tab4SearchPrefix"
                        placeholder="Search Prefix">

            </div>


            <!-- GENDER -->

            <div class="search-group">

                <label>
                    Gender
                </label>

                <select id="tab4SearchGender">

                    <option value="">
                        All Gender
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

            </div>


            <!-- PREFIX OF -->

            <div class="search-group">

                <label>
                    Prefix Of
                </label>

                <input
                        type="text"
                        id="tab4SearchPrefixOf"
                        placeholder="Search Prefix Of">

            </div>


            <!-- SEARCH -->

            <button
                    type="button"
                    class="button search-button"
                    onclick="tab4Search()">

                Search

            </button>


            <!-- CLEAR -->

            <button
                    type="button"
                    class="button clear-button"
                    onclick="tab4ClearSearch()">

                Clear

            </button>


            <!-- SHOW ALL -->

            <button
                    type="button"
                    class="button show-all-button"
                    onclick="tab4LoadPrefixes()">

                Show All

            </button>

        </div>

    </div>


    <!-- =========================================================
         PREFIX LIST HEADER
         ========================================================= -->

    <div class="list-header">

        <div class="list-title">
            Prefix List
        </div>

        <div
                class="record-count"
                id="tab4RecordCount">

            Records: 0

        </div>

    </div>


    <!-- =========================================================
         PREFIX TABLE
         ========================================================= -->

    <div class="table-container">

        <table class="prefix-table">

            <thead>

            <tr>

                <th class="id-column">
                    ID
                </th>

                <th class="prefix-column">
                    Prefix
                </th>

                <th class="gender-column">
                    Gender
                </th>

                <th class="prefix-of-column">
                    Prefix Of
                </th>

                <th class="action-column">
                    Action
                </th>

            </tr>

            </thead>


            <tbody id="tab4PrefixTableBody">

            </tbody>

        </table>

    </div>


    <!-- =========================================================
         MESSAGE
         ========================================================= -->

    <div
            id="tab4Message"
            class="message">

    </div>

</div>



<style>

/* =========================================================
   CONTAINER
   ========================================================= */

.tab4-container {

    margin: 20px 30px;

    max-width: 1200px;

    font-family:
            Arial,
            Helvetica,
            sans-serif;

}


/* =========================================================
   TITLE
   ========================================================= */

.tab4-title {

    font-size: 20px;

    color: #263238;

    margin:
            0 0 3px 0;

}


.tab4-subtitle {

    font-size: 12px;

    color: #777;

    margin-bottom: 14px;

}


/* =========================================================
   SECTION
   ========================================================= */

.section-box {

    background-color: white;

    border:
            1px solid #d5d9dd;

    border-radius: 5px;

    padding: 14px;

    margin-bottom: 12px;

    box-shadow:
            0 1px 3px
            rgba(0,0,0,0.06);

}


.section-title {

    font-size: 16px;

    font-weight: bold;

    color: #34495e;

    margin-bottom: 3px;

}


.section-description {

    font-size: 11px;

    color: #888;

    margin-bottom: 12px;

}


/* =========================================================
   CREATE FORM
   ========================================================= */

.form-row {

    display: flex;

    align-items: flex-end;

    gap: 8px;

}


.form-group {

    display: flex;

    flex-direction: column;

    flex: 1;

}


.form-group label {

    font-size: 11px;

    font-weight: bold;

    color: #555;

    margin-bottom: 4px;

}


.form-group input,
.form-group select {

    height: 32px;

    border:
            1px solid #c9ced3;

    border-radius: 3px;

    padding:
            5px 8px;

    font-size: 12px;

    outline: none;

    background-color: white;

}


.form-group input:focus,
.form-group select:focus {

    border-color: #1677c8;

}


/* =========================================================
   SEARCH
   ========================================================= */

.search-row {

    display: flex;

    align-items: flex-end;

    gap: 8px;

}


.search-group {

    display: flex;

    flex-direction: column;

    flex: 1;

}


.search-group label {

    font-size: 11px;

    font-weight: bold;

    color: #555;

    margin-bottom: 4px;

}


.search-group input,
.search-group select {

    height: 32px;

    border:
            1px solid #c9ced3;

    border-radius: 3px;

    padding:
            5px 8px;

    font-size: 12px;

    outline: none;

    background-color: white;

}


/* =========================================================
   BUTTONS
   ========================================================= */

.button {

    height: 32px;

    padding:
            0 14px;

    border: none;

    border-radius: 3px;

    cursor: pointer;

    font-size: 12px;

    white-space: nowrap;

}


.save-button,
.search-button {

    background-color: #1677c8;

    color: white;

}


.save-button:hover,
.search-button:hover {

    background-color: #125fa0;

}


.clear-button,
.show-all-button {

    background-color: #f4f4f4;

    color: #333;

    border:
            1px solid #ccc;

}


.clear-button:hover,
.show-all-button:hover {

    background-color: #e5e5e5;

}


/* =========================================================
   LIST HEADER
   ========================================================= */

.list-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin:
            15px 2px 6px 2px;

}


.list-title {

    font-size: 17px;

    font-weight: bold;

    color: #34495e;

}


.record-count {

    font-size: 11px;

    color: #777;

}


/* =========================================================
   TABLE CONTAINER
   ========================================================= */

.table-container {

    width: 100%;

    max-height: 350px;

    overflow-y: auto;

    background-color: white;

    border:
            1px solid #d2d6da;

    border-radius: 4px;

}


/* =========================================================
   TABLE
   ========================================================= */

.prefix-table {

    width: 100%;

    border-collapse: collapse;

    table-layout: fixed;

}


.prefix-table thead {

    position: sticky;

    top: 0;

    z-index: 2;

}


.prefix-table th {

    background-color: #34495e;

    color: white;

    padding: 8px;

    text-align: left;

    font-size: 12px;

    font-weight: normal;

    border-right:
            1px solid #526575;

}


.prefix-table td {

    background-color: white;

    border-bottom:
            1px solid #e5e5e5;

    padding:
            7px 8px;

    font-size: 12px;

    color: #444;

}


.prefix-table tbody tr:hover td {

    background-color: #f7f9fb;

}


/* =========================================================
   COLUMNS
   ========================================================= */

.id-column {

    width: 9%;

}


.prefix-column {

    width: 22%;

}


.gender-column {

    width: 20%;

}


.prefix-of-column {

    width: 34%;

}


.action-column {

    width: 15%;

    text-align: center !important;

}


/* =========================================================
   DELETE BUTTON
   ========================================================= */

.delete-button {

    background-color: #e05252;

    color: white;

    border: none;

    padding:
            5px 11px;

    font-size: 11px;

    border-radius: 3px;

    cursor: pointer;

}


.delete-button:hover {

    background-color: #c83f3f;

}


/* =========================================================
   MESSAGE
   ========================================================= */

.message {

    margin-top: 8px;

    font-size: 12px;

}


.success-message {

    color: #1677c8;

}


.error-message {

    color: red;

}


/* =========================================================
   RESPONSIVE
   ========================================================= */

@media (max-width: 850px) {

    .tab4-container {

        margin: 15px;

    }


    .form-row,
    .search-row {

        flex-direction: column;

        align-items: stretch;

    }


    .button {

        width: 100%;

    }

}

</style>



<!-- =========================================================
     DWR ENGINE
     ========================================================= -->

<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/dwr/engine.js">
</script>


<!-- =========================================================
     DWR UTIL
     ========================================================= -->

<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/dwr/util.js">
</script>


<!-- =========================================================
     PREFIX DWR SERVICE
     ========================================================= -->

<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/dwr/interface/PrefixDwrService.js">
</script>



<script>

/* =========================================================
   PREFIX DATA
   ========================================================= */

var tab4PrefixData = [];

/* =========================================================
   DWR ERROR HANDLER
   ========================================================= */

if (typeof dwr !== "undefined" &&
    typeof dwr.engine !== "undefined") {

    dwr.engine.setErrorHandler(
        function(errorString, exception) {

            console.error(
                "TAB 4 DWR ERROR:"
            );

            console.error(
                errorString
            );

            console.error(
                exception
            );


            var messageBox =
                document.getElementById(
                    "tab4Message"
                );


            if (messageBox) {

                messageBox.className =
                    "message error-message";


                messageBox.innerHTML =
                    "Error loading Prefix records. Check browser console.";

            }

        }
    );

}



/* =========================================================
   MESSAGE
   ========================================================= */

function tab4Message(message, isError) {

    var box =
        document.getElementById(
            "tab4Message"
        );


    if (!box) {

        console.error(
            "tab4Message element not found."
        );

        return;

    }


    box.innerHTML =
        message;


    if (isError) {

        box.className =
            "message error-message";

    } else {

        box.className =
            "message success-message";

    }

}
/* =========================================================
   LOAD ALL PREFIXES
   ========================================================= */

function tab4LoadPrefixes() {

    console.log(
        "TAB 4: Loading prefixes..."
    );


    /* =====================================================
       CHECK DWR SERVICE
       ===================================================== */

    if (typeof PrefixDwrService === "undefined") {

        console.error(
            "TAB 4 ERROR: PrefixDwrService is undefined."
        );


        tab4Message(
            "DWR Prefix service is not available.",
            true
        );


        return;

    }


    console.log(
        "TAB 4: PrefixDwrService is available."
    );



    /* =====================================================
       CALL DWR
       ===================================================== */

    PrefixDwrService.getAllPrefixes(

        function(data) {

            console.log(
                "TAB 4: Prefix data received:",
                data
            );


            /* =============================================
               STORE DATA
               ============================================= */

            tab4PrefixData =
                data || [];


            console.log(
                "TAB 4: Number of records:",
                tab4PrefixData.length
            );


            /* =============================================
               DISPLAY DATA
               ============================================= */

            tab4DisplayPrefixes(
                tab4PrefixData
            );


        }

    );

}



/* =========================================================
   DISPLAY PREFIXES
   ========================================================= */

function tab4DisplayPrefixes(data) {

    console.log(
        "TAB 4: Displaying prefixes:",
        data
    );


    var tableBody =
        document.getElementById(
            "tab4PrefixTableBody"
        );


    var count =
        document.getElementById(
            "tab4RecordCount"
        );


    if (!tableBody) {

        console.error(
            "TAB 4 ERROR: Table body not found."
        );

        return;

    }


    if (!count) {

        console.error(
            "TAB 4 ERROR: Record count element not found."
        );

        return;

    }


    /* =====================================================
       CLEAR OLD TABLE
       ===================================================== */

    tableBody.innerHTML =
        "";


    /* =====================================================
       NORMALIZE DATA
       ===================================================== */

    data =
        data || [];


    /* =====================================================
       RECORD COUNT
       ===================================================== */

    count.innerHTML =
        "Records: " +
        data.length;



    /* =====================================================
       NO RECORDS
       ===================================================== */

    if (data.length === 0) {

        var row =
            tableBody.insertRow();


        var cell =
            row.insertCell(0);


        cell.colSpan =
            5;


        cell.style.textAlign =
            "center";


        cell.style.color =
            "#888";


        cell.innerHTML =
            "No Prefix records found.";


        return;

    }



    /* =====================================================
       DISPLAY EACH RECORD
       ===================================================== */

    for (
        var i = 0;
        i < data.length;
        i++
    ) {

        var item =
            data[i];


        var row =
            tableBody.insertRow();



        /* =================================================
           ID
           ================================================= */

        row.insertCell(0).innerHTML =
            item.id == null
                ? ""
                : item.id;



        /* =================================================
           PREFIX
           ================================================= */

        row.insertCell(1).innerHTML =
            escapeHtml(
                item.prefix || ""
            );



        /* =================================================
           GENDER
           ================================================= */

        row.insertCell(2).innerHTML =
            escapeHtml(
                item.gender || ""
            );



        /* =================================================
           PREFIX OF
           ================================================= */

        row.insertCell(3).innerHTML =
            escapeHtml(
                item.prefixOf || ""
            );



        /* =================================================
           ACTION
           ================================================= */

        var actionCell =
            row.insertCell(4);


        actionCell.style.textAlign =
            "center";



        /* =================================================
           DELETE BUTTON
           ================================================= */

        var deleteButton =
            document.createElement(
                "button"
            );


        deleteButton.type =
            "button";


        deleteButton.className =
            "delete-button";


        deleteButton.innerHTML =
            "Delete";


        deleteButton.onclick =
            (function(id) {

                return function() {

                    tab4DeletePrefix(
                        id
                    );

                };

            })(item.id);


        actionCell.appendChild(
            deleteButton
        );

    }

}



/* =========================================================
   ESCAPE HTML
   ========================================================= */

function escapeHtml(value) {

    var div =
        document.createElement(
            "div"
        );


    div.textContent =
        value;


    return div.innerHTML;

}



/* =========================================================
   CREATE PREFIX
   ========================================================= */

function tab4CreatePrefix() {

    var prefix =
        document.getElementById(
            "tab4CreatePrefix"
        ).value.trim();


    var gender =
        document.getElementById(
            "tab4CreateGender"
        ).value;


    var prefixOf =
        document.getElementById(
            "tab4CreatePrefixOf"
        ).value.trim();



    /* =====================================================
       VALIDATION
       ===================================================== */

    if (prefix === "") {

        alert(
            "Please enter Prefix"
        );

        return;

    }



    /* =====================================================
       CHECK DWR
       ===================================================== */

    if (typeof PrefixDwrService === "undefined") {

        tab4Message(
            "DWR Prefix service is not available.",
            true
        );

        return;

    }



    /* =====================================================
       CREATE PREFIX
       ===================================================== */

    PrefixDwrService.createPrefix(

        prefix,

        gender,

        prefixOf,

        function() {

            console.log(
                "Prefix created successfully."
            );


            tab4Message(
                "Prefix created successfully.",
                false
            );


            tab4ClearCreateForm();


            /* =============================================
               RELOAD TABLE
               ============================================= */

            tab4LoadPrefixes();

        }

    );

}



/* =========================================================
   DELETE PREFIX
   ========================================================= */

function tab4DeletePrefix(id) {

    if (
        !confirm(
            "Are you sure you want to delete this Prefix?"
        )
    ) {

        return;

    }



    /* =====================================================
       DELETE
       ===================================================== */

    PrefixDwrService.deletePrefix(

        id,

        function() {

            console.log(
                "Prefix deleted successfully."
            );


            tab4Message(
                "Prefix deleted successfully.",
                false
            );


            /* =============================================
               RELOAD TABLE
               ============================================= */

            tab4LoadPrefixes();

        }

    );

}



/* =========================================================
   SEARCH PREFIX
   ========================================================= */

function tab4Search() {

    var prefix =
        document.getElementById(
            "tab4SearchPrefix"
        ).value.trim();


    var gender =
        document.getElementById(
            "tab4SearchGender"
        ).value;


    var prefixOf =
        document.getElementById(
            "tab4SearchPrefixOf"
        ).value.trim();



    /* =====================================================
       CHECK DWR
       ===================================================== */

    if (typeof PrefixDwrService === "undefined") {

        tab4Message(
            "DWR Prefix service is not available.",
            true
        );

        return;

    }



    /* =====================================================
       SEARCH
       ===================================================== */

    PrefixDwrService.searchPrefixes(

        prefix,

        gender,

        prefixOf,

        function(data) {

            console.log(
                "TAB 4 Search result:",
                data
            );


            tab4DisplayPrefixes(
                data || []
            );

        }

    );

}



/* =========================================================
   CLEAR CREATE FORM
   ========================================================= */

function tab4ClearCreateForm() {

    document.getElementById(
        "tab4CreatePrefix"
    ).value =
        "";


    document.getElementById(
        "tab4CreateGender"
    ).value =
        "";


    document.getElementById(
        "tab4CreatePrefixOf"
    ).value =
        "";

}



/* =========================================================
   CLEAR SEARCH
   ========================================================= */

function tab4ClearSearch() {

    document.getElementById(
        "tab4SearchPrefix"
    ).value =
        "";


    document.getElementById(
        "tab4SearchGender"
    ).value =
        "";


    document.getElementById(
        "tab4SearchPrefixOf"
    ).value =
        "";


    tab4LoadPrefixes();

}



/* =========================================================
   INITIAL LOAD
   ========================================================= */

setTimeout(

    function() {

        console.log(
            "TAB 4: Initial prefix load."
        );


        tab4LoadPrefixes();

    },

    500

);

</script>