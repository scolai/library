<IfModule mod_rewrite.c>
    RewriteEngine On
    # If the requested file is a .css file:
    RewriteCond %{REQUEST_FILENAME} \.(css)$ [NC]
    # Check if a minified version (.min.css) exists in the same location:
    RewriteCond %{DOCUMENT_ROOT}/$1.min.$2 -f
    # If it exists, internally rewrite the request to the minified file:
    RewriteRule ^([^.]+)\.(css)$ /$1.min.$2 [L,NC]
</IfModule>