FROM nginx:alpine

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Create ssl directory
RUN mkdir -p /etc/nginx/ssl && \
    chown -R nginx:nginx /etc/nginx/ssl && \
    chmod 755 /etc/nginx/ssl

# Copy SSL certificates
# These should be generated locally using the instructions in README.md
COPY ssl/*.pem /etc/nginx/ssl/

# Verify that certificates exist before starting
RUN if [ ! -f /etc/nginx/ssl/cert.pem ] || [ ! -f /etc/nginx/ssl/key.pem ]; then \
        echo "======================================" && \
        echo "ERROR: SSL certificates not found!" && \
        echo "======================================" && \
        echo "" && \
        echo "Please generate certificates before building:" && \
        echo "  cd docker/nginx/ssl" && \
        echo "  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \\" && \
        echo "    -keyout key.pem -out cert.pem \\" && \
        echo "    -subj '/CN=localhost'" && \
        echo "" && \
        echo "See README.md section 'HTTPS with Docker' for details." && \
        echo "======================================" && \
        exit 1; \
    fi

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
