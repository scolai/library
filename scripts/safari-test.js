// safari-test.js

// const { webkit } = require('playwright'); //Webkit = Safari engine
const { chromium, firefox, webkit } = require('playwright');

(async ()=> {
    // Launch Safari-ish browser with a visible window
    const browser = await webkit.launch({ headless: false, devtools: true });

    // Define screen widths
    const widths = [345, 768, 1024, 1440]; // mobile, tablet, small desktop/laptop, desktop
    for (const width of widths) {
        const context = await browser.newContext({
            viewport: { width, height: 800 } // fixed height with variable width
        });
        const page = await context.newPage();

    // Go to a test site
       await page.goto('http://localhost:4000');
       console.log('Rendered at width ${width}:', await page.title());

    // Open to a blank page
    // await page.goto('about:blank');

    

    // Print page title and user agent
    console.log('Page title:', await page.title());
    console.log('User agent:', await page.evaluate(() => navigator.userAgent));

    // Browser stays open until closed manually
    }
})();