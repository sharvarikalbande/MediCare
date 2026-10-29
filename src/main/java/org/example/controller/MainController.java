package org.example.controller;

import org.example.dao.PrefixDAO;
import org.example.entity.Prefix;
import org.example.entity.User;
import org.example.service.MainService;
import org.example.service.ExcelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.util.List;


@Controller
public class MainController {


    // =========================================================
    // AUTOWIRED SERVICES / DAO
    // =========================================================

    @Autowired
    private MainService mainService;

    @Autowired
    private ExcelService excelService;

    @Autowired
    private PrefixDAO prefixDAO;



    // =========================================================
    // LOGIN PAGE
    // =========================================================

    @GetMapping("/")
    public String loginPage() {

        return "login";
    }



    // =========================================================
    // SEVEN TABS PAGE / TAB 3
    // =========================================================

    @GetMapping("/home")
    public String home(

            @RequestParam(
                    value = "name",
                    required = false
            )
            String name,

            @RequestParam(
                    value = "code",
                    required = false
            )
            String code,

            @RequestParam(
                    value = "userType",
                    required = false
            )
            String userType,

            @RequestParam(
                    value = "department",
                    required = false
            )
            String department,

            @RequestParam(
                    value = "status",
                    required = false
            )
            String status,

            @RequestParam(
                    value = "page",
                    defaultValue = "1"
            )
            int page,

            Model model) {


        // =====================================================
        // PAGE SIZE
        // =====================================================

        int pageSize = 15;



        // =====================================================
        // GET TOTAL FILTERED RECORDS
        // =====================================================

        long totalRecords =
                mainService.countUsers(
                        name,
                        code,
                        userType,
                        department,
                        status
                );



        // =====================================================
        // CALCULATE TOTAL PAGES
        // =====================================================

        int totalPages;

        if (totalRecords == 0) {

            totalPages = 1;

        } else {

            totalPages =
                    (int) Math.ceil(
                            (double) totalRecords
                                    / pageSize
                    );
        }



        // =====================================================
        // MAKE SURE PAGE IS VALID
        // =====================================================

        if (page < 1) {

            page = 1;
        }


        if (page > totalPages) {

            page = totalPages;
        }



        // =====================================================
        // GET FILTERED + PAGINATED USERS
        // =====================================================

        List<User> users =
                mainService.searchUsers(
                        name,
                        code,
                        userType,
                        department,
                        status,
                        page,
                        pageSize
                );



        // =====================================================
        // SEND USERS TO JSP
        // =====================================================

        model.addAttribute(
                "users",
                users
        );



        // =====================================================
        // KEEP SEARCH VALUES
        // =====================================================

        model.addAttribute(
                "searchName",
                name
        );


        model.addAttribute(
                "searchCode",
                code
        );


        model.addAttribute(
                "userType",
                userType
        );


        model.addAttribute(
                "department",
                department
        );


        model.addAttribute(
                "status",
                status
        );



        // =====================================================
        // DROPDOWN DATA
        // =====================================================

        model.addAttribute(
                "userTypes",
                mainService.getUserTypes()
        );


        model.addAttribute(
                "departments",
                mainService.getDepartments()
        );


        model.addAttribute(
                "statuses",
                mainService.getStatuses()
        );



        // =====================================================
        // PAGINATION DATA
        // =====================================================

        model.addAttribute(
                "currentPage",
                page
        );


        model.addAttribute(
                "pageSize",
                pageSize
        );


        model.addAttribute(
                "totalRecords",
                totalRecords
        );


        model.addAttribute(
                "totalPages",
                totalPages
        );



        // =====================================================
        // OPEN INDEX / SEVEN TABS PAGE
        // =====================================================

        return "index";
    }

// =========================================================
// TAB 3
// =========================================================

