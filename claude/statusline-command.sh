#!/usr/bin/env bash
# Claude Code status line — Claude-specific details only

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // ""')
model_id=$(echo "$input" | jq -r '.model.id // ""')
session=$(echo "$input" | jq -r '.session_name // ""')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

# Build each part
parts=""

# Model name (magenta)
if [ -n "$model" ]; then
  parts=$(printf '\033[35m%s\033[0m' "$model")
fi

# Session name (cyan), only when set
if [ -n "$session" ]; then
  parts="$parts $(printf '\033[36m[%s]\033[0m' "$session")"
fi

# Context window used percentage (yellow)
if [ -n "$used_pct" ]; then
  ctx_label=$(printf 'ctx:%.0f%%' "$used_pct")
  parts="$parts $(printf '\033[33m%s\033[0m' "$ctx_label")"
fi

# Estimated cost (green), only after first message
# Pricing per model ($/1M tokens): sonnet-4-6 → $3 in / $15 out
total=$(( total_in + total_out ))
if [ "$total" -gt 0 ]; then
  # Determine per-token rates based on model ID
  case "$model_id" in
    claude-sonnet-4-6*|claude-sonnet-4-5*|claude-3-5-sonnet*)
      rate_in="3"
      rate_out="15"
      ;;
    claude-opus-4*|claude-3-opus*)
      rate_in="15"
      rate_out="75"
      ;;
    claude-haiku-4*|claude-3-5-haiku*|claude-3-haiku*)
      rate_in="0.8"
      rate_out="4"
      ;;
    *)
      # Default: sonnet pricing
      rate_in="3"
      rate_out="15"
      ;;
  esac
  cost=$(awk -v in_tok="$total_in" -v out_tok="$total_out" \
             -v r_in="$rate_in" -v r_out="$rate_out" \
             'BEGIN { printf "%.3f", (in_tok * r_in + out_tok * r_out) / 1000000 }')
  parts="$parts $(printf '\033[32m$%s\033[0m' "$cost")"
fi

printf '%s' "$parts"
