# Asset-Library

Biblioteca compartilhada de **recursos originais e ferramentas técnicas reutilizáveis** entre projetos Roblox e experimentos de software.

> Este repositório é **público**. Não publique fotos pessoais, chaves, arquivos privados, dumps de jogos, imagens de terceiros sem licença, tokens ou dados pessoais.

## Índice
- [Animações Roblox R6 documentadas](animations/roblox/STUDIO_LEGACY_R6.md): IDs reais, eventos, ciclos, duração e regras de integração.
- [Catálogo de animações Luau](animations/roblox/AnimationCatalog.luau): dados de referência importáveis.
- [Fixação de objetos à mão R6](scripts/roblox/AttachPropToR6.luau): módulo reutilizável para caneca, livro e ferramentas; a peça acompanha rotação do braço.
- [Inventário e detecção de duplicados](tools/asset_inventory.py): registra SHA-256 de arquivos locais e encontra cópias idênticas.
- [Fluxo de segurança para arquivar e liberar espaço](docs/WORKFLOW.md): salvar → comparar → testar → excluir seletivamente.
- [Registro de assets de exemplo](data/asset_registry.example.json): modelo de metadados, autoria, direitos, projeto e integridade.
- [Ícones vetoriais originais](icons/): recursos SVG pequenos e editáveis.

## Separação de projetos
- **Anime Draft**: o código e as imagens específicas do jogo devem ficar no repositório privado [Rogeriomatador/Leilao](https://github.com/Rogeriomatador/Leilao). Não misturar o projeto com FITLAB.
- **Studio Legacy**: manter gameplay e recursos exclusivos em [Studio-Legacy](https://github.com/Rogeriomatador/Studio-Legacy); referenciar esta biblioteca apenas quando for algo genérico.
- **NERVO / PocketPC**: guardar especificações exclusivas nos próprios repositórios.

## Regras
1. Não substituir nem apagar binários antes de conferir hashes e integridade.
2. Imagem, vídeo ou áudio só é considerado migrado quando o arquivo realmente consta no GitHub e pode ser baixado.
3. Um ID Roblox não é backup do PNG ou do FBX original.
4. Documentar origem/licença, dimensões, função, versão, ID, projetos dependentes e status de teste.
5. Animações documentadas aqui não implicam que tenham sido testadas na experiência atual.
6. Para arquivos grandes ou versões históricas, prefira releases, armazenamento de objetos ou Git LFS após avaliar limites.

**Estado:** catálogo e ferramentas iniciais. Isso não significa que a biblioteca anterior de 20 GB do ChatGPT tenha sido copiada ou liberada.
