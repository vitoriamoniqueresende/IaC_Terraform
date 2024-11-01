Automação de  Infraestrutura AWS com Terraform

Visão Geral
Este projeto utiliza Terraform para automatizar a criação e gerenciamento da infraestrutura na AWS, facilitando a escalabilidade e o controle através de infraestrutura como código (IaC). A implementação é ideal para sistemas que requerem processamento em tempo real e uma estrutura robusta para suportar o uso intensivo de visão computacional e feedback auditivo.


Problema
Pessoas com deficiência visual enfrentam desafios significativos na navegação em ambientes internos e externos, o que pode comprometer sua segurança e independência. Embora existam algumas soluções tecnológicas, ainda há uma lacuna em ferramentas adaptáveis e de baixo custo que possam auxiliar na mobilidade dessas pessoas. Esse projeto busca fornecer um sistema de navegação acessível, que permita maior autonomia e segurança, aproveitando tecnologias de visão computacional e machine learning.

Solução
Este sistema utiliza um dispositivo com câmera para capturar imagens em tempo real e identificar objetos e pessoas ao redor do usuário. Através de tecnologias de IA e visão computacional, o sistema consegue estimar a profundidade dos objetos, ajudando a calcular a proximidade de obstáculos e emitir alertas sonoros quando necessário. Este feedback auditivo auxilia usuários com deficiência visual a navegar com segurança em diversos ambientes.

Objetivos do Sistema
Captura e Processamento de Imagens: Utilizar a câmera do dispositivo para capturar e processar imagens em tempo real.
Detecção de Obstáculos: Usar o modelo Midas para estimar profundidade e identificar a proximidade de objetos e pessoas.
Feedback Auditivo: Fornecer alertas sonoros por meio das bibliotecas Librosa e Sounddevice para ajudar na navegação.
Escalabilidade e Confiabilidade: Com o uso do Application Load Balancer e das instâncias EC2, o sistema pode lidar com até 50 usuários simultâneos, proporcionando alta disponibilidade e desempenho estável.
Armazenamento Seguro: O Amazon S3 é utilizado para armazenar logs de processamento, assegurando segurança e rastreabilidade.

Computação Distribuída e Visão Computacional
EC2 Instances: A infraestrutura conta com instâncias EC2 para hospedar o backend do sistema e realizar o processamento da visão computacional. Foi selecionada a instância c5.xlarge para suportar até 50 usuários simultâneos.
Balanceamento de Carga: O Application Load Balancer gerencia o tráfego HTTP/HTTPS para as instâncias EC2, distribuindo as requisições de maneira eficiente.
Bucket S3: Armazena logs de processamento de imagem e facilita a rastreabilidade das atividades do sistema.

Arquitetura e Componentes Técnicos
AWS e Infraestrutura
Terraform: Utilizado para provisionar e gerenciar a infraestrutura AWS com uma abordagem de infraestrutura como código (IaC).

EC2 Instances: Hospedam o backend do sistema e processam a visão computacional com instâncias otimizadas, como a c5.xlarge.
Application Load Balancer: Distribui o tráfego entre as instâncias EC2 para balancear a carga e garantir disponibilidade.

Bucket S3: Armazena logs de processamento de imagem e facilita o monitoramento das atividades do sistema.

Tecnologias de Processamento e Feedback
OpenCV: Captura e processa imagens para identificar objetos e movimentos.
PyTorch e MIDAS: Implementa o modelo Midas para estimativa de profundidade, necessário para calcular a proximidade de obstáculos.
Librosa e Sounddevice: Manipulam e reproduzem o feedback auditivo em tempo real, alertando o usuário sobre objetos próximos.

Tecnologias e Bibliotecas
OpenCV: Para captura e processamento de imagens em tempo real.
PyTorch e MIDAS: Implementação do modelo Midas para estimativa de profundidade, crucial para a detecção de obstáculos.
Librosa e Sounddevice: Para manipulação de áudio e feedback sonoro em tempo real.


Requisitos
Terraform >= 1.0.0
AWS CLI: Configurada com credenciais que possuem permissões para provisionar os recursos necessários.
Conta AWS: Para provisionamento dos recursos.
