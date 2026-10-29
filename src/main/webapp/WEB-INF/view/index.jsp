<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Seven Tab Project</title>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }

        /* ---------------- TOP HEADER ---------------- */

        .header {
            background-color: #1677c8;
            color: white;
            padding: 15px 20px;
            font-size: 22px;
            font-weight: bold;
        }

        /* ---------------- TABS ---------------- */

        .tabs {
            display: flex;
            background-color: white;
            border-bottom: 1px solid #ccc;
            padding-left: 10px;
        }

        .tab-button {
            background-color: white;
            border: none;
            padding: 14px 25px;
            cursor: pointer;
            font-size: 14px;
            color: #333;
        }

        .tab-button:hover {
            background-color: #e8f3fc;
        }

        .tab-button.active {
            background-color: #1677c8;
            color: white;
        }

        /* ---------------- TAB CONTENT ---------------- */

        .tab-content {
            display: none;
            padding: 20px;
        }

        .tab-content.active {
            display: block;
        }

    </style>

</head>

<body>


<!-- ========================================================= -->
<!-- HEADER -->
<!-- ========================================================= -->

<div class="header">
    Seven Tab Project
</div>


<!-- ========================================================= -->
<!-- TAB BUTTONS -->
<!-- ========================================================= -->

<div class="tabs">

    <!-- TAB 1 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab1', this)">
        Tab 1
    </button>


    <!-- TAB 2 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab2', this)">
        Tab 2
    </button>


    <!-- TAB 3 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab3', this); loadTab3();">
        Tab 3
    </button>


    <!-- TAB 4 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab4', this)">
        Tab 4
    </button>


    <!-- TAB 5 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab5', this); loadTab5();">
        Tab 5
    </button>


    <!-- TAB 6 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab6', this); loadTab6();">
        Tab 6
    </button>


    <!-- TAB 7 -->

    <button
            type="button"
            class="tab-button"
            onclick="showTab('tab7', this); loadTab7();">
        Tab 7
    </button>

</div>


<!-- ========================================================= -->
<!-- TAB 1 -->
<!-- ========================================================= -->

<div
        id="tab1"
        class="tab-content">

    <jsp:include page="tab1.jsp"/>

</div>


<!-- ========================================================= -->
<!-- TAB 2 -->
<!-- ========================================================= -->

<div
        id="tab2"
        class="tab-content">

    <jsp:include page="tab2.jsp"/>

</div>


<!-- ========================================================= -->
<!-- TAB 3 -->
<!-- ========================================================= -->

<div
        id="tab3"
        class="tab-content">
</div>


<!-- ========================================================= -->
<!-- TAB 4 -->
<!-- ========================================================= -->

<div
        id="tab4"
        class="tab-content">

    <jsp:include page="tab4.jsp"/>

</div>


<!-- ========================================================= -->
<!-- TAB 5 -->
<!-- ========================================================= -->

<div
        id="tab5"
        class="tab-content">
</div>


<!-- ========================================================= -->
<!-- TAB 6 -->
<!-- ========================================================= -->

<div
        id="tab6"
        class="tab-content">
</div>


<!-- ========================================================= -->
<!-- TAB 7 -->
<!-- ========================================================= -->

<div
        id="tab7"
        class="tab-content">

</div>


<!-- ========================================================= -->
<!-- JAVASCRIPT -->
<!-- ========================================================= -->

<script>


    /* ===================================================== */
    /* SHOW TAB */
    /* ===================================================== */

    function showTab(tabId, button) {

        var tabs =
                document.querySelectorAll(".tab-content");

        var buttons =
                document.querySelectorAll(".tab-button");


        /* Hide all tabs */

        tabs.forEach(function(tab) {

            tab.classList.remove("active");

        });


        /* Remove active from all buttons */

        buttons.forEach(function(btn) {

            btn.classList.remove("active");

        });


        /* Show selected tab */

        var selectedTab =
                document.getElementById(tabId);

        if (selectedTab) {

            selectedTab.classList.add("active");

        }


        /* Make selected button active */

        if (button) {

            button.classList.add("active");

        }


        /* ================================================= */
        /* TAB 4 SPECIAL FUNCTION */
        /* ================================================= */

        if (
                tabId === "tab4"
                &&
                typeof tab4LoadPrefixes === "function"
        ) {

            tab4LoadPrefixes();

        }


        /* ================================================= */
        /* SAVE SELECTED TAB */
        /* ================================================= */

        localStorage.setItem(
                "selectedTab",
                tabId
        );

    }


    /* ===================================================== */
    /* LOAD TAB 3 */
    /* ===================================================== */
