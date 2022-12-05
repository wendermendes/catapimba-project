# STACK DE MONITORAMENTO

Toda a infraestrutura será provisionada na AWS para suportar aplicação do Zabbix e Grafana conteinerizadas.

### **Escopo**:

- O codigo sera veriosnado no Github
- Utilizaremos o AWS CLI apenas para autenticar no provider.
- Será utilizado o Terraform para provisionamento da infraestrutura de rede, instância EC2, Zabbix e Grafana.
- A infraestrutura na AWS disponibilizará um Elastic IP público para as aplicações.

### **Disciplinas envolvidas:**

Para esse projeto foram utilizadas 04 áreas de conhecimento aprendidos durante a MBA, sendo elas; Provider (AWS), IaC (Terraform), Conteinerização (Docker) e Versionamento (Github).

### **Tarefas:**

- Criar o seguinte repositório no Github: **[bootcamp-impacta](https://github.com/wendermendes/bootcamp-impacta.git)**

**[https://github.com/wendermendes/bootcamp-impacta.git](https://github.com/wendermendes/bootcamp-impacta.git)**

- Provisionar na AWS a infraestrutura como código com Terraform:

**Network.tf** com as seguintes características:

1. VPC na CIDR **172.16.0.0/16**
2. Utilizar zona de disponibilidade **us-east-1a**
3. Criar subnet publica **172.16.1.0/24**
4. Criar subnet privada **172.16.2.0/24**

**Main.tf** com as seguintes características:

1. Data para trazer valor da AMI Ubuntu na AWS
2. Módulo para criação de Security Group liberando acesso para ips de entrada na aplicação.
3. Instância EC2 t2.micro com chave keyname e instance profile setado,
4. Apontamento para arquivo de User Data
5. Elastic IP
6. Output com a saída do Elastic IP

### **Execução:**

- Clonar o seguinte repositório:

[https://github.com/wendermendes/bootcamp-impacta.git](https://github.com/wendermendes/bootcamp-impacta.git)

- Aplicar as credenciais no arquivo credentials do aws cli
- Executar o Terraform init, plan e apply
- O provisionamento acontecerá na seguinte sequência:
    - 1. Infraestrutura de rede, vpc, subnet, security group
    - 2. Instancia EC2,
    - Dependências, aplicação do Docker, Containers do Banco, Zabbix e Grafana
    - Elastic IP
    - Output com IP publico
    - Será exibido um output com o ip da aplicação.
