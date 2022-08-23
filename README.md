# Resumo da aplicação <h1>

A aplicação foi desenvolvida para cumprir o desafio da 7ª semana do curso de Flutter da Raro Academy e tinha o propósito de treinar
os conceitos estudados até o momento, envolvendo alguns tópicos que serão especificados abaixo.
O objetivo do aplicativo é gerenciar notas de lembrete para que o usuário possa guardar suas ideias para depois e possibilita que o
usuário salve, visualize e apague as notas salvas.

### Armazenamento local <h3>

Para gerenciar o armazenamento local, foi utilizado o plugin do shared_preferences que possibilita o armazenamento para projetos sem
grande complexidade e dados simples que não necessitam de tratamento de segurança. Com esse plugin é possível armazenar e manipular
as informações das notas cadastradas pelo usuário.

### Arquitetura <h3>

Para a organização da estrutura do projeto, foi utilizado o padrão MVC, que facilita a comunicação entre as camadas envolvidas, designando
Responsabilidades separadas para cada uma. A escolha de uma arquitetura consistente auxilia a mantenabilidade do código.
A escolha desse padrão foi pelo melhor entendimento do seu funcionamento e maior confortabilidade em aplicar sua estrutura no meu código.

### Uso do Modular <h3>

Foi utilizado o modular para todo o fluxo de navegação das páginas da aplicação e também para auxiliar na injeção de dependências,
promovendo o desacoplamento das classes da aplicação e permitindo que as classes dependam das abstrações.

### Gerência de estado <h3>

Para executar as atualizações da tela que mostra as notas cadastradas pelo usuário, foi utilizado o notificador setState. Essa opção não
É a mais adequada em se tratando de performance das aplicações, no entanto, a complexidade do projeto não era muito grande e as limitações
de tempo e a segurança para utilizar essa ferramenta foram os motivos que me fizeram optar por esse notificador.

### **Observação** <h3>

O método de "deletar" notas cadastradas no armazenamento local foi implementado através de um "alert dialog" que questiona se o usuário
tem certeza que quer apagar tal informação. Após o clique em ok, é realizada a deleção, a lista de objetos é atualizada e a tela é renderizada.