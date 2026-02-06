# 🛡️ AI Financial Assistant

> Um aplicativo Flutter de alta segurança para análise de mensagens financeiras, projetado com **Offline-First** e **Privacy-by-Design**.

![App Mockup](screenshots/analysis_screen_mockup.png)

## 🚀 Sobre o Projeto

Este projeto demonstra uma implementação robusta de um assistente de segurança que analisa SMS/Emails suspeitos (phishing, fraudes bancárias). O diferencial técnico é a **Inteligência Híbrida**: a análise ocorre localmente no dispositivo (via Platform Channels simulação) para proteger os dados do usuário, recorrendo à nuvem apenas em casos extremos e com consentimento explícito.

---

## 🛠️ Tech Stack & Arquitetura

O projeto segue estritamente os princípios de **Clean Architecture** e **SOLID**.

### 🏗️ Arquitetura (Clean Arch)

- **Domain Layer**: Entidades puras (`MessageAnalysis`), Value Objects (`MessageText`) e UseCases (`AnalyzeMessage`). Sem dependências de framework.
- **Data Layer**: Repositories (`MessageAnalyzerRepositoryImpl`) com estratégia _Offline-First_.
- **Presentation Layer**: _MVVM_ com **Riverpod** para gerenciamento de estado reativo.

### 🔌 Integração Nativa (MethodChannels)

Comunicação bidirecional otimizada entre Flutter e código nativo:

- **Android**: `Kotlin` com Coroutines e StateFlow.
- **iOS**: `Swift` com Combine Framework.
- **Protocolo**: `MethodChannel` para comandos e `EventChannel` para streaming de eventos realtime.

---

## 🔒 Segurança & Privacidade

Features de segurança implementadas seguindo as melhores práticas OWASP MASVS:

1.  **Sanitização de Logs**: `LogService` customizado que remove automaticamente PII (Personal Identifiable Information) e só roda em `kDebugMode`.
2.  **Gerenciamento de Segredos**: API Keys e URLs sensíveis injetadas via `.env` (flutter_dotenv), nunca hardcoded.
3.  **Minimização de Dados**: A análise primária é local. Dados só saem do dispositivo se o usuário confirmar o envio para "Análise em Nuvem".

---

## 🧪 Estratégia de Testes

Cobertura abrangente garantindo confiabilidade crítica:

| Tipo           | Cobertura                                          | Ferramentas                                      |
| -------------- | -------------------------------------------------- | ------------------------------------------------ |
| **Unitários**  | Regras de negócio, Value Objects, Mappers          | `mocktail`, `test`                               |
| **Widget**     | Todos os estados visuais (Loading, Error, Success) | `flutter_test`, `Finder`                         |
| **Integração** | Fluxo E2E interceptando canais nativos             | `integration_test`, `TestDefaultBinaryMessenger` |

> **Destaque**: O teste de integração simula o comportamento do código nativo (Kotlin/Swift) permitindo validação do fluxo completo mesmo em ambientes de CI sem emuladores.

---

## 📸 Screenshots

|                Análise de Risco                 |             Estado Seguro             |
| :---------------------------------------------: | :-----------------------------------: |
| ![Risco Crítico](screenshots/risk_critical.png) | ![Seguro](screenshots/safe_state.png) |

_(Adicione seus prints na pasta `screenshots`)_

---

## 🚦 Como Executar

### Pré-requisitos

- Flutter SDK 3.x
- Configuração do `.env`:
  ```bash
  cp .env.example .env
  ```

### Rodando o App

```bash
# Debug padrão
flutter run

# Debug específico Android (VS Code Launch Config configurada)
Selecione "ai_assistant (Emulator: 5554)" na aba Run & Debug
```

### Rodando os Testes

```bash
# Executar todos os testes
flutter test

# Executar teste de integração mockado
flutter test test/integration/app_flow_test.dart
```

---

## 👨‍💻 Autor

Desenvolvido para demonstrar excelência em engenharia de software mobile com Flutter.
