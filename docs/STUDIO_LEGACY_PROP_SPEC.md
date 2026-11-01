# Studio Legacy — especificação de props R6

Esta ficha conserva decisões fornecidas durante a criação. Ela é uma **referência**, não resultado de um teste automatizado de Roblox.

## Item
- `ReplicatedStorage` possui o modelo real, que **deve** ser clonado; nunca gerar uma xícara diferente se a original existir.
- Uma `BasePart` com nome `GripPart` define como o modelo se prende ao braço R6 `Right Arm`.
- Modelo na mão: `Anchored=false`, `CanCollide=false`, sem peças extras fixas no mapa.
- Vincule por `Motor6D` ou `WeldConstraint` e ajuste a transformação da `GripPart` para acompanhar rotação do braço.
- Exija apenas uma xícara ativa por personagem; limpe no fim da ação e no respawn.

## Volume/escala de referência, em studs
| Objeto | Mínimo | Máximo | Observação |
|---|---|---|---|
| Xícara da mesa | (0.001, 0.45, 0.45) | (0.444, 0.45, 0.45) | crescer para o lado esperado |
| Bebida no copo segurado | (0.3, 0.001, 0.3) | (0.3, 0.288, 0.3) | crescer **para cima** a partir do fundo |
| Indicador da cafeteira | (0.001, 0.9, 0.984) | (0.31, 0.9, 0.984) | mostrar estoque; aviso 20% |

Não mover o centro da bebida sem corrigir metade da variação de altura. Antes de publicar, observar modelo de frente, lado e durante a animação `CoffeeDrink`.

## Sequência
1. Caminhar até a máquina, sem teleportar.
2. Preparar/servir; usar animação de segurar xícara.
3. Beber (gole de referência perto de 0,77 s).
4. Finalizar, limpar prop e liberar rotina.
5. Ao ler, usar pose contínua do livro e virada de página ocasional.

Módulos relacionados: [animações](../animations/roblox/STUDIO_LEGACY_R6.md) e [AttachPropToR6](../scripts/roblox/AttachPropToR6.luau).
