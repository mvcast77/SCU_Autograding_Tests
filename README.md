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

The example shown in linting_test.sh only checks for indentation, and is a fantastically weak linter. This code is most liable to change since there exist a variety of tools that can do linting for c files. This is true in the other cases, but we usually ignore other methods since they would require installing packages into the newly created ubuntu container. Remember that we want all these tests to be as lightweight and basic as possible, since we have a limited amount of compute time from GitHub Classroom, before we have to start paying for it.

In the Linting case however, gcc already offers tools to perform a variety of linting tasks on a file, such as checking for file descriptor errors, infinite loops, and even null dereference. These are all enabled as warnings with the -fanalyzer flag. checkpatch.pl, the linux styles enforcing tool, can also be used for linting purposes, though the tool is described as 'very opinionated', and probably is overkill for intro labs.

The example in linting_test.sh will compare a student submission with a perfectly indented version of the student submission, and use diff to find any differences in indentation that may arise. [diff](https://man7.org/linux/man-pages/man1/diff.1.html) is another linux utility, meant to compare two files, line by line. The only thing we need is a perfectly indented version of the student submission.

The way we get this, is by applying the '=' formatting operator to every line of the newly created copy. '=' will format the line its applied to according to the C indenting rules (student submissions are in C), specified in [filetype.vim](https://github.com/vim/vim/blob/master/runtime/filetype.vim). The commands "gg=G" and ":wq" are written in commands.keys, and are applied to the new file with:

	vim -s commands.keys <new_file>

We now have a perfectly indented file, that we can perform a diff on. The results of this inform whether the test passed or failed. Instead of being used as a particularly punishing grading script, this test is envisioned as a sanity check for students to see whether their code is indented as well as possible, before final submission.

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
