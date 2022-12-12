# STACK DE MONITORAMENTO

Toda a infraestrutura será provisionada na AWS para suportar aplicação do Zabbix e Grafana conteinerizadas.

### **Escopo**:

- O codigo sera veriosnado no Github
- Utilizaremos o AWS CLI apenas para autenticar no provider.
- Será utilizado o Terraform para provisionamento da infraestrutura de rede, instância EC2, Zabbix e Grafana.
- A infraestrutura na AWS disponibilizará um Elastic IP público para as aplicações.

**Main.tf** com as seguintes características:

1. Data para trazer valor da AMI Ubuntu na AWS
2. Módulo para criação de Security Group liberando acesso para ips de entrada na aplicação.
3. Instância EC2 t2.micro com chave keyname e instance profile setado,
4. Apontamento para arquivo de User Data
5. Elastic IP
6. Output com a saída do Elastic IP
