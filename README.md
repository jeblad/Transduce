# Transduce

This extension for Mediawiki adds morphologic recognition and generation of text to Lua modules. Such transducers are typically used for implementing orthographic rules.

Morphologic recognition is implemented by deterministic (dfsa) and non-deterministic (nfsa) finite-state automata, and morphologic generation is implemented by deterministic (dfst) and non-deterministic (nfst) finite-state transfer. They are split in engine files, which are parsed by special Lua parsers.

Only a parser for deterministic finite-state automata is defined for now, that is the dfse parser.

## Sources

- Chapter 3, *Speech and Language Processing*, Second Edition. Daniel Jurafsky, James H. Martin.
