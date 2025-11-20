# SCU_Autograding_Tests
Primarily meant as a template for SCU TAs learning GitHub Actions

This repository is organized into different methods of testing student submissions.
- [Behavioral Tests](#behavior)
- [Linting Tests](#linting)
- [Keyword Tests](#keyword)

Each method will be elaborated on within each section.

## Behavior

Behavior tests send input to the running program, extracting the output to verify that the program is behaving as intended.

In the example provided, behavior_test.sh verifies that an input message of 2 leads to 'case 2' being printed to the standard output.

This stdout message is captured by the variable output, and grep'd for 'case 2', though any regular expression could be the search term.

For information on what grep is and how it works, try this [link](https://www.man7.org/linux/man-pages/man1/grep.1.html).

The result of filtering the response (match) is simply queried for emptiness. Depending on the setup of the test, a different message, and exit code, is executed. Note that returning 0 means success, and returning 1 means failure, as with many linux utilities.

Back to [top](#scu_autograding_tests)

## Linting

Not yet written.

Back to [top](#scu_autograding_tests)

## Keyword

Keyword matching (where we look for some specific usage of a term in the code) relies heavily on [sed](https://www.gnu.org/software/sed/manual/sed.html#Introduction).

sed is a non-interactive stream editing linux utility, whose main purpose is to filter and replace text in a stream. Note that a stream can also be a file, not just whatever you pipe in. sed with the -n flag prints only matched lines. Using the -E flag allows sed to use POSIX style extended regular expressions.

In the keyword_test.sh example, the first command demonstrates sed's pattern matching utility by looking for a predefined MACRO name. The second command matches for the same pattern, but also includes an inverse condition, so that we capture just the usage of the macro and not the definition of it.

After this, things get more complicated. We now look for the undefined name of a macro, using the '#define' lines as an anchor for our search (the name of the macro will always come after). We use 'capture groups' (Shown by placing parentheses around the pattern) to replace the output stream with what we captured. Since sed is designed as a pattern match and replace tool, we're both replacing the line we read with a separate string, and using the capture group to supply our replacement string, with the pattern we matched originally.

Capture groups are incredibly useful for dynamic match-and-replace logic, since it allows us to reformat, from scratch, every single line in an input stream. For an in-depth tutorial on this, check out [this page](https://missing.csail.mit.edu/2020/data-wrangling/), which includes, among other useful pieces of information, examples on how to use sed effectively.

Since the capture group (the name of the macro) is captured in the output variable, we can then use it as input for another sed expression, this time looking for usage of that name, and not its definition.

This example, which allows us to check student submissions for usage of a macro when we require them to, and makes sure they actually use it, can provide the general form for searching any particular identifier and proper usage of said identifier.

Back to [top](#scu_autograding_tests)
