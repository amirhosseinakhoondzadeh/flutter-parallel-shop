# Two Claude Code agents passed their tests, git merged them with zero conflicts, and the merged code failed flutter analyze with 4 errors

The repo behind episode 4 of essential semicolon: https://youtu.be/MBHF9rubjS0

## What is here

- `main`: the Flutter shop starter the agents branched from (tag `v11-start`, commit 2c99046), the prices agent's pull request merged in, the CI workflow `.github/workflows/check.yml` added after the run (flutter analyze and flutter test on every pull request, on GitHub's proposed merge), and this README.
- `SHOP-41`: the prices agent's branch, as it left it. Money moves to integer cents, `total` becomes `totalCents`, the euro formatter goes private behind `formatCents`.
- `SHOP-42`: the summary agent's branch, as it left it. An order summary screen that still calls `euro.format(line.total)`.
- `merge-check`: both branches merged into the starter with `git merge`. Zero conflicts. `flutter analyze` reports four errors in `lib/screens/summary_screen.dart`, and three of the merged test files do not compile.
- `prompts/`: the two prompts the agents got, verbatim. One run each, claude-opus-5, October 4, 2026, under four minutes and 1.32 USD for both.
- `held/`: the tests kept out of the agents' reach. `price_contract_test.dart` is one price test; copy it into `test/` on `merge-check` and it fails on the merged code. The two done tests accepted each branch.

## Reproduce

```
git checkout merge-check
flutter pub get
flutter analyze
flutter test
```

## Why it broke

Martin Fowler calls this a semantic conflict: the branches merge clean as text and break as a program. Each branch passed its own checks against the code it started from. The ticket never asked for new names, and a rename forces every old caller to change. Git never checks whether the merged program works; the check in `.github/workflows/check.yml` does, on the merged code, before anything reaches `main`.

The staged example from the video (green checks, wrong price) is a separate repo: https://github.com/amirhosseinakhoondzadeh/flutter-units-trap