function loadTab3(url) {

    var tab = document.getElementById("tab3");

    var requestUrl =
        url ||
        "${pageContext.request.contextPath}/tab3";

    fetch(requestUrl)
        .then(function(response) {
            return response.text();
        })
        .then(function(html) {

            tab.innerHTML = html;

            tab.classList.add("active");


            // =================================================
            // TAB 3 SEARCH FORM
            // =================================================

            var form =
                document.getElementById("tab3SearchForm");


            if (form) {

                // Remove JSP inline submit handler
                form.removeAttribute("onsubmit");
                form.onsubmit = null;


                // =============================================
                // SEARCH
                // =============================================

                form.addEventListener(
                    "submit",
                    function(event) {

                        event.preventDefault();


                        var name =
                            form.querySelector(
                                '[name="name"]'
                            ).value.trim();


                        var code =
                            form.querySelector(
                                '[name="code"]'
                            ).value.trim();


                        var userType =
                            form.querySelector(
                                '[name="userType"]'
                            ).value;


                        var department =
                            form.querySelector(
                                '[name="department"]'
                            ).value;


                        var status =
                            form.querySelector(
                                '[name="status"]'
                            ).value;


                        // =====================================
                        // VALIDATION
                        // =====================================

                        if (
                            name === "" &&
                            code === "" &&
                            userType === "" &&
                            department === "" &&
                            status === ""
                        ) {

                            var message =
                                document.getElementById(
                                    "tab3Message"
                                );

                            if (message) {

                                message.innerHTML =
                                    "Please enter or select at least one search condition.";

                            }

                            return;

                        }


                        // =====================================
                        // CREATE URL
                        // =====================================

                        var params =
                            new URLSearchParams();


                        params.set(
                            "name",
                            name
                        );

                        params.set(
                            "code",
                            code
                        );

                        params.set(
                            "userType",
                            userType
                        );

                        params.set(
                            "department",
                            department
                        );

                        params.set(
                            "status",
                            status
                        );

                        params.set(
                            "page",
                            "1"
                        );


                        // =====================================
                        // LOAD FILTERED TAB 3
                        // =====================================

                        loadTab3(
                            "${pageContext.request.contextPath}/tab3?"
                            + params.toString()
                        );

                    }
                );


                // =============================================
                // CLEAR BUTTON
                // =============================================

                var clearButton =
                    form.querySelector(
                        'button[onclick="clearTab3Search();"]'
                    );


                if (clearButton) {

                    clearButton.removeAttribute("onclick");


                    clearButton.addEventListener(
                        "click",
                        function() {

                            loadTab3(
                                "${pageContext.request.contextPath}/tab3"
                            );

                        }
                    );

                }


                // =============================================
                // ENTER KEY
                // =============================================

                form.addEventListener(
                    "keypress",
                    function(event) {

                        if (event.key === "Enter") {

                            event.preventDefault();

                            form.dispatchEvent(
                                new Event("submit")
                            );

                        }

                    }
                );

            }

        })
        .catch(function(error) {

            console.error(
                "Error loading Tab 3:",
                error
            );

        });

}

      /* ===================================================== */
      /* LOAD TAB 5 */
      /* ===================================================== */

      function loadTab5() {

          var tab =
              document.getElementById("tab5");


          fetch(
              "${pageContext.request.contextPath}/tab5"
          )

          .then(function(response) {

              if (!response.ok) {

                  throw new Error(
                      "Failed to load Tab 5"
                  );

              }

              return response.text();

          })

          .then(function(html) {

              /*
               * =================================================
               * CREATE TEMPORARY CONTAINER
               * =================================================
               */

              var temporaryContainer =
                  document.createElement("div");


              temporaryContainer.innerHTML =
                  html;


              /*
               * =================================================
               * GET ALL SCRIPTS FROM TAB 5 JSP
               * =================================================
               */

              var scripts =
                  temporaryContainer.querySelectorAll(
                      "script"
                  );


              /*
               * =================================================
               * REMOVE SCRIPTS FROM HTML
               * =================================================
               *
               * We will execute them separately below.
               */

              scripts.forEach(function(script) {

                  script.remove();

              });


              /*
               * =================================================
               * PUT TAB 5 HTML INTO TAB
               * =================================================
               */

              tab.innerHTML =
                  temporaryContainer.innerHTML;


              tab.classList.add("active");


              /*
               * =================================================
               * EXECUTE TAB 5 JAVASCRIPT
               * =================================================
               */

              scripts.forEach(function(oldScript) {

                  var newScript =
                      document.createElement("script");


                  /*
                   * Copy script attributes
                   */

                  for (
                      var i = 0;
                      i < oldScript.attributes.length;
                      i++
                  ) {

                      var attribute =
                          oldScript.attributes[i];


                      newScript.setAttribute(
                          attribute.name,
                          attribute.value
                      );

                  }


                  /*
                   * Copy JavaScript code
                   */

                  newScript.text =
                      oldScript.textContent;


                  /*
                   * Add script to page
                   *
                   * This causes the JavaScript
                   * inside tab5.jsp to execute.
                   */

                  document.body.appendChild(
                      newScript
                  );

              });


              console.log(
                  "TAB 5: HTML and JavaScript loaded successfully."
              );

          })


          .catch(function(error) {

              console.error(
                  "Error loading Tab 5:",
                  error
              );


              tab.innerHTML =
                  "<p style='color:red;'>Error loading Tab 5</p>";

          });

      }

        /* ===================================================== */
    /* LOAD TAB 6 */
    /* ===================================================== */

