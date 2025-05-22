# Check if Docker is running
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not found. Please install Docker Desktop for Windows."
    Write-Host "You can download it from: https://www.docker.com/products/docker-desktop"
    Write-Host "After installation, please ensure Docker Desktop is running and try again."
    exit 1
}

try {
    docker ps > $null
}
catch {
    Write-Host "Docker is not running. Please start Docker Desktop and try again."
    exit 1
}

Write-Host "Docker is running."

# Define image name and container name
$imageName = "my-simple-app"
$containerName = "my-simple-app-container"

Write-Host "Building Docker image '$imageName'..."
try {
    docker build -t $imageName .
    Write-Host "Docker image '$imageName' built successfully."
}
catch {
    Write-Host "Error building Docker image. Please check the Dockerfile and logs."
    exit 1
}

Write-Host "Stopping and removing existing container '$containerName' (if any)..."
docker stop $containerName 2>$null | Out-Null
docker rm $containerName 2>$null | Out-Null

Write-Host "Running Docker container '$containerName'..."
try {
    docker run -d -p 8080:80 --name $containerName $imageName
    Write-Host "Docker container '$containerName' started successfully."
    Write-Host "You can access the application at: http://localhost:8080"
}
catch {
    Write-Host "Error running Docker container. Please check Docker logs."
    exit 1
}

Write-Host "Installation script finished."
