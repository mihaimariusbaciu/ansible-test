FROM hugojosefson/popos
WORKDIR /usr/local/bin


RUN apt-get install ansible -y
RUN apt update 
RUN apt install -y software-properties-common 
RUN apt-add-repository -y ppa:ansible/ansible 
RUN apt-add-repository -y ppa:neovim-ppa/unstable 
RUN apt update 
RUN apt install -y curl git ansible build-essential neovim

COPY . .

RUN ansible-playbook -t install local.yml

CMD ["sh", "-c", "node --version "]
