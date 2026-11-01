# Fluxo seguro de assets e limpeza de armazenamento

## 1. Identificar
Liste projeto, versão, arquivo, tipo, tamanho, autoria/licença, conteúdo e dependências. O nome e o tamanho sozinhos **não provam** duplicidade.

## 2. Preservar
Armazene os arquivos originais no repositório apropriado (privado se necessário). Registre hashes SHA-256, tamanho e caminho de origem. Um README com o nome de um PNG não é uma migração do PNG.

## 3. Verificar
Baixe uma amostra do GitHub, calcule novamente o hash e abra a imagem. Para scripts Luau, revise o diff, execute análise estática, testes locais e testes no Roblox Studio. Não remova a única versão funcional.

## 4. Liberar espaço
Só depois da verificação, selecione no ChatGPT **exatamente** os arquivos redundantes para exclusão. Excluir no ChatGPT não altera GitHub, e enviar ao GitHub não reduz automaticamente o armazenamento do ChatGPT.

## 5. Higiene
- Animação: registrar ID, rig, duração, eventos e quando deve tocar.
- Imagem: registrar resolução, transparência, autoria e finalidade.
- Script: registrar versão, entrada/saída, dependências e teste.
- Backup: manter um snapshot confiável, sem dezenas de cópias idênticas.
- Não subir contas, chaves, IDs privados de terceiros, fotos pessoais ou propriedade intelectual alheia para repositórios públicos sem autorização.

Ferramenta local: `python tools/asset_inventory.py ./pasta_de_assets --output ./inventario.json`.
