# STACK DE MONITORAMENTO

Toda a infraestrutura será provisionada na AWS para suportar aplicação do Zabbix e Grafana conteinerizadas.

### **Escopo**:

- Será utilizado o Github onde será versionado o código
- Utilizaremos o AWS CLI apenas para autenticar no provider.
- Será utilizado o Terraform para provisionamento da infraestrutura de rede, instância, instalação das aplicações, Docker, GLPI e Grafana.
- A infraestrutura na AWS disponibilizará um Elastic IP público para as aplicações.

### **Disciplinas envolvidas:**

Para esse projeto foram utilizadas 04 áreas de conhecimento aprendidos durante a MBA, sendo elas; Provider (AWS), IaC (Terraform), Conteinerização (Docker) e Versionamento (Github).

### **Tarefas:**

- Criar o seguinte repositório no Github: **[bootcamp-impacta-2022](https://github.com/italoleitecg/bootcamp-impacta-2022)**

**[git@github.com:italoleitecg/bootcamp-impacta-2022.git](https://github.com/italoleitecg/bootcamp-impacta-2022)**

- Provisionar na AWS a infraestrutura como código com Terraform:

**Network.tf** com as seguintes características:

1. VPC na CIDR **10.0.0.0/16** com name: **bootcamp-vpc**
2. Utilizar zona de disponibilidade **us-east-1a**
3. Criar subnet publica **10.0.101.0/24**
4. tag name **bootcamp-vpc**

**Main.tf** com as seguintes características:

1. Data para trazer valor da AMI Ubuntu na AWS
2. Módulo para criação de Security Group liberando acesso para ips de entrada na aplicação.
3. Instância EC2 t2.micro com chave keyname e instance profile setado,
4. Apontamento para arquivo de User Data
5. Elastic IP
6. Output com a saída do Elastic IP

### **Execução:**

- Clonar o seguinte repositório:

[https://github.com/italoleitecg/bootcamp-impacta-2022](https://github.com/italoleitecg/bootcamp-impacta-2022)

- Aplicar as credenciais no arquivo credentials do aws cli
- Executar o Terraform init, plan e apply
- O provisionamento acontecerá na seguinte sequência:
    - 1. Infraestrutura de rede, vpc, subnet, security group
    - 2. Instancia EC2,
    - Dependências, aplicação do Docker, Container de Banco, Contêiner do Glpi, Contêiner do Grafana
    - Elastic IP
    - Output com IP publico
    - Será exibido um output com o ip da aplicação.
