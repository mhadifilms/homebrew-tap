# mhadifilms/homebrew-tap

Personal Homebrew tap for projects maintained by [@mhadifilms](https://github.com/mhadifilms).

## Usage

```bash
brew tap mhadifilms/tap
```

Then install any formula:

```bash
brew install dvr
```

## Available formulae

| Formula | Description |
|---------|-------------|
| [`dvr`](Formula/dvr.rb) | The missing CLI and Python library for DaVinci Resolve. |

## Direct install (no tap)

```bash
brew install mhadifilms/tap/dvr
```

## Contributing

Issues and PRs are welcome, but these formulae exist to keep pace with upstream releases of their respective projects — open an issue on the upstream repo first if you hit a packaging problem that isn't Homebrew-specific.

## License

The tap itself is MIT-licensed. Each formula installs software whose own license is printed by `brew info <formula>`.
