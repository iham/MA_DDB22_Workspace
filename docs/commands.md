# -------------------------------------------------------------------------------------------
# PIRAL CLI COMMANDS
# -------------------------------------------------------------------------------------------

# options
# --help - Show help
# --version - Show version number


# -------------------------------------------------------------------------------------------
# build | bundle
# Creates a production build for a Piral instance.


# -------------------------------------------------------------------------------------------
# declaration | declare
# Creates the TypeScript declaration file (index.d.ts) for a Piral instance.


# -------------------------------------------------------------------------------------------
# debug | watch [source]
# Starts the debugging process for a Piral instance.
# [source] - Sets the source Piral instance path for collecting all the information. [string] [default: "./"]

# -- base
# Sets the base directory. By default the current directory is used.
# [string] [default: "/piral-instance"]
BASE=

# -- bundler
# Sets the bundler to use.
# [choices: "webpack5"] [default: "webpack5"]
BUNDLER=

# -- config
# Sets configuration file for modifying the Webpack configuration.
# [string] [default: "webpack.config.js"]
CONFIG=

# -- feed
# Sets the URL of a pilet feed for including remote pilets.
# [string]
FEED=

# -- hmr
# Activates Hot Module Reloading (HMR).
# [boolean] [default: true]
HMR=

# -- hmr-port
# Sets the port to be used for HMR for reloading the application.                                      
# [number]
HMR-PORT=

# -- krasrc
# Sets a config file for overwriting the default kras options.
# [string]
KRASRC=

# -- log-level
# Sets the log level to use (1-5).
# [number] [default: 3]
LOG-LEVEL=

# -- open
# Opens the Piral instance directly in the browser.
# [boolean] [default: false]
OPEN=

# -- optimize-modules
# Also includes the node modules for target transpilation.
# [boolean] [default: false]
OPTIMIZE-MODULES=

# -- port
# Sets the port of the local development server.
# [number] [default: 1234]
PORT=

# -- public-url
# Sets the public URL (path) of the bundle.
# [string] [default: "/"]
PUBLIC-URL=

# -- strict-port
# Forces the defined port to be used or exists with an error.
# [boolean] [default: false]
STRICT-PORT=

# -- target
# Sets the target directory or file of bundling.
# [string] [default: "./dist"]
TARGET=


# -------------------------------------------------------------------------------------------
# new | create | scaffold | setup
# Creates a new Piral instance by adding all files and changes to the current project.
# -------------------------------------------------------------------------------------------


# run-emulator | start-emulator
# Starts a Piral instance emulator.


# -------------------------------------------------------------------------------------------
# publish | release
# Publishes Piral instance build artifacts.


# -------------------------------------------------------------------------------------------
# upgrade
# Upgrades the Piral instance to the latest version of the used Piral packages.


# -------------------------------------------------------------------------------------------
# validate | verify | check
# Checks the validity of the current project as a Piral instance.



# -------------------------------------------------------------------------------------------
# PILET CLI COMMANDS
# -------------------------------------------------------------------------------------------

# options
# --help - Show help
# --version - Show version number

# -------------------------------------------------------------------------------------------
# add-piral-instance | add-shell | install-shell | add-app | with-app <app>
# Adds another Piral instance to the available apps hosting the current pilet.


# -------------------------------------------------------------------------------------------
# build | bundle
# Creates a production build for a pilet.


# -------------------------------------------------------------------------------------------
# debug | watch
# Starts the debugging process for a pilet using a Piral instance.


# -------------------------------------------------------------------------------------------
# declaration | declare
# Creates the TypeScript declaration file (index.d.ts) for a pilet.                   


# -------------------------------------------------------------------------------------------
# new | create | scaffold
# Scaffolds a new pilet for a specified Piral instance.          


# -------------------------------------------------------------------------------------------
# pack | package
# Creates a pilet package that can be published.


# -------------------------------------------------------------------------------------------
# publish | post
# Publishes a pilet package to a pilet feed.                


# -------------------------------------------------------------------------------------------
# remove-piral-instance | remove-shell | uninstall-shell | remove-app | without-app <app>
# Removes an existing Piral instance from the available apps hosting the current pilet.


# -------------------------------------------------------------------------------------------
# upgrade
# Upgrades an existing pilet to the latest version of the used Piral instance.


# -------------------------------------------------------------------------------------------
# validate | verify | check | lint | assert
# Checks the validity of the current pilet according to the rules defined by the Piral instance.





