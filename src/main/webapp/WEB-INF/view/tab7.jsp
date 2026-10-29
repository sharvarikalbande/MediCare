<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Tab 7 - PDF Generation</title>

    <style>

        .tab7-container {
            padding: 15px;
            font-family: Arial, sans-serif;
        }

        .tab7-title {
            margin-bottom: 10px;
            font-size: 20px;
        }

        .tab7-description {
            margin-bottom: 20px;
            font-size: 14px;
        }

        .generate-button {
            background-color: #1677c8;
            color: white;
            border: none;
            padding: 10px 18px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .generate-button:hover {
            background-color: #125fa0;
        }

    </style>

</head>

<body>

<div class="tab7-container">

    <h2 class="tab7-title">
        Tab 7: Sample PDF Generation Using Puppeteer Library
    </h2>


    <p class="tab7-description">
        Simple hello world page using puppeteer
    </p>


    <button
            type="button"
            class="generate-button"
            id="generatePdfButton">

        Generate PDF

    </button>

</div>


<script>

    /*
     * ========================================================
     * TAB 7 - GENERATE PDF
     * ========================================================
     */

    function generatePDF() {

        console.log(
            "TAB 7: Generate PDF clicked."
        );


        window.location.href =
            "${pageContext.request.contextPath}/generatePdf";

    }


    /*
     * ========================================================
     * CONNECT GENERATE PDF BUTTON
     * ========================================================
     */

    var generatePdfButton =
        document.getElementById(
            "generatePdfButton"
        );


    if (generatePdfButton) {

        generatePdfButton.addEventListener(
            "click",
            generatePDF
        );

    }


    console.log(
        "TAB 7: JavaScript loaded successfully."
    );

</script>

</body>

</html>