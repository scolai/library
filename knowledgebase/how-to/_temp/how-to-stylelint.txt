HOW TO LINT CSS FILE
npx stylelint "**/*.css"

HOW TO CUSTOMIZE
https://stylelint.io/user-guide/customize

HOW TO HTML LINT
npx htmlhint "**/*.html"

HOW TO LINT CSS & HTML SIMULTANEOUSLY
~/package.json
  "scripts": {
    "lint:css": "stylelint '**/*.css'",
    "lint:html": "htmlhint '**/*.html'",
    "lint": "npm run lint:css && npm run lint:html"
  }
npm run lint


