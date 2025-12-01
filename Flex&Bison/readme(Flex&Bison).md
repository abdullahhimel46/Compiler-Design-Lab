<pre>
  Grammar Hierarchy (Precedence Levels):
exp       (+ -)      ← Level 1: Lowest precedence (evaluated LAST)
  ↓
term      (*)        ← Level 2: Medium precedence
  ↓
frac      (/)        ← Level 3: Highest precedence (evaluated FIRST)
  ↓
factor    (numbers, parentheses)  ← Atomic values

  <p>Rule: The deeper in the tree (closer to factor), the higher the precedence. </p>
  <ul>
  exp is at the top → evaluated last → lowest precedence
  frac is near bottom → evaluated first → highest precedence
    </ul>
</pre>
