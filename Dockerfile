# Dockerfile for OpenPlantbook MCP Server with MCPO proxy
# This wraps the MCP server with MCPO to expose it as REST/OpenAPI for OpenWebUI
FROM ghcr.io/open-webui/mcpo:main AS base

# Install any additional dependencies if needed
# The mcpo image already has Python and mcpo installed

# Copy the pre-compiled Linux binary
COPY bin/openplantbook-mcp-linux-amd64 /usr/local/bin/openplantbook-mcp
RUN chmod +x /usr/local/bin/openplantbook-mcp

# Expose the MCPO HTTP port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8000/health || exit 1

# Run MCPO with the openplantbook-mcp server
# Environment variables will be passed through to the MCP server:
# - OPENPLANTBOOK_API_KEY
# - OPENPLANTBOOK_LOG_LEVEL
# - OPENPLANTBOOK_LOG_FILE
# - etc.
ENTRYPOINT ["mcpo"]
CMD ["--", "/usr/local/bin/openplantbook-mcp"]
