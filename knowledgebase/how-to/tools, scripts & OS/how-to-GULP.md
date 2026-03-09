GULP

install:
npm i -global gulp-cli

in project folder:
npm init

install gulp:
npm i gulp --save

install essential plugins (updated)
npm install gulp gulp-sass sass gulp-postcss autoprefixer cssnano gulp-terser gulp-concat gulp-sourcemaps gulp-rename gulp-imagemin --save-dev



npm only reads package-lock.json in the current directory.
Warnings come from outdated dependencies in the current project’s package.json.
Old lockfiles elsewhere on the system do not affect npm installs.

issue:
installed deprecated plugins. want to clean out:
rm -rf node_modules package-lock.json

issue: modern plugins triggering errors and warnings
clean reset inside project root:
rm -rf node_modules package-lock.json

remove all unwanted plugins from package.json dependencies and devdependencies

clean reinstall:
npm install

multiple package-lock.json files hidden?
find . -name "package-lock.json"


To inspect a module’s dependencies:
1. Look in node_modules/<module>/package.json
2. Run npm ls <module> for its full dependency tree
3. Run npm ls --depth=0 for top-level modules
4. Check the module’s page on npmjs.com

Critical npm vulnerabilities do not automatically endanger your computer.
A package is only risky if its code is executed in a context exposed to untrusted input.
Build tools (Gulp, PostCSS, Sass) are extremely low-risk.
Local development environments have minimal real-world exposure.
