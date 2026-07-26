# Typography Skills

**A typography knowledge pack for AI coding agents — Claude Code, Codex, Gemini CLI, Copilot CLI, Cursor, or anything that reads Markdown skills.**

Twenty focused skills extracted from ten canonical typography books, plus a
`/type` router that loads only the ones a task needs.

Built because agents are confidently wrong about type. They emit `font-size: 16px`
as a universal law, recommend serifs for "readability," reach for a 12-column grid
on a three-element page, and repeat 2017-era font-loading advice that browsers made
obsolete years ago.

---

## The problem this solves

Ask an agent for typography help and you get folklore:

> ❌ "Body text should always be 16px with 1.5 line-height."

That's a constant with no inputs. It's wrong for a kiosk, a phone, a TV, and any
typeface with an unusual x-height. This pack encodes the decision instead:

> ✅ Determine body-text size from the typeface's apparent size, x-height, target
> device, reading distance, content density, user needs, and available line length.
> Treat 16px as a common browser-oriented starting point, not a universal optimum.
> Validate readability, zoom behavior, line length, and hierarchy in the rendered
> context.

Every skill in this pack is written that way: **decision procedures with named
inputs**, not constants.

---

## Install

### Claude Code

```sh
git clone https://github.com/jpoindexter/typography-skills.git
cd typography-skills && ./install.sh
```

Then use `/type` in any session, or let the router fire automatically.

### Codex

```sh
./install.sh --codex     # symlinks into ~/.agents/skills/
```

`AGENTS.md` at the repo root gives Codex the routing table directly.

### Any other agent

The skills are plain Markdown with YAML frontmatter following the
[agentskills.io](https://agentskills.io/specification) spec. Point your tool at
`skills/` or copy the directory in. No runtime, no dependencies.

### Manual

```sh
ln -s "$PWD/skills/"* ~/.claude/skills/
```

---

## Usage

```
/type                      route the current task to the right skills
/type audit our pricing page
/type why does this look AI-generated
/type build a type scale for a dense dashboard
```

The router loads **2–4 skills maximum** per pass. It won't dump twenty files into
your context.

---

## The skills

| Skill | Owns |
|---|---|
| **`type`** | Router. Routing table, conflict hierarchy, output discipline |
| `type-foundations` | Vocabulary, the em square, CSS units, leading vs line-height |
| `typeface-anatomy` | Letterform parts, apertures, counters, terminals, classification from evidence |
| `typeface-selection` | Choosing a face; constraints before taste |
| `typeface-pairing` | Combining faces — and when not to |
| `hierarchy-and-scale` | Type scales, ratios, heading levels, non-size hierarchy |
| `body-text-and-reading` | Measure, line-height, body size, the reading process |
| `responsive-typography` | Fluid type, `clamp()`, container queries |
| `ui-component-typography` | Buttons, labels, tables, tabular figures, localisation |
| `editorial-web-typography` | Articles, pull quotes, drop caps, captions, art direction |
| `typography-layout-systems` | Elam's eight structural systems |
| `microtypography` | Rivers, rag, orphans, tracking, punctuation, hyphenation |
| `variable-fonts` | Axes, `font-variation-settings` vs standard properties, optical sizing |
| `motion-typography` | Kinetic type, transitions, reduced-motion, streaming text |
| `font-loading-and-performance` | `font-display`, subsetting, metric-matched fallbacks, CLS |
| `typography-accessibility` | WCAG 1.4.3 / 1.4.4 / 1.4.5 / 1.4.12 |
| `international-typography` | Arabic, CJK, Indic, bidi, logical properties |
| `design-token-generation` | Primitive → semantic → component tiers, cross-platform export |
| `typography-audit` | Evidence-producing compliance pass |
| `typography-critique` | Taste and intent, kept separate from compliance |

Each skill carries the same ten sections: when to invoke, required context,
invariant principles, context-dependent heuristics, failure patterns, evaluation
procedure, output format, examples, counterexamples, source citations.

---

## The source hierarchy

Every skill resolves conflicts the same way. Highest authority first:

1. **Accessibility standards and browser behavior** — WCAG 2.2, MDN, actual rendering
2. **User and product context** — device, distance, audience, content
3. *Thinking with Type* (Lupton, 3rd ed. 2024)
4. *Web Typography* (Rutter)
5. *Flexible Typesetting* (Brown)
6. *Detail in Typography* (Hochuli)
7. *Typographic Systems* (Elam)
8. The supporting books
9. Style trends and subjective convention

**Books teach judgment. Current standards teach implementation.**

This matters concretely. Rutter (2017) calls `font-display` "a nascent CSS property
under development"; he and Santa Maria both recommend Web Font Loader. Both were
right when written and are obsolete now. The hierarchy is what stops an agent
applying a print-era rule to a responsive application, or a 2017 rule to a 2026
browser.

Where the canon genuinely disagrees — measure is the standing example — the pack
records the disagreement rather than averaging it. See
[`references/corpus-conflicts.md`](references/corpus-conflicts.md).

---

## Sources

**Required reading (the five that carry the most weight):**

1. *Thinking with Type*, 3rd Edition — Ellen Lupton (2024)
2. *Web Typography* — Richard Rutter (2017)
3. *Flexible Typesetting* — Tim Brown (2018)
4. *Typographic Systems of Design* — Kimberly Elam (2007)
5. *Detail in Typography* — Jost Hochuli (2008)

**Supporting:**

6. *The Anatomy of Type* — Stephen Coles (2012)
7. *Type on Screen* — Ellen Lupton, ed. (2014)
8. *Better Web Typography for a Better Web* — Matej Latin (2017)
9. *On Web Typography* — Jason Santa Maria (2014)
10. *Universal Principles of Typography* — Elliot Jay Stocks (2024)

**Living sources**, which outrank the books on implementation:
[MDN CSS Fonts](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_fonts) ·
[WCAG 2.2](https://www.w3.org/TR/WCAG22/) ·
[web.dev fonts](https://web.dev/learn/performance/optimize-web-fonts) ·
[W3C Internationalization](https://www.w3.org/International/)

This repository contains **no book text** — only extracted principles, decision
procedures, and citations. Buy the books; they're worth it.

---

## Design notes

**Why a router instead of one big skill.** A single `typography` skill would load
everything for every question. The router reads the task and loads 2–4 skills. Cheap
in context, and it means each skill can be long enough to be genuinely useful.

**Why ten sections per skill.** Agents skip sections they don't understand the point
of. Consistent structure means "counterexamples" and "evaluation procedure" are
always there — and those two do most of the work in preventing confident wrong
answers.

**Why counterexamples matter most.** Each skill lists things that sound right and
are wrong: "use a serif for body text, it's more readable" (research has failed to
demonstrate this), "variable fonts are always smaller" (they carry the whole design
space), "Google Fonts is faster because of shared caching" (browsers partitioned the
HTTP cache years ago). Naming the plausible-but-wrong answer is what stops an agent
generating it.

---

## Contributing

Skills follow the [agentskills.io](https://agentskills.io/specification) spec.
Keep the ten-section structure, cite sources, and prefer decision procedures over
constants. Corrections to the current-standards layer are especially welcome — that
part goes stale fastest.

## Licence

[MIT](LICENSE) for the skill files. See [NOTICE.md](NOTICE.md) on sources and citation.
authors and publishers.
