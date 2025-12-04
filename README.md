# 📱 PokedexUI

Um aplicativo iOS desenvolvido com SwiftUI e estruturado com Clean Architecture, oferecendo uma UI moderna e uma arquitetura escalável para estudos e boas práticas no ecossistema Apple.

## 🚀 Sobre o Projeto

O PokedexUI é uma Pokédex construída com foco em arquitetura limpa, separação de camadas e boas práticas de desenvolvimento iOS.
O objetivo do projeto é demonstrar como criar uma aplicação modular, testável e de fácil manutenção, utilizando:

SwiftUI

Async/Await

MVVM na camada de apresentação

## 🧱 Arquitetura (Clean Architecture)

O projeto é organizado em três principais camadas:

- 📂 Presentation

Responsável por tudo relacionado à interface e lógica de apresentação:

View

ViewModel

Comunicação reativa com os casos de uso

- 📂 Domain

A camada mais pura da aplicação:

Entity

UseCases

Protocolos dos repositórios

- 📂 Data

Onde ocorrem as implementações concretas:

DTO

Datasource (Remote/Local)

Mappers (DTO → Entity)

Essa divisão promove:

- Alta testabilidade

- Baixo acoplamento

- Substituição fácil de datasources

- Independência do framework

## 🔧 Tecnologias Utilizadas

Swift 6

SwiftUI

Clean Architecture

MVVM

URLSession + Async/Await

Codable / DTO Mapping

## ✨ Principais Funcionalidades

Listagem de Pokémon com detalhes

Carregamento dinâmico da API

UI responsiva

Camadas isoladas e organizadas

Mapeamento DTO → Entidade de domínio

## 🛠 Como Executar

Clone o repositório:

```bash
git clone https://github.com/brenomarq/PokedexUI.git
```


Abra o projeto no Xcode:

```bash
open PokedexUI.xcodeproj
```

Execute no simulador ou dispositivo.

## 🤝 Contribuição

Contribuições são sempre bem-vindas!
Sinta-se livre para abrir issues, sugerir melhorias ou enviar pull requests.
