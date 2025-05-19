const http = require("http");
const port = process.env.PORT || 8000;

const server = http.createServer((req, res) => {
  if (req.url === "/health" || req.url === "/") {
    res.statusCode = 200;
    res.setHeader("Content-Type", "application/json");
    res.end(JSON.stringify({ status: "ok", service: "instagram-mcp-server" }));
  } else if (req.url === "/status") {
    res.statusCode = 200;
    res.setHeader("Content-Type", "application/json");
    res.end(JSON.stringify({
      status: "running",
      service: "instagram-mcp-server",
      version: "1.0.0",
      timestamp: new Date().toISOString()
    }));
  } else if (req.url.startsWith("/api/")) {
    // Simulación de endpoints de API de Instagram
    res.statusCode = 200;
    res.setHeader("Content-Type", "application/json");
    res.end(JSON.stringify({
      message: "Instagram API endpoint simulado",
      endpoint: req.url,
      timestamp: new Date().toISOString()
    }));
  } else {
    res.statusCode = 404;
    res.end(JSON.stringify({ error: "Not found" }));
  }
});

server.listen(port, () => {
  console.log(`Instagram MCP Server running on port ${port}`);
});
