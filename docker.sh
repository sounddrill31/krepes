sudo apt update -y ; sudo apt upgrade -y ; sudo apt install docker docker.io ca-certificates curl gnupg -y

mkdir rom ; cd rom ; wget https://raw.githubusercontent.com/Frostleaft07/krepes/refs/heads/main/Dockerfile
docker build .
