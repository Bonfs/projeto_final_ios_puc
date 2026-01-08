# Projeto Final iOS

O projeto se trata de um TODO list simples que salva os localmente utilizando o Core Data. No app também é possível autenticar o usuário através do Firebase Authenticator, sendo possível logar e criar conta.
Obs.: Eu fiz todo o desenvolvimento utilizando o simulator, não cheguei a testar em um device físico.

## Habilitando o Firebase Authenticator no simulator

É necessário rodar o seguinte comando na raiz do projeto:

`firebase emulators:start`

Sem esse comando, a parte de autenticação do aplicativo não funcionará no simulador
