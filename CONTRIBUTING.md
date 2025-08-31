# Contributing Guide

Thanks for your interest in contributing! 🎉

## Ways to Contribute
- Report bugs and request features via **Issues**
- Improve documentation
- Submit code changes via **Pull Requests (PRs)**

## Prerequisites
- Git installed
- A GitHub account
- Bash available (for running/testing the script)

## Workflow
1. **Fork** the repository to your GitHub account.
2. **Clone** your fork:
   ```bash
   git clone https://github.com/<your-username>/<repo>.git
   cd <repo>
   ```
3. Add the original repo as **upstream** (optional but recommended):
   ```bash
   git remote add upstream https://github.com/<original-owner>/<repo>.git
   git remote -v
   ```
4. Create a **branch** for your change:
   ```bash
   git checkout -b feature/short-description
   ```
5. Make your changes and **commit**:
   ```bash
   git add -A
   git commit -m "feat: add X"  # Use Conventional Commits where possible
   ```
6. **Push** your branch to your fork:
   ```bash
   git push origin feature/short-description
   ```
7. Open a **Pull Request** from your branch to the `main` branch of this repository.
8. Address review feedback and get it **merged** ✅

## Code Style
- Keep shell scripts **POSIX‑friendly** where possible
- Run `shellcheck` if available
- Prefer clear variable names and helpful comments

## Commit Messages (Conventional Commits)
- `feat:` new feature
- `fix:` bug fix
- `docs:` documentation changes
- `refactor:`, `test:`, `chore:` etc.

## Running Locally
```bash
chmod +x simple-interest.sh
./simple-interest.sh -p 1000 -r 7.5 -t 2
```

Thanks again for contributing! 💚