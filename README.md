# MA_DDB22_WORKSPACE
This is the main sandbox for my Master Thesis Proof of Concept.

## Versions of Local Development Environment
| Name                       | Version                        |
|-------------------------   |-----------------------------   |
| Operating System           | MacOs Sequoa - 15.0            |
| Docker Desktop             | 4.34.2 (167172)                |
| Docker Engine              | 27.2.0                         |
| Docker Compose             | 2.29.2-desktop.2               |
| Git                        | 2.43.0                         |
| Virtual Studio (VS) Code   | 1.93.1                         |

## Versions of Workspace Environment
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
The workspace is used for
- development environment for piral (piral-workspace)
- development environment for pilets (pilets-workspace)

## Versions of Pirals Pilet Feed Service
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Operating System                  | Alpine 3.20                    |
| Node                              | 22.9.0 (Current Release)       |
| Node Package Manager (npm)        | 1.8.3                          |
| Piral CLI                         | 1.6.1                          |

### API KEY for Pilet Feed Service
The default API KEY for pushing pilets to the feed service is stored as a Docker Secret in secrets/piral-local-feed-service-api-key.txt

### Usage
There are two sample feed services implemented
- https://github.com/FlorianRappl/piral-cli-local-feed/tree/main (docker-images/piral-local-feed-service)
- https://github.com/smapiot/sample-pilet-service (docker-images/piral-sample-feed-service)


## Versions of Pirals Instance
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Operating System                  | Alpine 3.20                    |
| Node                              | 22.9.0 (Current Release)       |
| Node Package Manager (npm)        | 1.8.3                          |
| Piral CLI                         | 1.6.1                          |

## Structuring the workspace
Using Docker compose to build the setup for working with multiple microfrontend instances and a composition server.


## Todos
- [ ] Add Logger to Docker Containers (like fluentd)
        (piral adds logs to /root/.npm/_logs/)