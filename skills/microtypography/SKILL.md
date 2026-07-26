---
name: microtypography
description: Use when text is technically correct but reads poorly — uneven word spacing, rivers, bad rags, orphans and widows, awkward hyphenation, loose or tight tracking, wrong quote marks and dashes, cramped all-caps. Also use when a design "feels cheap", "looks AI-generated", or "something is off" and the cause is spacing detail rather than font choice.
---

# Microtypography

The layer below font choice. When a page feels amateur despite a good typeface,
the defect is almost always here. Hochuli's subject: *"all the small things that
enhance the legibility of texts."*

## 1. When to invoke

- Text is set correctly by every macro rule and still reads badly.
- Uneven word spacing, visible rivers, ragged edges that clump.
- Orphans, widows, a heading stranded at a column foot.
- Wrong apostrophes, hyphens standing in for dashes, cramped capitals.
- Someone says the work looks "generic", "cheap", or "AI-generated."

**Do not** invoke to pick a typeface (`typeface-selection`) or set a scale
(`hierarchy-and-scale`).

## 2. Required context

- The **rendered** text — microtypography cannot be judged from source.
- Whether setting is **justified or ragged**, and the measure in characters.
- Whether the text is **user-generated** (you cannot hand-fix it — the rules must
  be systemic).
- Language and script — spacing conventions are not universal.
- Whether the typeface carries the needed OpenType features (real small caps,
  oldstyle figures, proper kerning pairs).

## 3. Invariant principles

- **Word spaces should be even and unobtrusive.** They separate words; they should
  not be seen as shapes in their own right.
- **Rivers are defects.** When word spaces in successive lines fall under one
  another they form vertical channels that "disturb the flow of the text"; the
  make-up should be adjusted to remove them. (Hochuli)
- **Justification below ~50 characters per line fails.** Even word spacing becomes
  "difficult, if not impossible" and large holes appear. Below that measure, set
  ragged. (Hochuli)
- **Ragged setting is a legitimate aesthetic choice at any measure**, not merely a
  fallback: even word spacing makes the text regular, while the irregular right
  margin makes it lively. (Hochuli)
- **A paragraph needs exactly one unambiguous separation signal** — indent *or*
  space, never both.
- **Punctuation has correct forms.** `'` and `"` are typewriter marks, not quotes.
  Hyphen, en dash, and em dash are three different characters with three
  different jobs.
- **Capitals and small caps always need letterspacing.** Set solid, they read as a
  cramped block. Lowercase set for text does not.

## 4. Context-dependent heuristics

**Paragraph separation — a real print/web conflict.** Hochuli, citing Tschichold,
holds that indents are "the only certain indicators of a new paragraph," and that
using blank lines "breaks up the page, requires too much space, and creates
problems when a paragraph ends at the bottom of a page."

That reasoning is about **bound pages**. On the web there is no page bottom, and
WCAG 1.4.12 requires paragraph spacing to survive a `2em` user override. So:

- Continuous prose in a paged/print or ebook context → **indent**, no blank line.
- Web, docs, UI, anything scrolled → **space between paragraphs**, no indent.
- Never both. Never a first-paragraph indent directly under a heading.

Source hierarchy: rule 1 and rule 2 outrank rule 6 here.

**Tracking.**

| Case | Guidance |
|---|---|
| Body text at reading size | Leave at the designer's default — 0 |
| Display sizes (large headings) | Tighten slightly; type spaced for text is loose when scaled up |
| All-caps and small caps | Add positive tracking, always |
| Small sizes / low contrast / dark-on-light inversion | Slightly positive |
| Any text a user can override | Must survive `letter-spacing: .12em` (WCAG 1.4.12) |

**Hyphenation and rag.** Hyphenation lets justified text hold even word spacing;
without it, narrow justified columns are unsalvageable. For ragged setting, judge
the rag itself: it should look accidental, not form shapes, stair-steps, or a
near-justified edge that reads as a mistake. Avoid more than two consecutive
hyphenated lines.

**Orphans and widows.** A single word alone on the last line of a paragraph, or a
single line stranded at the top or bottom of a column. In CSS, `orphans`/`widows`
handle column breaks; `text-wrap: pretty` addresses the last-line orphan and
`text-wrap: balance` evens short blocks like headings. Both are progressive
enhancements — unsupported browsers fall back to normal wrapping with no breakage.

**Punctuation quick table.**

| Use | Character |
|---|---|
| Word joining, line-break hyphenation | hyphen `-` |
| Ranges, "1998–2004" | en dash `–` |
| Parenthetical break | em dash `—` (or spaced en dash, house style) |
| Apostrophe, single quote | `'` `'` |
| Double quote | `"` `"` |
| Ellipsis | `…` not `...` |
| Minus sign | `−` not hyphen |

