#### Shebang directive

`#!/bin/bash`

shell scrip directive is not limited to bash shell, for example we can create a python script uning python directive `#!/usr/bin/env/ python3` will create a python script.

### Pipes and filters

- filters are shell commands that take input from standard input
- send output to standard output
- transform input data to output data
- filters can be chained together using pipes
- Examples of filter commands are `cat, more, head, cut, wc, sort, grep`

### pipes for chaining filter commands

the output of the first_command with be the input for the second_commamd `first_command | second_command`

example `ls | sort -r`

### Defining shell variables   THERE IS NO SCPACE AROUND `=`

`var_name=value`

use `unset` command to delete a variable `unset var_name`

### `;` is used as command separator

if we wanted to run two commands in one line, we need to separate then using ;
`*` filename expansion wildcard `ls /bin/ba*` will output all the files in the bin directory that starts with 'ba' characters
`?` single character wildcard in filename expansion `ls /bin/?ash` will output files that have 'ash' at thier filename and only one single character before 'ash' like `/bin/bash` & `/bin/dash`

### I/O redirection

we can redirect the output to a file
using

- `>`  redirect output to a file and overwrite the file, it can also be used to create the file if it doesn't exist.
- `>>` append the output to the file.
- `2>` redirect the standared error to a file
- `2>>` append the standard error to a file
- `<` redirect the file content to standard input

### Command substitution

Using command substitution we can replace a command with its output, there are two ways for command substitution
with by `$(comman)` or `` `command` `` (using backticks aka backquotes)
For example we can save the output of the command `pwd` in a variable `current_path=$(pwd)`

#### Batch mode VS concurrent mode

in batch mode commands are separated using `;` and commands will run after each other `command_1 ; command_2`

In concurrent mode commands run in parallel and are separated using `&`sign `command_1 & command_2`

#### Quoting

![quoting](quoting.png)

#### conditionals

General syntax:

```
if  [ condition ] 
then

    statement_block_1  
else
    statement_block_2  
fi 

```

Tips:

- Notice the use of the **double square brackets**, which is the syntax required for making **integer comparisons** in the condition [[ $# == 2 ]].
- You must always put spaces around your condition within the square brackets `[ ]`.
- Notice you only need **single square brackets** when making **string comparisons**. 

#### Arithmetich calculation
You can perform **integer** addition, subtraction, multiplication, and division using the notation ` $(())`.
example `echo $((2+4))`
