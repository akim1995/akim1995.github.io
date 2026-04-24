# This Time, the Layer That Moved Is the Code

Binary gave way to assembly. Assembly gave way to higher-level languages. Now code itself is starting to give way.

Each shift didn't automatically make programs better. It changed how quickly we could build, how much freedom we had, and what kinds of mistakes we were capable of making. Every new layer removed friction-and in doing so, let us build more, faster, and deal with a different category of mistakes.

We've seen this pattern before. Each time, the layer moves up. What used to be skilled work becomes the ground the next layer stands on. We spent years learning what the machine was doing and why. Now much of that understanding has been absorbed into models. The knowledge didn't disappear-it just stopped being scarce. That's the part that's hard to adjust to.

Every transition splits the room. Some people find a technical objection and wait behind it. Others move before the ground feels stable. Right now, the objection is non-determinism: AI is unpredictable.

But so are humans. The developer you hired last month is non-deterministic. So is evolution. What matters isn't eliminating randomness-it's constraining it. Randomness with the right boundaries produces systems that work. Without those boundaries, it produces noise.

## That's where the work has moved.

With AI, the important decisions happen before any code is written. Architecture determines whether the system holds together or unravels. Paradigm, typing, module boundaries, feedback loops-can the system run what it generates, test it, verify it?

Get those decisions wrong, and the system collapses quickly. Get them right, and the AI becomes a force multiplier. But only if you know what's worth building. That part hasn't changed.

## Underneath all of this is the language.

AI models don't impose structure-they reflect it. Train a model on a language with a massive ecosystem, and you get breadth. That's why something like TypeScript works well with AI: there's an enormous amount of code to learn from. But that breadth comes with variation. Those languages gave developers freedom-to explore different styles, patterns, and abstractions. That freedom made them powerful.

It also made them inconsistent.

The same flexibility that expanded what could be built also expanded the range of ways things could go wrong. The model learns all of it-the good patterns and the bad ones-and reproduces both.

Now compare that to languages that constrain how programs are written.

Clojure is one example: it pushes developers toward immutable data and small, composable functions. That already removes a lot of incidental complexity. But for AI systems, even stronger constraints tend to work better-particularly in languages that are both functional and statically typed, where entire classes of errors are ruled out before the code even runs.

The pattern is consistent: the more the language enforces structure, the less the model has to guess.

A human developer can impose discipline in a flexible system. An AI model won't reliably do that. It doesn't know when it's drifting, and it won't correct itself unless something forces it to. If the environment allows too many degrees of freedom, it will use them-and eventually get lost in them.

So the constraint has to come from outside the model.

And the deeper you put that constraint-into the architecture, into the language-the more stable the outcome becomes. Not because the AI improved, but because the system around it did.

## This is where the shift shows up most clearly.

The developers most exposed are the ones who stayed closest to the machine-the ones whose expertise has now been partially absorbed into models. That knowledge still matters, but it's no longer scarce.

The ones who combined technical skill with judgment have a foundation. But the next step is different: learning how to work with the agent itself. How it behaves, where it fails, how to design systems it can operate in without falling apart.

---

The layer didn't just move up.

It moved into the process of writing code itself.

And now the question isn't just how to write software-

it's how to design the constraints that make it work.
