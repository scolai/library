// safari-test.js

const { webkit } = require('playwright'); //Webkit = Safari engine
// const { chromium, firefox, webkit } = require('playwright');

(async ()=> {
    // Launch Safari-ish browser with a visible window
    const browser = await webkit.launch({ headless: true });

    // Define screen widths
    const widths = [345, 768, 1024, 1440]; // mobile, tablet, small desktop/laptop, desktop
    
    for (const width of widths) {
        const context = await browser.newContext({
            viewport: { width, height: 800 } // fixed height with variable width
        });
   
        const page = await context.newPage();

    // Go to a test site
       await page.goto('http://localhost:4000');
       console.log(`Rendered at width ${width}:`, await page.title());
       console.log('User agent:', await page.evaluate(() => navigator.userAgent));

    // Add timestamp to filename
    const timestamp = new Date()
        .toLocaleString('sv-SE', { hour12: false })    // YYYY-MM-DD HH:MM:SS
        .slice(0, 16)
        .replace(' ', '_')
        .replace(/:/g, '-');       

    // Open to a blank page
    // await page.goto('about:blank');

    // Capture screenshots at various widths
    await page.screenshot({
        path: `webkit-${width}-${timestamp}.png`,
        fullPage: true
    });

    // Print page title and user agent
    // console.log('Page title:', await page.title());

    await context.close();
    // Browser stays open until closed manually
    }

    await browser.close();
})();