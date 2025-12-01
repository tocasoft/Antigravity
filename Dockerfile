# Use Apache httpd instead of Nginx to support .htaccess files
FROM httpd:2.4

# Enable .htaccess usage by changing AllowOverride None to AllowOverride All in httpd.conf
RUN sed -i '/<Directory "\/usr\/local\/apache2\/htdocs">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /usr/local/apache2/conf/httpd.conf

# Enable mod_rewrite (usually enabled by default, but good to ensure)
RUN sed -i 's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/' /usr/local/apache2/conf/httpd.conf

# Copy all files (including .htaccess and index.html) to the apache document root
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
