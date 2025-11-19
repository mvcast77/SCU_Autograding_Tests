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

Back to [top](#scu_autograding_tests)

## Keyword

Back to [top](#scu_autograding_tests)
