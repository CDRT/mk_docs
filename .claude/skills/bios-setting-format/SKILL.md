---
name: bios-setting-format
description: Reformats a docs/ref/bios/settings/**/*.md page into the project's standard BIOS-setting layout — H3 bold headings, flush-left body text, Attention callouts before option lists, dash bullets, and spaced table dividers. Use when asked to "clean up", "reformat", or "apply the standard format" to a BIOS settings page, or when porting the display.md/network.md formatting pass to another file.
---

# BIOS setting page format

Apply this transformation to the target file(s) the user names. Work one file at a time, and show a diff-sized summary of what changed. Do not touch files the user didn't name.

## Target layout, per setting

1. `### **Setting Name**` — H3 heading, bolded.
2. One or more plain paragraphs describing what the setting means/does.
3. An Attention callout, **if needed** (see "Definition vs. Attention" below) — `!!! warning "Attention"`.
4. The options list, usually introduced by "Possible options:" (some pages use "Options:" — rewrite it to say "Possible options:").
5. The WMI details table.

Everything is flush left (no 4-space indent) except content that is genuinely nested inside a callout, an admonition, or a collapsible note — that content keeps exactly one 4-space indent level relative to its own marker line, no matter how deep the nesting goes.

## Mechanical fixes

- **Images**: remove all `![...](...)` references (including bare `![]()`), and collapse any resulting doubled blank lines to one.
- **Definition-list terms → headings**: this codebase has legacy sections shaped like:

  ```
  Term
  :  Description text.

      Possible options:

      1. ...
  ```

  Convert to:

  ```
  ### **Term**

  Description text.

  Possible options:

  1. ...
  ```

  I.e.: promote the term to a bolded H3, strip the leading `:` (and the spaces after it) from the description line, and dedent the entire body that follows by exactly 4 spaces (down to column 0), all the way until the next heading. If a section is already a heading followed by a plain paragraph (no leading `:`), leave it alone.
- **Titleless notes → Attention warnings**: `!!! note ""` (no title, or an empty title) becomes `!!! warning "Attention"`. Notes that already have a real title (e.g. `!!! note "SSID"`) are a different pattern — leave those as `note`/`???` (collapsible), don't touch them.
- **Bullets**: `*` bullet markers become `-`. Don't touch bullets inside tables or numbered lists.
- **Table divider spacing**: `|:---|:---|` becomes `| :--- | :--- |` — one space padding around every cell in the divider row, matching the header/data rows.
- **Blank lines / trailing whitespace**: keep the result markdownlint-clean — no stray trailing blank lines, no trailing whitespace, collapse 2+ consecutive blank lines to 1.

## Definition vs. Attention — how to draw the line

Some sentences read as part of the setting's definition; others are really a warning to flag for the reader. There's no mechanical rule — use judgment, and lean on these reference sections for calibration:

- `network.md` → **Lenovo Cloud Services**: "This feature will not work while Secure Boot is disabled." is pulled into its own Attention callout, separate from the main description, because it's a *constraint the reader needs to notice*, not part of what the feature *is*.
- `display.md` → **Boot Display Device**: "If multiple displays are attached, the boot screen appears on the first recognized one." is an Attention callout for the same reason — it's a caveat about behavior, not the definition of the setting.

Rule of thumb: if a sentence describes *what the setting is/does*, keep it in the lead paragraph(s). If it describes a *caveat, restriction, side effect, or something that could surprise/trip up the reader*, pull it into the Attention callout. When genuinely ambiguous, prefer leaving it in the callout — it's more visible there, and that's the safer default for a customer-facing BIOS reference.

## Known acceptable exceptions

- A setting that branches by hardware (e.g. "Total Graphics Memory" splitting into Intel-based vs. AMD-based machines) uses a bold line as a sub-label, e.g. `**Intel-based machine**`, followed by its own paragraph/Attention/options/table group. This trips markdownlint's MD036 (emphasis used instead of heading) — that's a known, accepted exception for this specific "two variants under one setting" shape. Don't promote it to a `####` heading unless the user asks for that specifically.

## Heading levels (H1 → H2 → H3)

Add a `## General` heading (right after the `#` page title) if **either** of these is true:

- **The page has a page-level preamble** — any description paragraph, link, or callout that sits directly under the `#` title before the first `### ` setting heading (e.g. `intelligentsecurity.md`'s intro paragraph about what the feature group does, plus its "may be unavailable" Attention callout). Wrap that preamble content in `## General` so it reads as its own section instead of dangling under the page title.
- **The page has other `## ` sections later on** (e.g. `network.md` has `## General`, `## Custom URL Support Settings`, `## WiFi Configuration`, etc.) — the leading group of settings (before the first existing `## ` heading) needs its own `## ` wrapper too, so every `### ` heading sits under some `## ` instead of floating ungrouped while the rest of the page is grouped.

If **neither** applies — the page is a flat list of settings with no preamble and no other `## ` anywhere (e.g. `display.md`, `fingerprint.md`) — leave it as `#` → `### `. Don't insert a placeholder `## General` just to satisfy markdownlint's MD001 (heading levels should increment by one) — that warning is an accepted exception for these flat pages.

## After editing

Run a quick self-check on the file: no remaining `![`, no remaining lines starting with `:` at column 0, no remaining `!!! note ""`, no remaining `* ` bullets, no unspaced `|:---|` dividers, and no trailing whitespace.
