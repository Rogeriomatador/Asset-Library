# Studio Legacy — animações Roblox R6

Referências fornecidas durante o desenvolvimento do **Studio Legacy**. Esta página registra a intenção de cada animação, sem afirmar que o asset está publicado para todas as experiências.

| ID Roblox | Função | Duração conhecida | Loop | Estado/uso |
|---|---|---|---|---|
| `135391868063277` | Pegar/segurar a xícara de café | pose inicial no 0 s | Sim | Personagem ao lado da cafeteira; objeto na mão |
| `115563592156206` | Beber café | ~1,1 s; gole perto de 0,77 s | Não | Tocar após servir; não prender caneca ao mundo |
| `137835407978976` | Animação genérica de leitura | não aferida | verificar no Studio | Referência histórica; não misturar automaticamente com sequência detalhada |
| `108890928738618` | Segurar livro na mão direita | pose inicial no 0 s | Sim | Estado ocioso na poltrona ou durante leitura |
| `95432586788785` | Virar uma página do livro | ~1,3 s | Não | Acionar intermitentemente durante leitura |

## Regras técnicas
- Rig esperado: **R6**, com parte `Right Arm` e `Humanoid`.
- Animação move articulações; objeto de verdade acompanha a mão/braço por **Motor6D ou WeldConstraint**, nunca por `Anchored=true`.
- Para xícara, um único modelo deve ser clonado de `ReplicatedStorage` e vinculado por sua `GripPart`. Evitar criar xícara substituta por script.
- Ao trocar ações, pare pistas anteriores, libere conexões e elimine objetos temporários. Evite duas canecas ou livros simultâneos.
- O café tem fases de caminhar → pegar/servir → beber → guardar/soltar → retornar. Não teleportar o personagem.
- Ocioso: ler, usar celular, descansar; atividade pode gerar pontos de pesquisa.
- Prioridade: teste visual no Studio, permissões Roblox, propriedade do asset e compatibilidade R6/R15.
- A duração é uma anotação da gravação de referência, não uma medição automática de `AnimationTrack.Length`.

## Verificações
1. Braço gira e o objeto gira **junto**, sem ficar vertical no mundo.
2. A xícara não aparece duplicada, nem atravessa permanentemente o braço.
3. Durante o gole, o copo acompanha os frames e volta à pose de repouso.
4. Na leitura, alternar pose contínua e virada de página sem travar a mão.
5. Testar servidor + cliente, reset do personagem e troca automática/manual.

Fonte de integração: [Studio Legacy](https://github.com/Rogeriomatador/Studio-Legacy). [Módulo de fixação](../../scripts/roblox/AttachPropToR6.luau).
