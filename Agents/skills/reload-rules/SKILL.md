---
name: reload-rules
description: エージェントのルール設定ファイルをディスクから読み直し、変更点を反映する
disable-model-invocation: true
---

ユーザーの `AGENTS.md` / `CLAUDE.md` が編集された。最新の内容を反映したい。

1. グローバルな `AGENTS.md` / `CLAUDE.md` を Read で読む
2. 中の `@` インクルードを辿って実体も Read で読む
3. プロジェクトの `AGENTS.md` / `.agents/AGENTS.md` / `CLAUDE.md` / `.claude/CLAUDE.md` があればそれも読む
4. 読んだ内容を最新の指示として扱う。セッション開始時に注入された内容と矛盾する場合、読み直したほうを優先する
5. 変更点があれば要約して報告する
