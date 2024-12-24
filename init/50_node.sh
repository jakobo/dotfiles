# Install pnpm and use it for managing node versions
# fewer moving parts this way
curl -fsSL https://get.pnpm.io/install.sh | sh -
pnpm env use --global lts
