# MA_DDB22_WORKSPACE
This is the main sandbox for my Master Thesis Proof of Concept.

## Local Development Environment

### Versions
| Name                       | Version                        |
|-------------------------   |-----------------------------   |
| Operating System           | MacOs Sequoa - 15.0            |
| Docker Desktop             | 4.34.2 (167172)                |
| Docker Engine              | 27.2.0                         |
| Docker Compose             | 2.29.2-desktop.2               |
| Git                        | 2.43.0                         |
| Virtual Studio (VS) Code   | 1.93.1                         |


## Workspace Environment
Working in an isolated Environment allows to develop without any Version Managers like nvm and keep your local machine simple without any further effects on other projects (KISS)
In addition a developer does not need to have VS Code installed and can use the web interface or use the VS Code DevContainer extension to connect to the running Docker Container.
This setup also allows for further separation of concerns (SOC) by installing Extensions, changing the Theme and other customisations of VS Code on a per project basis, to enhance the Development Experience (DX)

In this project Node and Piral specific packages are installed and prepared inside the DevContainer.

### Versions
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Operating System                  | Debian 12.6 (Bookworm)         |
| Git                               | 2.39.2                         |
| Virtual Studio (VS) Code          | 1.92.2                         |
| Virtual Studio (VS) Code Server   | 4.92.2                         |
| Node                              | 20.17.0                        |
| Node Package Manager (npm)        | 1.8.3                          |
| Piral CLI                         | 1.6.1                          |

### Usage
The workspace Docker Image is used for
- development environment for piral (piral-workspace)
- development environment for pilets (pilets-workspace)

## Pilet Feed Service(s)
Piral uses a feed service to deliver Pilets to the Piral Instance (app shell)

There are 2 Docker Images available:
- iham/piral-local-feed-service
- iham/piral-sample-feed-service

Both are sample implementations using nodejs.
To implement the Feed Service on other platforms, visit the documentation:
https://docs.piral.io/reference/specifications/feed-api-specification


### Versions
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Operating System                  | Alpine 3.20                    |
| Node                              | 22.9.0 (Current Release)       |
| Node Package Manager (npm)        | 1.8.3                          |

### Piral Sample Feed Service
This is the base installation handling the Feed Service the register Pilets against.
This Docker Container is not meant as an interactive workspace. If that's prefered use the Piral Local Feed Service.

#### Versions
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| sample-pilet-service              | 1.8.0-pre.20240917.2           |


### Piral Local Feed Service
In addition to those versions, the iham/piral-local-feed-service has the Piral CLI installed which extends the CLI with the "local-feed" command.

#### Versions
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Piral CLI                         | 1.6.1                          |
| sample-pilet-service              | 1.8.3                          |
| piral-cli-local-feed              | 0.4.0                          |


### API KEY for Pilet Feed Service(s)
The default API KEYs for pushing pilets to the feed service(s) is stored as a Docker Secret by using these files:
- secrets/piral-local-feed-service-api-keys.txt
- secrets/piral-sample-feed-service-api-keys.txt


## Pirals Instance
The Piral Instance is an app shell connecting to the Feed Service.
That app shell can be created by using the Piral CLI in the workspace.
After building the app shell (emulated) this can be run in a Node Docker Container.

### Versions
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Operating System                  | Alpine 3.20                    |
| Node                              | 22.9.0 (Current Release)       |
| Node Package Manager (npm)        | 1.8.3                          |


## Structuring the workspace
Using Docker compose to build the setup for working with multiple microfrontend instances and a composition server.


## Todos
- [ ] Add Logger to Docker Containers (like fluentd)
        (piral adds logs to /root/.npm/_logs/)