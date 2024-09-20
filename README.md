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

## Versions of Pirals Pilet Feed Serivce
| Name                              | Version                        |
|--------------------------------   |-----------------------------   |
| Operating System                  | Alpine 3.20                    |
| Node                              | 22.9.0 (Current Release)       |
| Node Package Manager (npm)        | 1.8.3                          |
| Piral CLI                         | 1.6.1                          |

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