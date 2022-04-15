Use a Linux shell to complete the following activities.

For each activity, save your working script to a text file named as:

```
yourname-scripting-activity#.txt
```

Submit the completed files using the link at the bottom of this page.

## Activity 1

Create a simple shell script to tell the user about their session – they need to know:

-   What their username is
-   What the current date is
-   What the time is
-   What their current working directory is
-   How many files they have in that directory
-   What is the biggest file in their current directory

## Activity 2

Create a directory with a few test files in it (the files can be  empty). Now write a script that for every file in that directory you  rename it to have an extension of today's date in YYYYMMDD format.

## Activity 3

You are in charge of creating a program for the lottery in your area! The options are for numbers between 1and 50. Create a script that picks 5 for each draw plus a bonus ball number between 1 and 10. Output the  numbers to a file that has the date in its name.

Create another script that will allow users to check their lottery  numbers and advise them if they match or not and how many matches they  got.

## Activity 4

Write a script to validate how secure someone's password is. Things you would care about:

-   Length should be 8 or more characters
-   The password should contain numbers and letters
-   There should be both uppercase and lowercase letters

## Activity 5

Write a script that takes a number as an input and reverses it out to the user. For example, if the original number is 74985, the output  should be 58947.

## Activity 6

Create a script that takes two number parameters a and b and then shows True if a is larger than b or False otherwise.

Create a second version of the script that then tells the user the difference between the two numbers.

Remember to code defensively – ensure that your script handles things appropriately if someone enters things incorrectly!

## Activity 7

Create a 10-question true or false quiz game in your script. Choose a topic of your liking for the questions!

## Activity 8

Create a script that completes the following tasks:

1.  It prompts the user for a series of 5-10 integers.

-   The user must be prompted for a minimum of 5 numbers.
-   After the user has entered 5 numbers, the program should allow the user to stop entry or enter another number.

1.  When the user chooses to stop or after 10 numbers have been entered, the program stops prompting for values and performs the following  calculations:
    -   the product of the integers
    -   the average of the integers
    -   the sum of the integers
    -   the min of the integers
    -   the max of the integers
2.  After performing the calculations, the program should display the following to the user:
    -   the values the user entered
    -   each of the calculations, using a phrase that identifies the value

## Activity 9

Write a script that takes a file name as a parameter.

-   If the file exists, print an error and return a code.
-   If the file does not exist, create the file.

## Activity 10

Write a script that writes random numbers to a file (one number per line).

-   The first parameter should be the file name.
-   The second parameter is the number of lines to write.
-   If the specified file already exists, display a relevant message and return a code.

## Activity 11

Create a file that includes the following numbers.

```
5 6 3 7 4 4 9 6 7 9 8 2 3 6 4 5 1 1 3 10 12
```

Write a script that uses this file to perform the following tasks:

-   Read in the file
-   Sort the numbers into reverse order and output them to the screen
-   Each number should output exactly once. Duplicate numbers should not appear in the output.1

## Activity 12

Write a script that checks if two files have at least one common  element or not. Display an appropriate message for both scenarios. The  file names should be specified as parameters. You will need to create  the files to test this.

## Activity 13

Write a script that takes two files of unique numbers and displays the difference between the two lists (without using grep).

For example:

File 1 contains:

```
1
2
4
6
```

File 2 contains:

```
1
2
89
6
7
```

The output should look like:

```
Only in file 1:
4

Only in file 2:
89
7
```

**Stretch**: Create a new script that does the same thing using grep. Which script runs faster?

## Activity 14

In the materials folder on the server you will find a file called books. Copy this file to your home directory.

Write a script that will parse the file, producing an output csv file that will list the word and each time it appears in the file.

Make sure the list is sorted in the file such that the most common  word is listed at the top and then descending. For example, a couple of  lines in the output file should look like this:

```
And,200
Is,195
```

## Activity 15

Imagine that you support the fix Generator script. Write a wrapper  script to set up your environment properly. You can also edit the  fixGenerator script if you need to.

Your fixGenerator script should be in a folder called FixGen in your home directory. The script needs to do the following:

-   Check for a folder called FixGen/logs and if not present create it
-   Compress all log files that are not the latest 3 logs files generated.
-   Run the FixGenerator script with the log file being generated into the FixGen/logs directory.

Once complete, add a cron job that will run Monday through Friday 6 a.m. to establish your environment.

Remember to code defensively and ensure that you use exit codes so we know the job has successfully run. Your script should also output its  own log file where we can see the status each step of the way of each  part of the script.

## Activity 16

Write a script that will output a csv that could be loaded into ITRS Geneos for monitoring on your fixGen script.

-   It needs to parse the log file and produce a count of each message type that has been received or sent.

-   Ensure you distinguish in the csv file if the message was sent or received.

-   Also ensure you display the message type in English so it is easy to understand in monitoring. An example might look like:

    ```
    Number of Partial fills,12
    ```

## Activity 17

Create a script to convert your fix log file into a useful csv.

Pull out the following information for each message:

-   If the fix tag is in the message, leave a blank in the csv so that it will load appropriately in Excel.

-   Translate the message type value into meaningful words.

-   Ensure you have a header row in your csv file:

    ```
    Client, Message type, stock, quantity, price, side, order id, last quantity, exec id, last price 
    ```

Client, Message type, stock, quantity, price, side, order id, last quantity, exec id, last price

## Activity 18 (not necessary)

Run the fixGenerator script to generate a fix log file.

-   Create a script to parse that log file and for each order create a text description of what happened with that order.
-   This should go into a log file with a paragraph for each order.

For example:

```
New buy order for apple with order id 12335, 100 shares at price 54.2 
Partial fill for apple with order id 12335, 20 shares at price 54.2
Cancel message for apple with order id 12335
Final state of order for apple with order id 12335: traded 40 shares at price 54.2. 
```

Remember that each time you run the fix generator script, it creates a new log file so this is a good way to test.