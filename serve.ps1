$port = 8080
$root = (Get-Location).Path
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://127.0.0.1:$port/")
$listener.Start()
Write-Host "Serving $root on http://127.0.0.1:$port/"

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $requestPath = $context.Request.Url.AbsolutePath
        if ([string]::IsNullOrWhiteSpace($requestPath) -or $requestPath -eq "/") {
            $requestPath = "/index.html"
        }
        $relativePath = $requestPath.TrimStart('/')
        $fullPath = Join-Path $root $relativePath

        if (-not [System.IO.Path]::HasExtension($fullPath)) {
            $candidate = Join-Path $fullPath 'index.html'
            if (Test-Path $candidate -PathType Leaf) {
                $fullPath = $candidate
            }
        }

        if (Test-Path $fullPath -PathType Leaf) {
            $content = [System.IO.File]::ReadAllBytes($fullPath)
            $extension = [System.IO.Path]::GetExtension($fullPath)
            $mime = switch ($extension) {
                ".html" { "text/html; charset=utf-8" }
                ".css" { "text/css; charset=utf-8" }
                ".js" { "application/javascript; charset=utf-8" }
                ".png" { "image/png" }
                ".jpg" { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".gif" { "image/gif" }
                ".svg" { "image/svg+xml" }
                default { "application/octet-stream" }
            }
            $context.Response.ContentType = $mime
            $context.Response.ContentLength64 = $content.Length
            $context.Response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $body = [System.Text.Encoding]::UTF8.GetBytes("<h1>404 Not Found</h1>")
            $context.Response.StatusCode = 404
            $context.Response.ContentType = "text/html; charset=utf-8"
            $context.Response.ContentLength64 = $body.Length
            $context.Response.OutputStream.Write($body, 0, $body.Length)
        }

        $context.Response.Close()
    }
    catch {
        break
    }
}

$listener.Stop()
$listener.Close()
