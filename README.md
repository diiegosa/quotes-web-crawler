<h1 align="center">Quotes Web Crawler</h1>
<p align="justify">O projeto em questão é um web crawler desenvolvido em Ruby on Rails. A API tem a finalidade de carregar os dados da primeira página do site: <a href="http://quotes.toscrape.com">quotes.toscrape.com </a>, salvar em um banco de dados não relacional baseado em documentos, a saber, MongoDB, e disponibilizar esses dados para acesso.</p> 
<hr />

<h3 align="center">Que dados são esses?</h3> 
<p align="justify">Podemos dividir esses dados em três categorias: Autores, Citações e Tags. Eles foram estruturados levando em consideração as características peculiares aos bancos de dados noSQL e com o objetivo de otimizar a consulta, portanto a modelagem dos dados seguiu a seguinte ideia: Autores representam uma coleção, Citações representam outra coleção que guarda a referência dos Autores e as Tags representam uma coleção que guarda as referências das Citações. Dessa maneira, a consulta pela Tag ganha agilidade. É bem verdade que essa estratégia perde um pouco na 'normalização' e tem algum custo no momento do insert, mas esse é um trade-off que vale a pena, afinal, a quantidade de requisições realizando buscas é muito maior do que o insert (que inclusive pode ser feito em um momento em que haja pouco acesso ao sistema) e a perda na 'normalização' é encarada com naturalidade pela abordagem e natureza não relacional do banco de dados.</p>

<h3 align="center">Quais as funcionalidades?</h3>  

- [X] Cadastro de usuário com email e password para gerar o token que dará acesso as demais requisiçõs.
- [X] Recuperação do token de acesso, informando o email e o password.
- [X] Acionamento do web crawler, para que as informações do site sejam salvas no banco de dados.
- [X] Busca pelas citações a partir de alguma Tag.

<h3 align="center">Endpoints</h3>  
<blockquote>
  <h4>Usuário</h4>
  <small>O usuário precisa ser criado para que o token de acesso seja gerado. Só com ele é possível consumir a API. Se o token for esquecido será necessário fazer o login para acessá-lo.</small>
  <hr />
  <h5>Criar usuário</h5>
  <table>
    <tr>
      <th>Método</th>
      <th>Rota</th>
      <th>Body</th>
      <th>Retorno</th>
    </tr>
  <tr>
    <td>POST</td>
    <td>localhost:3000/api/v1/sign_up</td>
    <td>

        {
          "user": {
            "email":"diiegosa@gmail.com",
            "password":"password",
            "password_confirmation":"password"
          }
        }
  </td>
    <td>

        {
          "messages": "Sign Up Successfully",
          "is_success": true,
          "data": {
            "user": {
              "_id": {
                "$oid": "5f3615d74421b241472afb47"
              },
              "authentication_token": "rUAWr7Gsxmxfgxr9ovRy",
              "email": "diiegosa@gmail.com"
            }
          }
        } 
  </td>
  </tr>
</table>
  <hr />
  <h5>Login</h5>
  <table>
    <tr>
      <th>Método</th>
      <th>Rota</th>
      <th>Body</th>
      <th>Retorno</th>
    </tr>
  <tr>
    <td>POST</td>
    <td>http://localhost:3000/api/v1/sign_in</td>
    <td>

        {
          "user": {
            "email":"diiegosa@example.com",
            "password":"password"
          }
        }
  </td>
    <td>

        {
          "messages": "Signed In Successfully",
          "is_success": true,
          "data": {
            "user": {
              "_id": {
                "$oid": "5f36082b4421b22a8d1dbbd6"
              },
              "authentication_token": "rhTFi3PayyKUuHDd2W-H",
              "email": "diiegosa@example.com"
            }
          }
        }
  </td>
  </tr>
</table>
</blockquote>

<blockquote>
  <h4>Acionar Web Crawler</h4>
  <small>Quando a requisição é realizada, o web crawler consome as informações da primeira página do site <a href="http://quotes.toscrape.com">quotes</a> e salva no banco de dados MongoDB. É necessário enviar no header as crendenciais do usuário (email e token).</small>
  <table>
    <tr>
      <th>Método</th>
      <th>Rota</th>
      <th>Header</th>
      <th>Retorno</th>
    </tr>
  <tr>
    <td>GET</td>
    <td>localhost:3000/api/v1/crawler</td>
    <td>
    Precisa possuir duas variáveis, o email do usuário e o token de acesso:
    
    X-User-Email: diiegosa@example.com
    
    X-User-Token: rUAWr7Gsxmxfgxr9ovRy
  </td>
    <td>

        {
          "status": 200,
          "message": "DATA SAVED SUCCESSFULLY"
        } 
  </td>
  </tr>
</table>
</blockquote>

<blockquote>
  <h4>Buscar citações a partir de uma Tag</h4>
  <small>A requisição necessita que o header possua as crendenciais do usuário (email e token) e que uma Tag seja passada por parâmetro. Dessa maneira o retorno conterá todas as citações relacionadas a Tag.</small>
  <table>
    <tr>
      <th>Método</th>
      <th>Rota</th>
      <th>Header</th>
      <th>Retorno</th>
    </tr>
  <tr>
    <td>GET</td>
    <td>localhost:3000/api/v1/quotes/life</td>
    <td>
    Precisa possuir duas variáveis, o email do usuário e o token de acesso:
    
    X-User-Email: diiegosa@example.com
    
    X-User-Token: rUAWr7Gsxmxfgxr9ovRy
  </td>
    <td>

        {
          "quotes": [
            {
              "text": "“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”",
              "author": "Albert Einstein",
              "author_about": "http://quotes.toscrape.com/author/Albert-Einstein",
              "tags": [
                "inspirational",
                "life",
                "live",
                "miracle",
                "miracles"
              ]
            },
            {
              "text": "“It is better to be hated for what you are than to be loved for what you are not.”",
              "author": "André Gide",
              "author_about": "http://quotes.toscrape.com/author/Andre-Gide",
              "tags": [
                "life",
                "love"
              ]
            }
          ]
        }
  </td>
  </tr>
</table>
</blockquote>


<h3 align="center">Linguagens e libs utilizadas</h3>  


- [Ruby on Rails](https://rubyonrails.org/): Framework base para criação da API.
- [gem 'nokogiri'](https://rubygems.org/gems/nokogiri/versions/1.6.8?locale=pt-BR): Lib usada na construção do crawler para carregar os dados do HTML.
- [gem 'mongoid'](https://rubygems.org/gems/mongoid/versions/5.1.3?locale=pt-BR): Solução para a interação entre o Rails e o MongoDB.
- [gem 'jbuilder'](https://rubygems.org/gems/jbuilder/versions/2.7.0): Usada para formatar o JSON, resultado da pesquisa por citações a partir de uma Tag.
- [gem 'devise'](https://rubygems.org/gems/devise/versions/4.2.0?locale=pt-BR): Solução para a autenticação.
- [gem 'simple_token_authentication'](https://rubygems.org/gems/simple_token_authentication/versions/1.15.1): Gerencia a autenticação por token. Integrada ao devise.
- [gem 'rack-cors'](https://rubygems.org/gems/rack-cors/versions/0.4.0?locale=pt-BR): Middleware para configurações de segurança relacionadas à origem das requisições e ao compartilhamento dos recursos.
- [gem 'rack-attack'](https://rubygems.org/gems/rack-attack/versions/5.0.1?locale=pt-BR): Middleware para configurações de segurança relacionadas às requisições abusivas.
