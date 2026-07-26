# AGENTS.md — typography-skills

Entry point for Codex and any agent that reads `AGENTS.md`.

## What this repo is

Twenty typography skills in `skills/`, each a self-contained `SKILL.md`. Plain
Markdown with YAML frontmatter — no runtime, no dependencies.

## How to use it

When a task involves typography — setting, choosing, scaling, spacing, loading,
tokenizing, auditing, or critiquing type — **read `skills/type/SKILL.md` first.**
It carries the routing table and the conflict hierarchy. Then read the 2–4 skills it
points to. Do not read all twenty.

If invoked as `$type` or `/type`, do exactly that.

## The one rule that matters most

**Never emit a bare universal constant.** Encode the decision procedure and its
inputs.

Wrong:

```
Body text should always be 16px.
```

Right:

```
Determine body-text size from the typeface's apparent size, x-height, target
device, reading distance, content density, user needs and available line length.

Treat 16px as a common browser-oriented starting point, not a universal optimum.
Validate readability, zoom behavior, line length and hierarchy in the rendered
context.
```

## Conflict resolution

Highest authority first. Full version in `references/source-hierarchy.md`.

1. Accessibility standards and browser behavior (WCAG 2.2, MDN, real rendering)
2. User and product context
3. *Thinking with Type* → 4. *Web Typography* → 5. *Flexible Typesetting* →
   6. *Detail in Typography* → 7. *Typographic Systems*
8. The supporting books
9. Style trends and subjective convention

**Books teach judgment. Current standards teach implementation.** The corpus is
2007–2024; verify anything about CSS, browser support, or font loading against MDN
before emitting code. Known-stale corpus claims are flagged inline in the skills.

## Routing (short form)

| Task | Skill |
|---|---|
| vocabulary, units, em, leading | `type-foundations` |
| letterform parts, reading a specimen | `typeface-anatomy` |
| choosing a font | `typeface-selection` |
| combining fonts | `typeface-pairing` |
| type scale, heading sizes | `hierarchy-and-scale` |
| body copy, measure, line-height | `body-text-and-reading` |
| fluid type, clamp(), breakpoints | `responsive-typography` |
| buttons, labels, tables, dense UI | `ui-component-typography` |
| articles, pull quotes, art direction | `editorial-web-typography` |
| composition, grid, spatial structure | `typography-layout-systems` |
| kerning, rag, orphans, punctuation | `microtypography` |
| variable fonts, axes | `variable-fonts` |
| animated/kinetic type, transitions, streaming text | `motion-typography` |
| webfont perf, FOUT/FOIT, CLS | `font-loading-and-performance` |
| contrast, zoom, WCAG | `typography-accessibility` |
| Arabic, CJK, Indic, bidi, RTL | `international-typography` |
| tokens, theme config, Style Dictionary | `design-token-generation` |
| systematic review against criteria | `typography-audit` |
| taste, "is this good" | `typography-critique` |

**Always co-load:** body text → `typography-accessibility`; webfonts →
`font-loading-and-performance`; non-English → `international-typography`.

## Output discipline

When making a typographic recommendation:

- State the decision procedure, not just the value.
- Name the inputs that drove it.
- Flag any source conflict you resolved, and which rule won.
- Mark anything you did **not** verify in a rendered context.

Never claim typography is "accessible" after checking contrast alone — 1.4.3,
1.4.4, and 1.4.12 fail independently.
