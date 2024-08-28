---
expanded: false
icon: milestone
order: 70
---

# Ways to Use Victor

While Victor itself is minimal by design, it offers a variety of methods for
building SVGs, accommodating different coding styles and project requirements.

You can begin with the basics, using straightforward method calls to define your
SVG structure. Once you're comfortable with the fundamentals, you might want to
explore more structured techniques.

| Approach                   | When to Choose                                                                                                                     |
|:---------------------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| **[Basic](basic)**         | Ideal for Victor newcomers.<br>This approach uses minimal code for creating SVGs.                                                  |
| **[DSL](dsl)**             | Perfect for quick, ad-hoc SVG generation.<br>Use this approach if you prefer writing less Ruby.                                    |
| **[Class](class)**         | Suitable for building structured, testable SVG objects.<br>This approach integrates Victor within your own class.                   |
| **[Subclass](subclass)**   | Another option for building structured SVG objects.<br>This approach involves subclassing `Victor::SVG`.                           |
| **[Component](component)** | Best for advanced, component-driven design.<br>This approach is used to compose complex SVGs from smaller, reusable components.    |
| **[Command Line](cli)**    | Perfect for non-Ruby developers or automation.<br>Use the Victor CLI to convert between Ruby and SVG from the command line.        |

