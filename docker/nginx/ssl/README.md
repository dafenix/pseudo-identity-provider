# SSL Certificates

This directory contains static, self-signed SSL certificates for testing purposes.

## Certificate Details

- **Validity**: 10 years
- **Domains**: localhost, *.localhost, pseudo-idp
- **IP**: 127.0.0.1
- **Type**: RSA 2048-bit

## Usage

The certificates are automatically used by Nginx when you enable HTTPS mode:

```bash
docker compose --profile https up -d
```

## Security Warning

⚠️ **These certificates are ONLY intended for testing and development purposes!**

- They are self-signed and will be displayed as insecure by browsers
- They should NEVER be used in a production environment
- For production environments, use real certificates (e.g., from Let's Encrypt)

## Using Custom Certificates

To use your own certificates, simply replace the files:
- `cert.pem` - The certificate
- `key.pem` - The private key

Or mount your own certificates in docker-compose.yml:

```yaml
services:
  nginx:
    volumes:
      - /path/to/your/cert.pem:/etc/nginx/ssl/cert.pem:ro
      - /path/to/your/key.pem:/etc/nginx/ssl/key.pem:ro
```
