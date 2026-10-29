const puppeteer = require("puppeteer");

async function generatePdf() {

    const browser = await puppeteer.launch({
        headless: true
    });

    const page = await browser.newPage();

    await page.setContent(`
        <html>
            <body>
                <h1>Hello World</h1>
                <p>Simple hello world page using Puppeteer.</p>
            </body>
        </html>
    `);

    await page.pdf({
        path: "sample.pdf",
        format: "A4"
    });

    await browser.close();

    console.log("PDF generated successfully");
}

generatePdf();