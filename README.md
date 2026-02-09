# 🛡️ AI Financial Assistant

> Um aplicativo Flutter de alta performance para análise de mensagens financeiras, projetado com **Inteligência Híbrida**, **Offline-First** e **Segurança em Primeiro Lugar**.

### 🔗 [Acesse a Versão Web (Demo)](https://mateuss-silva.github.io/ai_assistant/)

---

## 🚀 Sobre o Projeto

Este projeto demonstra a implementação de um assistente de segurança que detecta SMS/Emails suspeitos (phishing, fraudes). O diferencial técnico reside na sua **Arquitetura Híbrida**: a análise é feita localmente no dispositivo (Mobile Offline) para máxima privacidade, recorrendo ao **Google Gemini 2.5 Flash** na nuvem apenas para casos complexos ou na versão Web.

## 🧠 Inteligência Híbrida & IA

- **Offline-First (Android)**: Utiliza `TensorFlow Lite` (TFLite) para inferência local. O modelo foi treinado via script Python customizado (`scripts/train_model.py`) utilizando Keras e exportado para suportar pré-processamento de texto diretamente no dispositivo.
- **Deep Analysis (Web & Cloud)**: Integração robusta com **Google Gemini 2.5 Flash**, fornecendo insights detalhados sobre sentimentos e intenções maliciosas.

---

## 🛠️ Arquitetura & Boas Práticas

O projeto é um showcase de engenharia de software moderna, seguindo padrões rigorosos de **Clean Architecture** e **SOLID**.

- **Responsividade Consciente**: UI adaptável que garante uma experiência premium em Mobile e Web, com constraints de largura inteligentes para telas grandes.
- **Gerenciamento de Estado**: Uso avançado de **Riverpod** para um fluxo de dados reativo e testável.
- **Sanitização de Dados**: `LogService` customizado que remove automaticamente PII (Personal Identifiable Information).

---

## ⚙️ CI/CD & DevSecOps (Destaque Técnico)

Para este portfólio, foi implementada uma pipeline de **Deploy Automatizado** profissional que reflete práticas reais de mercado:

- **Segurança de Segredos**: A `GEMINI_API_KEY` nunca é exposta no código-fonte. Ela é gerenciada via **GitHub Secrets** e injetada dinamicamente no arquivo `.env` apenas durante o build time no GitHub Actions.
- **Automação Baseada em Intenção**: O deploy para **GitHub Pages** é disparado de forma inteligente apenas quando os commits seguem a convenção `feat:`, `fix:` ou `feature:`.
- **Estratégia de Branching**: Fluxo de trabalho estruturado na branch `master` com deploy isolado para `gh-pages`.

---

## 📸 Screenshots

|                      Tela Inicial                       |                       Processando                       |                   Resultado da Análise                    |
| :-----------------------------------------------------: | :-----------------------------------------------------: | :-------------------------------------------------------: |
| <img src="screenshots/Screenshot_idle.png" width="250"> | <img src="screenshots/Screenshot_load.png" width="250"> | <img src="screenshots/Screenshot_result.png" width="250"> |

---

## 🚦 Como Executar Localmente

### Pré-requisitos

- Flutter SDK 3.x
- Configuração do `.env` (use o `.env.example` como base)

```bash
# Debug padrão
flutter run

# Executar todos os testes (Unitários + Widget)
flutter test
```

---

## 👨‍💻 Autor

Desenvolvido com foco em **segurança**, **performance** e **escalabilidade**. Este projeto é uma prova técnica de competência em desenvolvimento Mobile e Web com Flutter.

---
