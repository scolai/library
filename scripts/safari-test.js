// safari-test.js
const { webkit } = require('playwright');

async function crawlSite(page, rootUrl) {
  await page.goto(rootUrl);

  const links = await page.$$eval('a[href]', anchors =>
    anchors.map(a => a.href)
  );

  const root = new URL(rootUrl);

  const internal = links
    .filter(href => {
      try {
        const url = new URL(href);
        return url.origin === root.origin;
      } catch {
        return false;
      }
    })
    .map(href => href.split('#')[0])
    .filter(Boolean);

  return [...new Set(internal)];
}

(async () => {
  const browser = await webkit.launch({ headless: true });

  const widths = [345, 768, 1024, 1440];

  const inputUrl = process.argv[2] || null;
  const rootUrl = 'http://localhost:4000';

  const context = await browser.newContext();
  const page = await context.newPage();

  let urls = [];

  if (inputUrl) {
    urls = [inputUrl];
    console.log(`Using URL from command line: ${inputUrl}`);
  } else {
    console.log(`Crawling site starting at ${rootUrl}`);
    urls = await crawlSite(page, rootUrl);
    urls.unshift(rootUrl); // ensure homepage is first
  }

  await context.close();

  for (const width of widths) {
    const context = await browser.newContext({
      viewport: { width, height: 800 }
    });

    const page = await context.newPage();

    for (const url of urls) {
      await page.goto(url);

      const timestamp = new Date()
        .toLocaleString('sv-SE', { hour12: false })
        .slice(0, 16)
        .replace(' ', '_')
        .replace(/:/g, '-');

      const safeUrl = url
        .replace('http://', '')
        .replace(/\//g, '_')
        .replace(/[^a-zA-Z0-9_-]/g, '');

      await page.screenshot({
        path: `webkit-${safeUrl}-${width}-${timestamp}.png`,
        fullPage: true
      });

      console.log(`Captured ${url} at width ${width}`);
    }

    await context.close();
  }

  await browser.close();
})();
