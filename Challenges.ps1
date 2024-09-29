# Talk Back App

Write-Output "Welcome to the 'Talk Back App'"
Write-Output "Where we have a reply for everything unless you tell us to 'Stop'"

$input = Read-Host -Prompt "Got anything to say?"
do{
    if($input -contains "hello"){
        Write-Output "Hello to you too."
    }elseif($input.Contains("?") -and $input.Contains("!")){
        Write-Output "Seriously, dont make me call security"
    }elseif($input.Contains("!")){
        Write-Output "whoow there, lets take it down a notch"
    }elseif($input.Contains("?")){
        Write-Output "We never claimed to hanve answeres"
    }elseif($input.Contains("what")){
        Write-Output "Chicken Butt!"
    }elseif($input.Contains(".")){
        Write-Output 'Thats interesting...i guess"'
    }elseif($input.Length -le 2 ){
        Write-Output "We've got a conversationalist!"
    }

    $input = Read-Host -Prompt "What else?"

}until($input -eq "Stop")

Write-Output "It's been a pleasure"
Write-Output "Come back anytime!"

############################################################################
# Collatz Conjecture
The Collatz Conjecture or 3x+1 problem can be summarized as follows:

Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with, you will always reach 1 eventually.

Given a number n, return the number of steps required to reach 1.
Examples

Starting with n = 12, the steps would be as follows: 12, 6, 3, 10, 5, 16, 8, 4, 2, 1

Resulting in 9 steps. So for input n = 12, the return value would be 9.

############################################################################
# Nucleotide Count
Given a string representing a DNA sequence, count how many of each nucleotide is present. If the string contains characters that arent A, C, G, or T then it is invalid and you should signal an error.

For example:

"GATTACA" -> 'A': 3, 'C': 1, 'G': 1, 'T': 2
"INVALID" -> error

############################################################################
# Leap year determinant
A leap year (in the Gregorian calendar) occurs:

    In every year that is evenly divisible by 4.
    Unless the year is evenly divisible by 100, in which case its only a leap year if the year is also evenly divisible by 400.

Some examples:

    1997 was not a leap year as its not divisible by 4.
    1900 was not a leap year as its not divisible by 400.
    2000 was a leap year!

############################################################################
# Hamming Distance
Calculate the Hamming Distance between two DNA strands.

Your body is made up of cells that contain DNA. Those cells regularly wear out and need replacing, which they achieve by dividing into daughter cells. In fact, the average human body experiences about 10 quadrillion cell divisions in a lifetime!

When cells divide, their DNA replicates too. Sometimes during this process mistakes happen and single pieces of DNA get encoded with the incorrect information. If we compare two strands of DNA and count the differences between them we can see how many mistakes occurred. This is known as the "Hamming Distance".

We read DNA using the letters C,A,G and T. Two strands might look like this:

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

They have 7 differences, and therefore the Hamming Distance is 7.

The Hamming Distance is useful for lots of things in science, not just biology, so its a nice phrase to be familiar with 
Implementation notes

The Hamming distance is only defined for sequences of equal length, so an attempt to calculate it between sequences of different lengths should not work.

############################################################################



############################################################################




############################################################################




############################################################################