# Mac Setup Agent Prompt

Use this guide to set up mac-specific keyboard configuration on a new Mac.
Work through each section interactively — read the existing state, explain
what you're about to do, confirm with the user, then act.

---

## 1. Karabiner-Elements: Ctrl/Cmd swap

Reference rules are in `macos/karabiner-rules.json` in this repo.

Steps:
1. Check if `~/.config/karabiner/karabiner.json` exists
2. If it does, read it and show the user what complex_modifications rules
   are already present (if any)
3. Show the rules from `karabiner-rules.json` and explain what each does
4. Identify any conflicts or overlaps with existing rules
5. Confirm with user which rules to add, skip, or replace
6. If user confirms, use `jq` to merge only the confirmed rules into the
   existing config (do NOT overwrite other sections like devices or
   fn_function_keys). If `jq` is not available, print the exact manual
   edit needed and ask user to do it.
7. If the file doesn't exist yet, ask user if they want to write a fresh
   config from the reference.

## 2. iTerm2: Modifier remapping

Steps:
1. Check if iTerm2 is installed (`/Applications/iTerm.app` exists)
2. If not installed, skip this section and note it for later
3. Explain the two things that need to be configured:
   a. Remap Modifiers (Keys → Remap Modifiers): swap Left Ctrl ↔ Left Cmd
      and Right Ctrl ↔ Right Cmd. This cannot be done via config file —
      walk the user through the UI steps.
   b. Option+. key binding: this CAN be set via profile import.
      The reference profile is in `macos/iterm2-default-profile.json`.
      The relevant section is the `Keyboard Map` entry with key
      `0x2e-0x80000-0x2f` (Action 10, Text ".", Escaping 2).
4. Ask the user if they want to import the full reference profile or
   just add the key binding manually.
   - Full import: instruct them to go to Preferences → Profiles →
     Other Actions → Import JSON Profiles, and select the file.
     Warn them this will replace color/font settings too.
   - Manual: walk them through adding the single key binding via UI.
5. Remind the user to test: Option+. should insert the last argument
   of the previous command.

## 3. Verification checklist

After setup, suggest the user test:
- Ctrl+C / Ctrl+V (copy/paste) — confirms Ctrl/Cmd swap is active
- Ctrl+Shift+Z (redo) — confirms lazy shift fix works
- Alt+Tab (app switcher) — confirms Option+Tab rule
- In iTerm2: Ctrl+C to interrupt a process
- In iTerm2: Option+. to insert last arg
