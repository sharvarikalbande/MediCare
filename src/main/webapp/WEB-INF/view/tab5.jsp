<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .tab5-container {
        padding: 15px;
        font-family: Arial, sans-serif;
    }

    .tab5-title {
        margin-bottom: 15px;
        font-size: 20px;
    }

    .tab5-buttons {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }

    .tab5-button {
        background-color: #1677c8;
        color: white;
        border: none;
        padding: 9px 18px;
        font-size: 14px;
        border-radius: 3px;
        cursor: pointer;
    }

    .tab5-button:hover {
        background-color: #125fa0;
    }

    .tab5-upload-section {
        margin-bottom: 20px;
    }

    .tab5-upload-section input[type="file"] {
        margin-right: 10px;
    }

    .tab5-message {
        margin-top: 10px;
        margin-bottom: 15px;
        font-size: 14px;
    }

    .tab5-prefix-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }

    .tab5-prefix-table th {
        background-color: #eeeeee;
        border: 1px solid #999;
        padding: 8px;
        text-align: left;
    }

    .tab5-prefix-table td {
        border: 1px solid #999;
        padding: 8px;
    }

    .tab5-prefix-table tr:hover {
        background-color: #f5f5f5;
    }

</style>


<div class="tab5-container">

    <h2 class="tab5-title">
        Prefix Excel Management
    </h2>


    <!-- =====================================================
         DOWNLOAD BUTTONS
         ===================================================== -->

    <div class="tab5-buttons">

        <button
                type="button"
                class="tab5-button"
                id="downloadTemplateButton">

            Download Template

        </button>


       <button
               type="button"
               class="tab5-button"
               id="downloadExcelButton">

           Download Excel

       </button>

    </div>


    <!-- =====================================================
         UPLOAD SECTION
         ===================================================== -->

    <div class="tab5-upload-section">

        <form id="tab5UploadForm"
              action="${pageContext.request.contextPath}/tab5/upload-excel"
              method="post"
              enctype="multipart/form-data"
              onsubmit="return tab5ValidateUpload()">

            <input type="file"
                   name="file"
                   id="tab5ExcelFile"
                   accept=".xlsx">

            <button type="submit"
                    class="tab5-button"
                    id="tab5UploadButton">

                Upload Excel

            </button>

        </form>

    </div>


    <!-- =====================================================
         MESSAGE
         ===================================================== -->

    <div id="tab5Message"
         class="tab5-message">

        ${message}

    </div>


    <!-- =====================================================
         PREFIX TABLE
         ===================================================== -->

    <table class="tab5-prefix-table">

        <thead>

        <tr>
            <th>Prefix</th>
            <th>Gender</th>
            <th>Prefix Of</th>
        </tr>

        </thead>


        <tbody id="tab5PrefixTableBody">

        <c:forEach var="prefix" items="${prefixes}">

            <tr>

                <td>${prefix.prefix}</td>

                <td>${prefix.gender}</td>

                <td>${prefix.prefixOf}</td>

            </tr>

        </c:forEach>

        </tbody>

    </table>

</div>


<!-- =========================================================
     TAB 5 JAVASCRIPT
     ========================================================= -->

