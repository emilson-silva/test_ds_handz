# ds_handz

Design System Mobile em Flutter (teste) com tokens, temas e componentes.

## Objetivo

- Criar uma base reutilizavel para multiplos apps
- Suportar multimarcas com temas centralizados
- Evitar hardcodes nos componentes
- Demonstrar preocupacao com acessibilidade

## Estrutura

- lib/design_system/tokens: valores concretos (cores, espacamentos, raios)
- lib/design_system/theme: tema e extensao de tokens semanticos
- lib/design_system/components: componentes do DS
- lib/demo: tela simples de demo

## Separacao de tokens (regra de ouro)

- Tokens de valor: ficam em lib/design_system/tokens (ex.: cores hex, espacamentos numericos)
- Tokens semanticos: ficam em lib/design_system/theme (ex.: brandPrimary, textPrimary)
- Componentes nunca usam valores concretos direto, apenas tokens semanticos

## Marcas

O tema suporta duas marcas:

- DSBrand.more: paleta aproximada inspirada na Moresite
- DSBrand.moreAlt: variacao com tom frio

## Como usar

```dart
import 'package:flutter/material.dart';
import 'design_system/ds.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DSThemeData.light(DSBrand.more),
      home: const Scaffold(
        body: Center(
          child: DSButton(
            label: 'Continuar',
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
```

## Componentes

### DSButton

- Variantes: primary e secondary
- Estados: default, disabled, loading
- Animacao simples de press (scale)
- Semantics para leitura de tela

```dart
DSButton(
  label: 'Salvar',
  variant: DSButtonVariant.primary,
  isLoading: false,
  onPressed: () {},
)
```

### DSTextField

- Label, helper text e error text
- Estado de foco com cor dedicada
- Semantics com label e hint

```dart
DSTextField(
  label: 'Email',
  helperText: 'Digite seu email',
  errorText: 'Email invalido',
)
```

Nota: o componente usa Semantics para label e hint. Para leitores de tela, mantenha o label simples e direto.

### DSCard

- Variantes: filled e outlined
- Opcionalmente clicavel

```dart
DSCard(
	variant: DSCardVariant.outlined,
	onTap: () {},
	child: Text('Card simples'),
)
```

### DSBadge

- Variantes: neutral, success, warning, error, info
- Texto curto e contraste rapido

```dart
const DSBadge(
	label: 'Sucesso',
	variant: DSBadgeVariant.success,
)
```

### DSDivider

- Linha simples para separacao visual

```dart
const DSDivider()
```

## Acessibilidade
- Uso de Semantics em botoes e inputs
- Estados comunicados por texto e cor
- Contraste minimo aplicado no tema (aproximado; precisa validacao formal)

Checklist rapido:

- Label claro em todos os inputs
- Hint explicito quando houver ajuda
- Erro comunicado por texto e cor
- Estados de foco perceptiveis
- Testar com TalkBack ou VoiceOver

Validacao de contraste sugerida: WebAIM Contrast Checker

## Limitacoes

- Apenas tema claro (light)
- Tipografia usa fonte default do sistema
- Sem testes automatizados ainda

## Governanca e escalabilidade

- Adicao de novos tokens deve ocorrer primeiro em tokens/ e depois em theme/
- Alteracoes de tema devem manter compatibilidade de nomes semanticos
- Componentes novos devem expor APIs simples e previsiveis
- Mudancas visuais relevantes devem ser registradas em changelog


## Boas praticas

- Sempre use tokens e tema ao criar componentes
- Evite cores e espacamentos hardcoded
- Centralize novas decisoes visuais em tokens

## Escopo da vaga (referencia)

### Aptidoes Necessarias

- Experiencia solida em Flutter
- Dominio de Dart e arquitetura em Flutter
- Criacao de componentes reutilizaveis e bibliotecas internas
- Tokens, temas e estilizacao centralizada
- Acessibilidade (semantica, leitores de tela, navegacao assistiva)
- Estados, interacoes, animacoes e APIs claras
- Boa comunicacao com design e engenharia

### Aptidoes Desejaveis

- Experiencia com CI/CD para Flutter
- Versionamento semantico e changelog
- Documentacao tecnica de componentes
- Testes automatizados (unit, widget e integracao)

### Vivencias Necessarias

- Componentes com variacoes, estados, animacoes e interacoes
- Tokens e temas com escalabilidade
- Temas multimarcas centralizados
- Documentacao com exemplos, boas praticas e limitacoes
- Testes de acessibilidade e ajustes continuos
- Apoio direto aos squads na adocao
- Participacao em rituais de revisao tecnica do DS

### Vivencias Desejaveis

- Manutencao de biblioteca compartilhada
- Validacao de aderencia em produtos
- Contextos complexos com multiplos squads
- Integracao entre Design System web e mobile
