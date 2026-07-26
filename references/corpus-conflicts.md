# Where the canon disagrees

These are real disagreements between the ten source books. An agent that emits a
single number here is hiding a judgment call. Resolve with
`references/source-hierarchy.md`, and say which way you resolved it.

## Measure (line length)

| Source | Position |
|---|---|
| Lupton, *Thinking with Type* | 55–70 characters; "a text-line needs 55–70 characters" |
| Rutter, *Web Typography* | 45–75 ideal; 42 CPL "just about satisfactory"; ~40 CPL typical on a phone at default size |
| Lupton (ed.), *Type on Screen* | 45–75 "widely accepted" |
| Latin, *Better Web Typography* | 55–75 |
| Stocks, *Universal Principles* | cites Bringhurst's 66; notes Material Design says 40–60; "the wisest thing is to give it a try" |
| Brown, *Flexible Typesetting* | **rejects the premise** — counting characters "prescriptively produces layouts that feel stiff" |

Brown quotes Frere-Jones: *"We read with our eyes, not with rulers, so the eye
should win every time."*

**Resolution.** Use 45–75 characters as a *diagnostic range*, not a target. Below
~40 on a phone is a real signal; 40–45 on a phone is normal and acceptable
because the device floor (rule 1) outranks the print-derived range (rules 3–8).
Above ~85 on any viewport is a real defect. Inside the range, judge visually.

Stocks records a useful field trick from Trent Walton: put an asterisk before the
45th character and after the 75th, then see where the line actually breaks.

## Serifs and readability

Lupton is explicit that research **has failed to prove** serifs improve reading
speed or comprehension, and that "bias favors familiarity; many people prefer what
they see most." Treat any "serifs are more readable for body text" claim as
folklore. Choose serif or sans on tone, context, and rendering — never on an
unevidenced readability claim.

## x-height: taller is not simply better

Santa Maria: a tall x-height helps at small sizes and in interfaces, **but** "the
larger the x-height in a text face, the less room for other distinctive
characteristics" — `a`/`d` and `n`/`h` grow harder to tell apart as x-height
climbs. So x-height trades legibility of the *line* against distinguishability of
the *letter*. Judge both.

## Line-height ranges

Latin gives 1.3–1.7 for body text and treats the relationship between size,
line-height, and measure as a triangle that must stay equilateral — change one and
you must revisit the others. WCAG 1.4.12 independently requires that text survive a
user override to `line-height: 1.5`. These are compatible, but note they are
different kinds of claim: one is craft, one is a legal floor.

## Font loading

Rutter (2017) calls `font-display` "nascent... under development" and both Rutter
and Santa Maria recommend Web Font Loader. Superseded. `font-display` is
universally supported; metric-matched fallbacks via `size-adjust` /
`ascent-override` / `descent-override` / `line-gap-override` are the current way
to kill swap-induced CLS. Rule 1 beats rules 4 and 8.