    @GetMapping("/tab3")
    public String showTab3(

            @RequestParam(required = false) String name,

            @RequestParam(required = false) String code,

            @RequestParam(required = false) String userType,

            @RequestParam(required = false) String department,

            @RequestParam(required = false) String status,

            @RequestParam(defaultValue = "1") int page,

            Model model) {


        // =====================================================
        // PAGE SIZE
        // =====================================================

        int pageSize = 15;


        // =====================================================
        // GET TOTAL FILTERED RECORDS
        // =====================================================

        long totalRecords =
                mainService.countUsers(
                        name,
                        code,
                        userType,
                        department,
                        status
                );


        // =====================================================
        // CALCULATE TOTAL PAGES
        // =====================================================

        int totalPages;

        if (totalRecords == 0) {

            totalPages = 1;

        } else {

            totalPages =
                    (int) Math.ceil(
                            (double) totalRecords / pageSize
                    );
        }


        // =====================================================
        // MAKE SURE PAGE IS VALID
        // =====================================================

        if (page < 1) {
            page = 1;
        }

        if (page > totalPages) {
            page = totalPages;
        }


        // =====================================================
        // GET FILTERED + PAGINATED USERS
        // =====================================================

        List<User> users =
                mainService.searchUsers(
                        name,
                        code,
                        userType,
                        department,
                        status,
                        page,
                        pageSize
                );


        // =====================================================
        // SEND USERS TO JSP
        // =====================================================

        model.addAttribute("users", users);


        // =====================================================
        // KEEP SEARCH VALUES
        // =====================================================

        model.addAttribute(
                "searchName",
                name == null ? "" : name
        );

        model.addAttribute(
                "searchCode",
                code == null ? "" : code
        );

        model.addAttribute(
                "userType",
                userType == null ? "" : userType
        );

        model.addAttribute(
                "department",
                department == null ? "" : department
        );

        model.addAttribute(
                "status",
                status == null ? "" : status
        );


        // =====================================================
        // DROPDOWN DATA
        // =====================================================

        model.addAttribute(
                "userTypes",
                mainService.getUserTypes()
        );

        model.addAttribute(
                "departments",
                mainService.getDepartments()
        );

        model.addAttribute(
                "statuses",
                mainService.getStatuses()
        );


        // =====================================================
        // PAGINATION DATA
        // =====================================================

        model.addAttribute(
                "currentPage",
                page
        );

        model.addAttribute(
                "pageSize",
                pageSize
        );

        model.addAttribute(
                "totalRecords",
                totalRecords
        );

        model.addAttribute(
                "totalPages",
                totalPages
        );


        // =====================================================
        // RETURN TAB 3 JSP
        // =====================================================

        return "tab3";
    }



    // =========================================================
    // CHECK EMPTY VALUE
    // =========================================================

    private boolean isEmpty(String value) {

        return value == null
                || value.trim().isEmpty();
    }



    // =========================================================
    // TAB 5
    // =========================================================

    @GetMapping("/tab5")
    @Transactional(readOnly = true)
    public String showTab5(Model model) {

        List<Prefix> prefixes =
                prefixDAO.getAllPrefixes();


        model.addAttribute(
                "prefixes",
                prefixes
        );


        return "tab5";
    }



    // =========================================================
    // TAB 5 - DOWNLOAD EMPTY TEMPLATE
    // =========================================================

    @GetMapping("/tab5/download-template")
    public ResponseEntity<byte[]> downloadTemplate()
            throws Exception {


        byte[] file =
                excelService.createEmptyTemplate();


        return ResponseEntity.ok()
                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=prefix_template.xlsx"
                )
                .contentType(
                        MediaType.parseMediaType(
                                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                        )
                )
                .body(file);
    }



    // =========================================================
    // TAB 5 - DOWNLOAD EXISTING EXCEL
    // =========================================================

    @GetMapping("/tab5/download-excel")
    public ResponseEntity<byte[]> downloadExcel() throws Exception {

        System.out.println("DOWNLOAD EXCEL METHOD CALLED");

        // TEMPORARY TEST:
        // Do NOT get data from database yet.
        List<Prefix> prefixes = new java.util.ArrayList<>();

        byte[] file = excelService.createExcel(prefixes);

        System.out.println("EXCEL CREATED. SIZE = " + file.length);

        return ResponseEntity.ok()
                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"prefix.xlsx\""
                )
                .contentType(
                        MediaType.parseMediaType(
                                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                        )
                )
                .body(file);
    }

    // =========================================================
    // TAB 5 - UPLOAD EXCEL
    // =========================================================

    @PostMapping("/tab5/upload-excel")
    @Transactional
    public String uploadExcel(

            @RequestPart("file")
            MultipartFile file,

            Model model)

            throws Exception {

        // =====================================================
        // CHECK FILE
        // =====================================================

        if (file == null || file.isEmpty()) {

            model.addAttribute(
                    "message",
                    "Please select an Excel file."
            );

            model.addAttribute(
                    "prefixes",
                    prefixDAO.getAllPrefixes()
            );

            return "tab5";
        }


        // =====================================================
        // READ EXCEL FILE
        // =====================================================

        List<Prefix> uploadedPrefixes =
                excelService.readExcel(
                        file.getInputStream()
                );


        // =====================================================
        // GET EXISTING PREFIXES
        // =====================================================

        List<Prefix> existingPrefixes =
                prefixDAO.getAllPrefixes();

        int addedCount = 0;


        // =====================================================
        // CHECK EACH UPLOADED PREFIX
        // =====================================================

        for (Prefix uploadedPrefix :
                uploadedPrefixes) {


            boolean alreadyExists = false;


            for (Prefix existingPrefix :
                    existingPrefixes) {


                if (isSamePrefix(
                        uploadedPrefix,
                        existingPrefix
                )) {


                    alreadyExists = true;

                    break;
                }
            }



            // =================================================
            // SAVE ONLY NEW PREFIX
            // =================================================

            if (!alreadyExists) {


                prefixDAO.savePrefix(
                        uploadedPrefix
                );


                existingPrefixes.add(
                        uploadedPrefix
                );


                addedCount++;
            }
        }



        // =====================================================
        // GET UPDATED PREFIX LIST
        // =====================================================

        List<Prefix> updatedPrefixes =
                prefixDAO.getAllPrefixes();



        model.addAttribute(
                "prefixes",
                updatedPrefixes
        );


        model.addAttribute(
                "message",
                addedCount
                        + " new prefix record(s) uploaded successfully."
        );


        return "tab5";
    }



    // =========================================================
    // CHECK DUPLICATE PREFIX
    // =========================================================

    private boolean isSamePrefix(

            Prefix p1,

            Prefix p2) {


        return safeEquals(
                p1.getPrefix(),
                p2.getPrefix()
        )

                &&

                safeEquals(
                        p1.getGender(),
                        p2.getGender()
                )

                &&

                safeEquals(
                        p1.getPrefixOf(),
                        p2.getPrefixOf()
                );
    }



    // =========================================================
    // SAFE STRING COMPARISON
    // =========================================================

    private boolean safeEquals(

            String value1,

            String value2) {


        if (value1 == null) {

            value1 = "";
        }


        if (value2 == null) {

            value2 = "";
        }


        return value1
                .trim()
                .equalsIgnoreCase(
                        value2.trim()
                );
    }