<script>

    console.log(
        "TAB 5: JavaScript loaded."
    );


    /*
     * ========================================================
     * DOWNLOAD TEMPLATE
     * ========================================================
     */

    function tab5DownloadTemplate() {

        console.log(
            "TAB 5: Download Template clicked."
        );


        window.location.href =
            '${pageContext.request.contextPath}/tab5/download-template';

    }


    /*
     * ========================================================
     * DOWNLOAD EXCEL
     * ========================================================
     */

    function tab5DownloadExcel() {

        console.log(
            "TAB 5: Download Excel clicked."
        );


        window.location.href =
            '${pageContext.request.contextPath}/tab5/download-excel';

    }


    /*
     * ========================================================
     * VALIDATE UPLOAD
     * ========================================================
     */

    function tab5ValidateUpload() {

        console.log(
            "TAB 5: Validating Excel file."
        );


        var fileInput =
            document.getElementById(
                "tab5ExcelFile"
            );


        var message =
            document.getElementById(
                "tab5Message"
            );


        /*
         * Check file selected
         */

        if (
            !fileInput.files ||
            fileInput.files.length === 0
        ) {

            message.innerHTML =
                "Please select an Excel file.";

            message.style.color =
                "red";


            console.log(
                "TAB 5: No file selected."
            );


            return false;

        }


        /*
         * Get selected file
         */

        var file =
            fileInput.files[0];


        console.log(
            "TAB 5: Selected file = "
            + file.name
        );


        /*
         * Check extension
         */

        var fileName =
            file.name.toLowerCase();


        if (
            !fileName.endsWith(".xlsx")
        ) {

            message.innerHTML =
                "Please select only an .xlsx Excel file.";

            message.style.color =
                "red";


            console.log(
                "TAB 5: Invalid file type."
            );


            return false;

        }


        /*
         * Check file size
         *
         * Maximum = 10 MB
         */

        var maxSize =
            10 * 1024 * 1024;


        if (file.size > maxSize) {

            message.innerHTML =
                "File size must be less than 10 MB.";

            message.style.color =
                "red";


            console.log(
                "TAB 5: File is larger than 10 MB."
            );


            return false;

        }


        /*
         * Everything is valid
         */

        message.innerHTML =
            "Uploading Excel file...";

        message.style.color =
            "green";


        /*
         * Disable upload button
         */

        var uploadButton =
            document.getElementById(
                "tab5UploadButton"
            );


        if (uploadButton) {

            uploadButton.disabled =
                true;

        }


        console.log(
            "TAB 5: Excel file validation successful."
        );


        /*
         * Return true
         *
         * Allows normal form submission.
         */

        return true;

    }


    /*
     * ========================================================
     * FILE SELECTION EVENT
     * ========================================================
     */

    function tab5FileSelectionChanged() {

        var fileInput =
            document.getElementById(
                "tab5ExcelFile"
            );


        var message =
            document.getElementById(
                "tab5Message"
            );


        var file =
            fileInput.files[0];


        /*
         * No file selected
         */

        if (!file) {

            message.innerHTML = "";

            return;

        }


        console.log(
            "TAB 5: File selected = "
            + file.name
        );


        /*
         * Check extension
         */

        if (
            !file.name
                .toLowerCase()
                .endsWith(".xlsx")
        ) {

            message.innerHTML =
                "Invalid file. Please select an .xlsx file.";

            message.style.color =
                "red";


            fileInput.value = "";


            return;

        }


        /*
         * Check file size
         */

        var maxSize =
            10 * 1024 * 1024;


        if (file.size > maxSize) {

            message.innerHTML =
                "File size must be less than 10 MB.";

            message.style.color =
                "red";


            fileInput.value = "";


            return;

        }


        /*
         * Valid file
         */

        message.innerHTML =
            "Selected file: "
            + file.name;

        message.style.color =
            "green";

    }


    /*
     * ========================================================
     * CONNECT TAB 5 BUTTONS
     * ========================================================
     */

    var downloadTemplateButton =
        document.getElementById(
            "downloadTemplateButton"
        );


    if (downloadTemplateButton) {

        downloadTemplateButton.addEventListener(
            "click",
            tab5DownloadTemplate
        );

    }


    var downloadExcelButton =
        document.getElementById(
            "downloadExcelButton"
        );


    if (downloadExcelButton) {

        downloadExcelButton.addEventListener(
            "click",
            tab5DownloadExcel
        );

    }


    /*
     * ========================================================
     * CONNECT FILE INPUT
     * ========================================================
     */

    var tab5ExcelFile =
        document.getElementById(
            "tab5ExcelFile"
        );


    if (tab5ExcelFile) {

        tab5ExcelFile.addEventListener(
            "change",
            tab5FileSelectionChanged
        );

    }


    /*
     * ========================================================
     * TAB 5 READY
     * ========================================================
     */

    console.log(
        "TAB 5: All JavaScript events connected."
    );

</script>