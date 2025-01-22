<div align="center">
  <a href="https://abasync.com.br/">
    <img src="https://abasync-public-assets.s3.sa-east-1.amazonaws.com/abasync-logo-portainer.png" alt="Logo">
  </a>

  <h1 align="center">Azure Pipelines Agent</h1>
</div>

This project sets up and runs an Azure Pipelines agent using Docker and Docker Compose. The agent includes Docker-in-Docker (dind) and Node.js.

### Usage Instructions

#### Prerequisites

- Docker
- Docker Compose

#### Steps to Run

1. Clone the repository:

    ```sh
    git clone https://github.com/abasync/azure-custom-agent.git
    cd azure-custom-agent
    ```

2. Configure the environment variables in the [`stack.env`](stack.env ) file. You can use the [`example.env`](example.env ) file as a reference:

    ```env
    AZP_URL=https://dev.azure.com/org-name/
    AZP_TOKEN=token with "agent pool - read & manage" permissions
    AZP_POOL=agent pool name
    AZP_AGENT_NAME=Custom Agent Name
    ```

3. Build and start the container using Docker Compose:

    ```sh
    docker-compose up --build -d
    ```

4. The Azure Pipelines agent will be started and configured automatically.

### Project Structure

- [`Dockerfile`](Dockerfile ): Defines the Docker image for the agent.
- [`docker-compose.yml`](docker-compose.yml ): Defines the Docker Compose services.
- [`example.env`](example.env ): Example environment variables configuration file.
- [`stack.env`](stack.env ): Environment variables configuration file (added to .gitignore).
- [`start.sh`](start.sh ): Agent startup script.

### License

This project is licensed under the MIT License. See the LICENSE file for more details.