// =========================================================
// TAB 6 - LOAD PREFIXES
// =========================================================

    @GetMapping("/tab6")
    @Transactional(readOnly = true)
    public String showTab6(Model model) {

        List<Prefix> prefixes =
                prefixDAO.getAllPrefixes();

        model.addAttribute(
                "prefixes",
                prefixes
        );

        return "tab6";
    }
    // =========================================================
// TAB 6 - CREATE PREFIX
// =========================================================

    @PostMapping("/tab6/create")
    @Transactional
    public String createTab6Prefix(
            @RequestParam("prefix") String prefix,
            @RequestParam("gender") String gender,
            @RequestParam("prefixOf") String prefixOf) {

        Prefix newPrefix = new Prefix();

        newPrefix.setPrefix(prefix);
        newPrefix.setGender(gender);
        newPrefix.setPrefixOf(prefixOf);

        prefixDAO.savePrefix(newPrefix);

        return "redirect:/home";
    }


// =========================================================
// TAB 6 - DELETE PREFIX
// =========================================================

    @PostMapping("/tab6/delete")
    @Transactional
    public String deleteTab6Prefix(
            @RequestParam("id") int id) {

        prefixDAO.deletePrefix(id);

        return "redirect:/home";
    }

// =========================================================
// TAB 7
// =========================================================

    @GetMapping("/tab7")
    public String showTab7() {

        return "tab7";
    }



    // =========================================================
    // GENERATE PDF
    // =========================================================

    @GetMapping("/generatePdf")
    public ResponseEntity<byte[]> generatePdf()
            throws Exception {


        // =====================================================
        // PUPPETEER FOLDER
        // =====================================================

        Path puppeteerFolder =
                Paths.get(
                        System.getProperty("user.home"),
                        "Desktop",
                        "SevenTabProject",
                        "puppeteer"
                );



        // =====================================================
        // INDEX.JS
        // =====================================================

        Path indexJs =
                puppeteerFolder.resolve(
                        "index.js"
                );



        // =====================================================
        // GENERATED PDF
        // =====================================================

        Path pdfFile =
                puppeteerFolder.resolve(
                        "sample.pdf"
                );



        // =====================================================
        // RUN NODE / PUPPETEER
        // =====================================================

        ProcessBuilder processBuilder =
                new ProcessBuilder(
                        "node",
                        indexJs.toString()
                );


        processBuilder.directory(
                puppeteerFolder.toFile()
        );


        processBuilder.inheritIO();



        // =====================================================
        // START PROCESS
        // =====================================================

        Process process =
                processBuilder.start();



        // =====================================================
        // WAIT FOR PDF GENERATION
        // =====================================================

        int exitCode =
                process.waitFor();



        // =====================================================
        // CHECK PDF
        // =====================================================

        if (exitCode != 0
                || !Files.exists(pdfFile)) {


            throw new RuntimeException(
                    "PDF generation failed."
            );
        }



        // =====================================================
        // READ PDF
        // =====================================================

        byte[] file =
                Files.readAllBytes(
                        pdfFile
                );



        // =====================================================
        // RETURN PDF TO BROWSER
        // =====================================================

        return ResponseEntity.ok()

                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=sample.pdf"
                )

                .contentType(
                        MediaType.APPLICATION_PDF
                )

                .body(file);
    }

}