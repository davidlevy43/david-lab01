# david-lab01

This project is a simple web application consisting of an HTML page and a CSS file. It is containerized using Docker.

## Prerequisites

*   **Docker Desktop**: You need to have Docker Desktop installed and running on your Windows 11 system. You can download it from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).

## How to Run

There are two ways to run this application:

### 1. Using the Installation Script (Windows 11)

This is the recommended method for Windows 11 users.

1.  Make sure Docker Desktop is running.
2.  Open PowerShell.
3.  Navigate to the project's root directory (where `install.ps1` is located).
4.  Run the installation script:
    ```powershell
    .\install.ps1
    ```
5.  The script will:
    *   Check if Docker is running.
    *   Build the Docker image named `my-simple-app`.
    *   Stop and remove any existing container named `my-simple-app-container`.
    *   Run a new container from the image, mapping port 8080 on your machine to port 80 in the container.
6.  Once the script finishes, you can access the application by opening your web browser and navigating to [http://localhost:8080](http://localhost:8080).

### 2. Manual Docker Build and Run

If you prefer to build and run the application manually, or if you are not on Windows:

1.  **Build the Docker image:**
    Open a terminal or command prompt, navigate to the project's root directory (where the `Dockerfile` is located), and run:
    ```bash
    docker build -t my-simple-app .
    ```

2.  **Run the Docker container:**
    After the image is built successfully, run the following command to start a container:
    ```bash
    docker run -d -p 8080:80 --name my-simple-app-container my-simple-app
    ```
    *   `-d`: Runs the container in detached mode (in the background).
    *   `-p 8080:80`: Maps port 8080 on your host machine to port 80 in the container.
    *   `--name my-simple-app-container`: Assigns a name to the container for easier management.
    *   `my-simple-app`: The name of the image to use.

3.  **Access the application:**
    Open your web browser and navigate to [http://localhost:8080](http://localhost:8080).

## Project Files

*   `index.html`: The main HTML file.
*   `footer.css`: CSS styles for the application.
*   `Dockerfile`: Instructions to build the Docker image.
*   `install.ps1`: PowerShell script for easy setup and execution on Windows 11.
*   `readme.md`: This file.
