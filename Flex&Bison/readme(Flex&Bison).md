<pre>
Grammar Hierarchy (Precedence Levels):

exp       (+ -)      ← Level 1: Lowest precedence (evaluated LAST)
  ↓
term      (*)        ← Level 2: Medium precedence
  ↓
frac      (/)        ← Level 3: Highest precedence (evaluated FIRST)
  ↓
factor    (numbers, parentheses)  ← Atomic values
</pre>

<p><strong>Rule:</strong> The deeper in the tree (closer to <code>factor</code>), the higher the precedence.</p>

<ul>
  <li><code>exp</code> is at the top → evaluated last → lowest precedence</li>
  <li><code>frac</code> is near bottom → evaluated first → highest precedence</li>
</ul>