function loadTab6() {

    var tab =
            document.getElementById("tab6");


    fetch(
            "${pageContext.request.contextPath}/tab6"
    )

    .then(function(response) {

        if (!response.ok) {

            throw new Error(
                    "Failed to load Tab 6"
            );

        }

        return response.text();

    })

    .then(function(html) {

        /*
         * Load Tab 6 HTML
         */

        tab.innerHTML = html;

        tab.classList.add("active");


        // =================================================
        // TAB 6 - PLUS BUTTON
        // =================================================

        var addButton =
                tab.querySelector(".add-button");


        if (addButton) {

            addButton.addEventListener(
                    "click",
                    function() {

                        var createSection =
                                tab.querySelector(
                                        "#tab6CreateSection"
                                );


                        if (!createSection) {

                            return;

                        }


                        if (
                                createSection.style.display ===
                                "none"
                                ||
                                createSection.style.display ===
                                ""
                        ) {

                            createSection.style.display =
                                    "block";

                        }

                        else {

                            createSection.style.display =
                                    "none";

                        }

                    }
            );

        }


        // =================================================
        // TAB 6 - SEARCH BUTTON
        // =================================================

        var searchButton =
                tab.querySelector(".search-button");


        if (searchButton) {

            searchButton.addEventListener(
                    "click",
                    function() {

                        filterTab6Table(tab);

                    }
            );

        }


        // =================================================
        // TAB 6 - SEARCH FUNCTION
        // =================================================

        function filterTab6Table(tabElement) {

            var prefixSearch =
                    tabElement.querySelector(
                            "#tab6SearchPrefix"
                    )
                    .value
                    .trim()
                    .toLowerCase();


            var genderSearch =
                    tabElement.querySelector(
                            "#tab6SearchGender"
                    )
                    .value
                    .trim()
                    .toLowerCase();


            var prefixOfSearch =
                    tabElement.querySelector(
                            "#tab6SearchPrefixOf"
                    )
                    .value
                    .trim()
                    .toLowerCase();


            var rows =
                    tabElement.querySelectorAll(
                            "#tab6PrefixTableBody tr"
                    );


            for (
                    var i = 0;
                    i < rows.length;
                    i++
            ) {

                var row =
                        rows[i];


                var cells =
                        row.getElementsByTagName(
                                "td"
                        );


                /*
                 * Ignore "No records found" row
                 */

                if (cells.length < 4) {

                    continue;

                }


                var prefix =
                        cells[0]
                        .textContent
                        .trim()
                        .toLowerCase();


                var gender =
                        cells[1]
                        .textContent
                        .trim()
                        .toLowerCase();


                var prefixOf =
                        cells[2]
                        .textContent
                        .trim()
                        .toLowerCase();


                var prefixMatch =
                        prefix.indexOf(
                                prefixSearch
                        ) !== -1;


                var genderMatch =
                        gender.indexOf(
                                genderSearch
                        ) !== -1;


                var prefixOfMatch =
                        prefixOf.indexOf(
                                prefixOfSearch
                        ) !== -1;


                if (
                        prefixMatch
                        &&
                        genderMatch
                        &&
                        prefixOfMatch
                ) {

                    row.style.display = "";

                }

                else {

                    row.style.display = "none";

                }

            }

        }


        // =================================================
        // TAB 6 - ENTER KEY FOR SEARCH
        // =================================================

        var searchPrefixInput =
                tab.querySelector(
                        "#tab6SearchPrefix"
                );


        if (searchPrefixInput) {

            searchPrefixInput.addEventListener(
                    "keypress",
                    function(event) {

                        if (
                                event.key === "Enter"
                        ) {

                            event.preventDefault();

                            filterTab6Table(tab);

                        }

                    }
            );

        }


        var searchPrefixOfInput =
                tab.querySelector(
                        "#tab6SearchPrefixOf"
                );


        if (searchPrefixOfInput) {

            searchPrefixOfInput.addEventListener(
                    "keypress",
                    function(event) {

                        if (
                                event.key === "Enter"
                        ) {

                            event.preventDefault();

                            filterTab6Table(tab);

                        }

                    }
            );

        }

    })

    .catch(function(error) {

        console.error(
                "Error loading Tab 6:",
                error
        );


        tab.innerHTML =
                "<p style='color:red;'>"
                + "Error loading Tab 6"
                + "</p>";

    });

}

    /* ===================================================== */
    /* LOAD TAB 7 */
    /* ===================================================== */

    function loadTab7() {

        var tab =
            document.getElementById("tab7");


        fetch(
            "${pageContext.request.contextPath}/tab7"
        )

        .then(function(response) {

            if (!response.ok) {

                throw new Error(
                    "Failed to load Tab 7"
                );

            }

            return response.text();

        })

        .then(function(html) {

            /*
             * =================================================
             * CREATE TEMPORARY CONTAINER
             * =================================================
             */

            var temporaryContainer =
                document.createElement("div");


            temporaryContainer.innerHTML =
                html;


            /*
             * =================================================
             * GET SCRIPTS FROM TAB 7 JSP
             * =================================================
             */

            var scripts =
                temporaryContainer.querySelectorAll(
                    "script"
                );


            /*
             * =================================================
             * REMOVE SCRIPTS FROM HTML
             * =================================================
             */

            scripts.forEach(function(script) {

                script.remove();

            });


            /*
             * =================================================
             * PUT TAB 7 HTML INTO TAB
             * =================================================
             */

            tab.innerHTML =
                temporaryContainer.innerHTML;


            tab.classList.add("active");


            /*
             * =================================================
             * EXECUTE TAB 7 JAVASCRIPT
             * =================================================
             */

            scripts.forEach(function(oldScript) {

                var newScript =
                    document.createElement("script");


                /*
                 * Copy script attributes
                 */

                for (
                    var i = 0;
                    i < oldScript.attributes.length;
                    i++
                ) {

                    var attribute =
                        oldScript.attributes[i];


                    newScript.setAttribute(
                        attribute.name,
                        attribute.value
                    );

                }


                /*
                 * Copy JavaScript code
                 */

                newScript.text =
                    oldScript.textContent;


                /*
                 * Add script to page
                 */

                document.body.appendChild(
                    newScript
                );

            });


            console.log(
                "TAB 7: HTML and JavaScript loaded successfully."
            );

        })


        .catch(function(error) {

            console.error(
                "Error loading Tab 7:",
                error
            );


            tab.innerHTML =
                "<p style='color:red;'>Error loading Tab 7</p>";

        });

    }

    /* ===================================================== */
    /* WINDOW ON LOAD */
    /* ===================================================== */

    window.onload = function() {

        var savedTab =
                localStorage.getItem("selectedTab");


        if (!savedTab) {

            savedTab = "tab1";

        }


        var buttons =
                document.querySelectorAll(".tab-button");


        var selectedButton = null;


        buttons.forEach(function(button) {

            var onclickText =
                    button.getAttribute("onclick");


            if (
                    onclickText
                    &&
                    onclickText.indexOf(
                            "'" + savedTab + "'"
                    ) !== -1
            ) {

                selectedButton = button;

            }

        });


        if (selectedButton) {

            showTab(
                    savedTab,
                    selectedButton
            );


            /* ============================================= */
            /* LOAD DYNAMIC TABS */
            /* ============================================= */

            if (savedTab === "tab3") {

                loadTab3();

            }


            if (savedTab === "tab5") {

                loadTab5();

            }


            if (savedTab === "tab6") {

                loadTab6();

            }

        }

    };


</script>

</body>
</html>