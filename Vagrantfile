Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
#Nat de portas da aplicacao#
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 4443

# Chave ssh"

  config.ssh.insert_key = false
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

  config.vm.provision "shell", inline: <<-EOC
    sudo sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
    sudo systemctl restart sshd.service
    echo "finished"
  EOC

#Configura repositorio oficial docker
  config.vm.provision :shell, path: "docker-repo.sh"

# Executar playbook do ansible

    config.vm.provision :guest_ansible do |guest_ansible|
        guest_ansible.playbook = "./ansible/main.yml"
        guest_ansible.sudo = false
        guest_ansible.verbose = true
        guest_ansible.limit   = "all"
        guest_ansible.inventory_path = "ansible_hosts"
    end
end