## 5. Failure patterns

| Pattern | Cause | Fix |
|---|---|---|
| "Holes" in justified text | Measure too narrow, hyphenation off | Enable hyphenation, widen measure, or set ragged |
| Vertical rivers | Coincident word spaces across lines | Adjust make-up, re-break, or set ragged |
| Both indent *and* blank line between paragraphs | Two separation signals | Pick one |
| Cramped all-caps heading | No tracking added | Add positive tracking |
| Straight quotes in production copy | No smart-quote transform | Fix at the content pipeline, not by hand |
| Heading tightened globally and body went tight too | Tracking applied to a shared token | Scope tracking to display sizes |
| A single word on a heading's second line | No `text-wrap: balance` | Add it (progressive enhancement) |
| Small caps look like shrunken capitals | Faux small caps | Use a font with real `smcp` |

## 6. Evaluation procedure

1. **Render at real size.** Then step back or squint — rivers and rag problems
   appear as texture before they appear as detail.
2. Scan word spacing down the block. Even? Any vertical channels?
3. If justified: count CPL. Under ~50 → change to ragged or widen.
4. If ragged: is the edge accidental, or does it form a shape or stair-step?
5. Check every paragraph boundary for exactly one separation signal.
6. Check the last line of each paragraph for orphans; check column tops/bottoms
   for widows.
7. Grep the copy for `'`, `"`, ` - `, `...` — replace with correct characters.
8. Check all-caps and small-cap runs for tracking.
9. Apply WCAG 1.4.12 overrides (`letter-spacing: .12em`, `word-spacing: .16em`)
   and confirm nothing breaks.

## 7. Output format

```
Defects found (ranked by reading impact):
1. <defect> — <where> — cause: <cause> — fix: <fix>
...
Setting: <justified|ragged> at <N> CPL — <appropriate|not>
Paragraph signal: <indent|space> — <single|doubled ✗>
Punctuation: <n> straight quotes, <n> hyphen-as-dash, <n> ... 
1.4.12 override: <pass|fail>
Unverified: <what was not checked in a rendered context>
```

## 8. Examples

**A marketing page that "looks cheap" despite a good typeface.**

> The typeface is fine. Three microtypographic defects are doing the damage: the
> hero heading is set in all-caps at default tracking, so it reads as a cramped
> block; body paragraphs carry both a first-line indent and a blank line, giving
> two separation signals; and the copy uses straight quotes throughout. Fix the
> tracking on the caps token, drop the indent, and add a smart-quote transform at
> the content layer — the font choice needs no change.

**A 38-CPL justified sidebar with visible holes.**

> Justification is failing because the measure is far below the ~50 CPL floor
> where even word spacing is achievable. Widening isn't available in this layout,
> so set the sidebar ragged. Word spaces become even; the ragged right edge is
> the correct trade and reads as deliberate.

## 9. Counterexamples

- ❌ "Add `letter-spacing: -0.02em` to body text to tighten it up." — Text-size
  type is already spaced correctly by its designer. Tightening body text harms
  legibility and may collide with the WCAG 1.4.12 override.
- ❌ "Justify the text so it looks clean and formal." — At a narrow measure,
  justification produces holes and rivers, which is the opposite of clean.
- ❌ "Use `&nbsp;` before the last word to fix the orphan." — Brittle, breaks at
  other viewports, and pollutes content. Use `text-wrap: pretty`.
- ❌ "Indent the first line of every paragraph, including the one after the
  heading." — The heading already signals the paragraph start; the indent is
  redundant there.
- ❌ "Small caps via `font-variant: small-caps` always looks right." — Without a
  real `smcp` set the browser may synthesize them by scaling capitals, which
  produces visibly too-light strokes.

## 10. Source citations

- Hochuli, *Detail in Typography* — **primary source.** Rivers and page make-up;
  the ~50 CPL floor for justified setting; ragged setting as an aesthetic choice;
  Tschichold on indents as the only certain paragraph indicator; fixation
  behavior around capitals and long words.
- Lupton, *Thinking with Type* 3e — typographic conventions, punctuation forms.
- Stocks, *Universal Principles of Typography* — OpenType features, small caps,
  figure styles.
- Rutter, *Web Typography* — hyphenation and justification on the web.
- WCAG 2.2 §1.4.12 (text spacing override).
- MDN — [`text-wrap`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-wrap):
  `balance` is supported in Chrome/Edge 114+, Firefox 121+, Safari 17.5+;
  `pretty` in Chrome/Edge 117+ and Safari 26+, not yet Firefox. Chromium applies
  `balance` only to blocks of ≤6 lines. Both degrade silently.
