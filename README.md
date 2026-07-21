# homebrew-gq

Homebrew tap for **gq** — execute one Cypher statement against a
[graphdb](https://github.com/pmuston/homebrew-graphdb) server and emit
**graph rows**, the JSONL contract consumed by `gfig map`. Prebuilt static
binaries (macOS & Linux, Intel & Apple Silicon); no dependencies to build.

## Install

```bash
brew tap pmuston/gq
brew trust pmuston/gq     # third-party taps must be trusted before install
brew install gq
gq --version
```

> Recent Homebrew refuses to load formulae from an untrusted third-party tap; the
> `brew trust` step above authorizes this one. If your Homebrew doesn't recognize
> `brew trust`, it's older and will install without it.

## Quick start

```bash
gq --param 'tag="U-100"' --query '
  MATCH (u:Unit {Tag: $tag})-[:CONTAINS*0..]->(a)-[r:CONTAINS]->(b)
  RETURN a, r, b
  ORDER BY id(a), id(r)'
```

Graph rows go to stdout, one JSON object per line; diagnostics go to stderr.
Exit codes: `0` success · `1` query/request fault · `2` connection or transport
failure · `3` usage error.

Run `gq --help` for the full flag surface.

## Requires graphdb 0.18.0 or later

`gq` feature-detects on connect and fails closed below that floor rather than
degrading. Every older server has a silent wrong-answer mode `gq` cannot detect
per query — a variable-length relationship variable binding `null`, `*0..0`
reading as unbounded, or a missing `value-kind` type discriminator.

```bash
brew tap pmuston/graphdb && brew install graphdb
```

Release binaries are attached to this repo's [Releases](../../releases).

## Upgrade / uninstall

```bash
brew upgrade gq
brew uninstall gq && brew untap pmuston/gq
```
