# WARNING !!!
bit is an overengineered pile of ...
almost eny documentation is missleading or plain wrong and outdated as the images "provided" by them are.
The naming schema of tools is close to but not the same as the underlying technology bit adapts.
(eg. source versioning is done with bit not git, branches are lanes, but tags are tags)

the docs also don't show what stack is the current way to go, so one ends up digging through source code in order to make or differences between concepts and implementations.
(eg. "app" vs "platform" vs "harmony platform")

finally nail in the coffin: the docs use names completely randomized, so one ends up with a mixed bag of terminology not showing its differences again.

This happens, when fast moving code and marketing don't take a look back and try to update docs according to recent changes (even with automated testing).



# MA_DDB22_WORKSPACE
This is the main sandbox for my Master Thesis Proof of Concept.

## Versions of Development Environment
| Name                       | Version                         |
|-------------------------   |-----------------------------    |
| Operating System           | MacOs Sonoma - 14.6.1 (23G93)   |
| Docker Desktop             | 4.34.2 (167172)                 |
| Docker Engine              | 27.2.0                          |
| Docker Compose             | 2.29.2-desktop.2                |
| Git                        | 2.43.0                          |
| Virtual Studio (VS) Code   | 1.92.3                          |

## Structuring the workspace
Using Docker compose to build the setup for working with bits scope servers and workspaces.

## Todos
- [ ] Add Logger to Docker Containers (like fluentd)