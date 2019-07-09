# Is Mutation Score a Fair Metric?

## Abstract

Comparing the mutation score of test suites from different test generation techniques, one is able to judge which technique is better. However, it is not known if the mutation score, being a summary of the detection ratios of different mutation types, is a fair metric to do such comparison. In this paper, we present an empirical study, with 10 open-source projects, which compares developer-written and automatically generated test suites in terms of mutation score and in relation to the detection ratios of 7 mutation types. Our results indicate fairness on the mutation score but also suggest equivalence among mutants generated by PIT with different mutation operators.

## Experimental Material

### [EvoSuite's Maven Plugin](http://www.evosuite.org/documentation/maven-plugin/) (version 1.0.6)
