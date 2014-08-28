History: first experimental version Oct 2012

indentation algorithm overview

This design is inspired in part by experience writing a SMIE
indentation engine for Ada, and the wisent parser.

The general approach to indenting a given token is to find the
start of the statement it is part of, or some other relevant point
in the statement, and indent relative to that.  So we need a parser
that lets us find statement indent points from arbitrary places in
the code.

For example, the grammar for Ada as represented by the EBNF in LRM
Annex P is not LALR(1), so we use a generalized LALR(1) parser (see
wisi-parse, wisi-compile).

The parser actions cache indentation and other information as text
properties of tokens in statements.

An indentation engine moves text in the buffer, as does user
editing, so we can't rely on character positions remaining
constant.  So the parser actions use markers to store
positions.  Text properties also move with the text.

The stored information includes a marker at each statement indent
point.  Thus, the indentation algorithm is: find the previous token
with cached information, and either indent from it, or fetch from
it the marker for a previous statement indent point, and indent
relative to that.

Since we have a cache (the text properties), we need to consider
when to invalidate it.  Ideally, we invalidate only when a change to
the buffer would change the result of a parse that crosses that
change, or starts after that change.  Changes in whitespace
(indentation and newlines) do not affect an Ada parse.  Other
languages are sensitive to newlines (Bash for example) or
indentation (Python).  Adding comments does not change a parse,
unless code is commented out.  For now we invalidate the cache after
the edit point if the change involves anything other than
whitespace.

comparison to the SMIE parser

The central problem to be solved in building the SMIE parser is
grammar precedence conflicts; the general solution is refining
keywords so that each new keyword can be assigned a unique
precedence.  This means ad hoc code must be written to determine the
correct refinement for each language keyword from the surrounding
tokens.  In effect, for a complex language like Ada, the knowledge
of the language grammar is mostly embedded in the refinement code;
only a small amount is in the refined grammar.  Implementing a SMIE
parser for a new language involves the same amount of work as the
first language.

Using a generalized LALR parser avoids that particular problem;
assuming the language is already defined by a grammar, it is only a
matter of a format change to teach the wisi parser the
language.  The problem in a wisi indentation engine is caching the
output of the parser in a useful way, since we can't start the
parser from arbitrary places in the code (as we can with the SMIE
parser). A second problem is determining when to invalidate the
cache.  But these problems are independent of the language being
parsed, so once we have one wisi indentation engine working,
adapting it to new languages should be quite simple.

The SMIE parser does not find the start of each statement, only the
first language keyword in each statement; additional code must be
written to find the statement start and indent points.  The wisi
parser finds the statement start and indent points directly.

In SMIE, it is best if each grammar rule is a complete statement,
so forward-sexp will traverse the entire statement.  If nested
non-terminals are used, forward-sexp may stop inside one of the
nested non-terminals.  This problem does not occur with the wisi
parser.

A downside of the wisi parser is conflicts in the grammar; they can
be much more difficult to resolve than in the SMIE parser.  The
generalized parser helps by handling conflicts, but it does so by
running multiple parsers in parallel, persuing each choice in the
conflict.  If the conflict is due to a genuine ambiguity, both paths
will succeed, which causes the parse to fail, since it is not clear
which set of text properties to store.  Even if one branch
ultimately fails, running parallel parsers over large sections of
code is slow.  Finally, this approach can lead to exponential growth
in the number of parsers.  So grammar conflicts must still be
analyzed and minimized.

In addition, the complete grammar must be specified; in smie, it is
often possible to specify a subset of the grammar.

grammar compiler and parser

Since we are using a generalized LALR(1) parser, we cannot use any
of the wisent grammar functions.  We use OpenToken wisi-generate
to compile BNF to Elisp source (similar to
semantic-grammar-create-package), and wisi-compile-grammar to
compile that to the parser table.

Semantic provides a complex lexer, more complicated than we need
for indentation.  So we use the elisp lexer, which consists of
`forward-comment', `skip-syntax-forward', and `scan-sexp'.  We wrap
that in functions that return tokens in the form wisi-parse
expects.

code style

'wisi' was originally short for "wisent indentation engine", but
now is just a name.

not using lexical-binding because we support Emacs 23