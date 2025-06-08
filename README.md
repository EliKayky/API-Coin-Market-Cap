# Cripto Ticker App 🪙

Projeto acadêmico desenvolvido para a disciplina de Programação para Dispositivos Móveis, Professor Ch do curso de Análise e Desenvolvimento de Sistemas da UniCesumar. O aplicativo exibe cotações de criptomoedas em tempo real, consultando a API da CoinMarketCap.

---

### Funcionalidades

- [x] **Listagem de Criptomoedas:** Exibe uma lista de moedas com nome, símbolo e cotação em USD e BRL.
- [x] **Dados Padrão:** Carrega uma lista pré-definida de criptomoedas ao iniciar.
- [x] **Pesquisa Múltipla:** Permite buscar por múltiplas moedas separando seus símbolos por vírgula (ex: `BTC,ETH,ADA`).
- [x] **Atualização (Pull-to-Refresh):** Puxe a lista para baixo para atualizar os dados.
- [x] **Detalhes da Moeda:** Toque em uma moeda para ver informações detalhadas como data de adição e cotações formatadas.
- [x] **Feedback Visual:** Exibe um indicador de carregamento durante a busca de dados.
- [x] **Design Minimalista:** Interface limpa e moderna com tema escuro.

---

### Arquitetura

O projeto foi estruturado utilizando a arquitetura **MVVM (Model-View-ViewModel)** para garantir uma clara separação de responsabilidades:

-   **Model:** Camada de dados, representa a entidade `CryptoCurrency`.
-   **View:** Camada de interface do usuário, responsável por exibir os dados e capturar interações.
-   **ViewModel:** Ponte entre a View e o Model, contendo a lógica de negócios e o gerenciamento de estado da aplicação.
-   **Repository/DataSource:** Camada responsável pela comunicação com a API externa.

---

### Tecnologias Utilizadas

-   **[Flutter](https://flutter.dev/)**
-   **[Dart](https://dart.dev/)**
-   **[Provider](https://pub.dev/packages/provider)** para gerenciamento de estado.
-   **[http](https://pub.dev/packages/http)** para realizar as chamadas à API.
-   **[intl](https://pub.dev/packages/intl)** para formatação de moedas.
-   **[CoinMarketCap API](https://coinmarketcap.com/api/)** como fonte de dados.

---

### Como Executar o Projeto

Siga os passos abaixo para rodar o projeto em sua máquina.

**Pré-requisitos:**
-   Ter o [Flutter](https://docs.flutter.dev/get-started/install) instalado.
-   Um emulador ou dispositivo físico para rodar o app.

**Passos:**

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git](https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git)
    cd NOME_DO_REPOSITORIO
    ```
q
2.  **Obtenha uma chave de API:**
    -   Acesse o site [CoinMarketCap API](https://coinmarketcap.com/api/) e crie uma conta no plano gratuito (Basic).
    -   Após o login, copie sua Chave de API (API Key) do seu [Dashboard](https://pro.coinmarketcap.com/account).

3.  **Insira a chave de API no projeto:**
    -   Navegue até o arquivo `lib/data/datasource/crypto_api_datasource.dart`.
    -   Substitua o valor da variável `_apiKey` pela sua chave:
        ```dart
        final String _apiKey = "COIN_API_KEY_AQUI"; **Coloque a sua API do CoinMarketCap APi no lugar 
        ```

4.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

5.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```

Pronto! O aplicativo deve iniciar em seu emulador ou dispositivo.

---

### Autor

Feito por **[ELI KAYKY ELIAS BALZANI]** 
