#!/usr/bin/env bash
# Validate agent definition files in .claude/agents/
# Usage: ./scripts/lint-agents.sh
# Exits non-zero if any agent fails validation.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENT_DIR="${REPO_ROOT}/.claude/agents"
ERRORS=0

if [[ ! -d "${AGENT_DIR}" ]]; then
  echo "ERROR: ${AGENT_DIR} does not exist" >&2
  exit 1
fi

# Allowed tool tokens (must match Claude Code's tool registry)
ALLOWED_TOOLS_REGEX='^(Read|Write|Edit|Bash|Glob|Grep|WebFetch|WebSearch)$'

shopt -s nullglob
agents=( "${AGENT_DIR}"/*.md )
if (( ${#agents[@]} == 0 )); then
  echo "ERROR: no agent files found in ${AGENT_DIR}" >&2
  exit 1
fi

echo "Linting ${#agents[@]} agent files..."
echo

for file in "${agents[@]}"; do
  base="$(basename "${file}" .md)"
  rel="${file#${REPO_ROOT}/}"
  errors_for_file=()

  # 1. Frontmatter must be present and properly delimited
  if ! head -1 "${file}" | grep -q '^---$'; then
    errors_for_file+=("frontmatter missing or does not start at line 1")
  fi

  # 2. Extract frontmatter (between first two --- markers)
  frontmatter="$(awk 'BEGIN{n=0} /^---$/{n++; next} n==1{print}' "${file}")"

  # 3. name field must match filename
  name_value="$(echo "${frontmatter}" | awk -F: '/^name:/{sub(/^[ \t]+/, "", $2); print $2}')"
  if [[ -z "${name_value}" ]]; then
    errors_for_file+=("frontmatter 'name' field missing")
  elif [[ "${name_value}" != "${base}" ]]; then
    errors_for_file+=("frontmatter 'name: ${name_value}' does not match filename '${base}'")
  fi

  # 4. description field must exist and be non-empty
  desc_value="$(echo "${frontmatter}" | awk -F: '/^description:/{sub(/^[ \t]+/, "", $2); print $2}')"
  if [[ -z "${desc_value}" ]]; then
    errors_for_file+=("frontmatter 'description' field missing or empty")
  fi

  # 5. tools field must exist and contain only allowed tokens
  tools_line="$(echo "${frontmatter}" | grep '^tools:' || true)"
  if [[ -z "${tools_line}" ]]; then
    errors_for_file+=("frontmatter 'tools' field missing")
  else
    tools_value="${tools_line#tools:}"
    tools_value="${tools_value# }"
    IFS=',' read -ra tool_tokens <<< "${tools_value}"
    for raw in "${tool_tokens[@]}"; do
      token="$(echo "${raw}" | xargs)"  # trim whitespace
      if [[ -z "${token}" ]]; then continue; fi
      if ! [[ "${token}" =~ ${ALLOWED_TOOLS_REGEX} ]]; then
        errors_for_file+=("unknown tool token in 'tools': '${token}'")
      fi
    done
  fi

  # 6. Body must reference {{COMPANY_NAME}}
  if ! grep -q '{{COMPANY_NAME}}' "${file}"; then
    errors_for_file+=("body does not reference {{COMPANY_NAME}}")
  fi

  # 7. Must contain '## 呼び出し例' or '## Usage examples' section
  if ! grep -qE '^## (呼び出し例|Usage examples)$' "${file}"; then
    errors_for_file+=("missing '## 呼び出し例' or '## Usage examples' section")
  fi

  # 8. Must contain '## 役割' or '## Role' section
  if ! grep -qE '^## (役割|Role)$' "${file}"; then
    errors_for_file+=("missing '## 役割' or '## Role' section")
  fi

  if (( ${#errors_for_file[@]} > 0 )); then
    echo "FAIL ${rel}"
    for err in "${errors_for_file[@]}"; do
      echo "  - ${err}"
    done
    ERRORS=$((ERRORS + ${#errors_for_file[@]}))
  else
    echo "OK   ${rel}"
  fi
done

echo
if (( ERRORS > 0 )); then
  echo "Linting failed with ${ERRORS} error(s)."
  exit 1
fi
echo "All ${#agents[@]} agents passed."
