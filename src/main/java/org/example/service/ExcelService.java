package org.example.service;

import org.example.entity.Prefix;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class ExcelService {

    // =========================================================
    // CREATE EXCEL FILE
    // =========================================================

    public byte[] createExcel(List<Prefix> prefixes) throws IOException {

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Prefix");

        // Header row
        Row header = sheet.createRow(0);

        header.createCell(0).setCellValue("Prefix");
        header.createCell(1).setCellValue("Gender");
        header.createCell(2).setCellValue("Prefix Of");

        // Data rows
        int rowNumber = 1;

        for (Prefix prefix : prefixes) {

            Row row = sheet.createRow(rowNumber++);

            row.createCell(0).setCellValue(
                    prefix.getPrefix() != null ? prefix.getPrefix() : ""
            );

            row.createCell(1).setCellValue(
                    prefix.getGender() != null ? prefix.getGender() : ""
            );

            row.createCell(2).setCellValue(
                    prefix.getPrefixOf() != null ? prefix.getPrefixOf() : ""
            );
        }

        // Adjust column widths
        sheet.autoSizeColumn(0);
        sheet.autoSizeColumn(1);
        sheet.autoSizeColumn(2);

        ByteArrayOutputStream outputStream =
                new ByteArrayOutputStream();

        workbook.write(outputStream);
        workbook.close();

        return outputStream.toByteArray();
    }


    // =========================================================
    // CREATE EMPTY EXCEL TEMPLATE
    // =========================================================

    public byte[] createEmptyTemplate() throws IOException {

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Prefix");

        Row header = sheet.createRow(0);

        header.createCell(0).setCellValue("Prefix");
        header.createCell(1).setCellValue("Gender");
        header.createCell(2).setCellValue("Prefix Of");

        sheet.autoSizeColumn(0);
        sheet.autoSizeColumn(1);
        sheet.autoSizeColumn(2);

        ByteArrayOutputStream outputStream =
                new ByteArrayOutputStream();

        workbook.write(outputStream);
        workbook.close();

        return outputStream.toByteArray();
    }


    // =========================================================
    // READ UPLOADED EXCEL
    // =========================================================

    public List<Prefix> readExcel(InputStream inputStream)
            throws IOException {

        List<Prefix> prefixes = new ArrayList<>();

        Workbook workbook = WorkbookFactory.create(inputStream);

        Sheet sheet = workbook.getSheetAt(0);

        // Start from row 1 because row 0 is the header
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {

            Row row = sheet.getRow(i);

            if (row == null) {
                continue;
            }

            String prefix = getCellValue(row.getCell(0));
            String gender = getCellValue(row.getCell(1));
            String prefixOf = getCellValue(row.getCell(2));

            // Ignore completely empty rows
            if (prefix.isEmpty() &&
                    gender.isEmpty() &&
                    prefixOf.isEmpty()) {
                continue;
            }

            Prefix newPrefix = new Prefix();

            newPrefix.setPrefix(prefix);
            newPrefix.setGender(gender);
            newPrefix.setPrefixOf(prefixOf);

            prefixes.add(newPrefix);
        }

        workbook.close();

        return prefixes;
    }


    // =========================================================
    // READ CELL VALUE
    // =========================================================

    private String getCellValue(Cell cell) {

        if (cell == null) {
            return "";
        }

        DataFormatter formatter = new DataFormatter();

        return formatter.formatCellValue(cell).trim();
    }
}