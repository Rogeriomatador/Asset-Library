#!/usr/bin/env python3
"""Inventário de arquivos por SHA-256: NÃO modifica, move ou apaga nada.

Uso: python tools/asset_inventory.py ./meus_assets --output inventario.json
"""
import argparse
import hashlib
import json
from pathlib import Path
from collections import defaultdict

IGNORED = {".git", "__pycache__", ".venv", "node_modules"}

def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()

def inventory(directory):
    records = []
    root = directory.resolve()
    for path in sorted(root.rglob("*")):
        if not path.is_file() or any(part in IGNORED for part in path.relative_to(root).parts):
            continue
        record = {"path": path.relative_to(root).as_posix(), "bytes": path.stat().st_size, "sha256": sha256(path)}
        records.append(record)
    hashes = defaultdict(list)
    for record in records:
        hashes[record["sha256"]].append(record["path"])
    duplicates = [{"sha256": key, "paths": paths} for key, paths in hashes.items() if len(paths) > 1]
    return {"root": str(root), "count": len(records), "total_bytes": sum(r["bytes"] for r in records),
            "files": records, "duplicate_groups": duplicates,
            "notice": "Candidatos a duplicados comprovados por hash; nenhuma exclusão automática."}

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", type=Path)
    parser.add_argument("--output", type=Path, default=Path("asset_inventory.json"))
    args = parser.parse_args()
    if not args.directory.is_dir():
        parser.error("A pasta de origem não existe")
    data = inventory(args.directory)
    args.output.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"{data['count']} arquivos, {len(data['duplicate_groups'])} grupos idênticos por SHA-256.")
    print(f"Resultado: {args.output}. Nenhum arquivo foi excluído.")

if __name__ == "__main__":
    main()
