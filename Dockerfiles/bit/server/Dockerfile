# iham/bit-base is a custom node based image.
# It uses debian 12.7 (bookworm) as os.
# All bit releated node modules (BVM and BIT) are installed.
FROM iham/bit-base:latest

USER root
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Running the Scope as a non-root User.
USER node

# Creating the folder structure and initiating a bare bit scope.
WORKDIR /bit-scope
RUN bit init --bare

# The scope name is normaly determined by the folder it initiated in.
# In order to keep that structure, but still get a better naming for each scope,
# an environment variable is introduced which replaces the default configured name.

EXPOSE 3000

ENV SCOPE_NAME="bit-scope"
ENTRYPOINT ["/usr/bin/entrypoint.sh", "start"]
