# Learning Objective

- Initialize your log file
- Write a Bash script to download, extract, and load raw data into a report
- Add some basic analytics to your report
- Schedule your report to update daily
- Measure and report on historical forecasting accuracy

## Exercise 1 - Initialize your weather report log file

### Create a text file

Use the `file_name.log` for the file format.

#### Hint: 

Use `echo` command with the `e` option and include tab separator `\t` in a string of names. 

The command will be

`echo -e "year\tmonth\tday\thour\tobs_temp\tfc_temp">file_name.log`

or with defining shell variable

`header=$(echo -e "year\tmonth\tday\tobs_temp\tfc_temp")
echo $header>file_name.log`

Tip: Although it might seem redundant, it is better practice to use variables in these cases. Variables make for much cleaner code, which is easier to understand and safer to modify by others or even yourself at a later date. Using meaningful names for your variables also makes the code more "self-documenting."