########################################## BASIC INTRODUCTION

# Help page
Get-Help

# To apply strict mode
# Set-StrictMode -Version latest
# Set-StrictMode -Off

# To get help about specific cmdlet
Get-Help Get-Process
Get-Help Get-Process -Online # Online docs
Get-Help Get-Process -Full # Extended help page
Help Get-Process # One page at a time
Get-Process -?

# To view avaible Verb commands
Get-Verb

# To view all cmdlet (LONG OUTPUT)
Get-Command

# cmdlet's with specific nouns: Service
Get-Command -noun service

# Available services
Get-Service

# shorthand notation for cmdlets
Get-Alias

# Retrieve date, format & manipulate
Get-Date
Get-Date -Format "yyyy-MM-dd HH:mm:ss:fff"
(Get-Date).AddDays(-3).AddHours(5)
(Get-Date).AddDays(-3).AddHours(5).ToString('yyyy-MM-dd HH:mm:ss')

# View and set Script execution security policy 
##### RETURN FOR BETTER UNDERSTANDING LATER #####
Get-ExecutionPolicy -List
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process



########################################## VARIABLES

# Save a variable as a string
$var="Hello Planet"

# Printing 
$var
# echo $var  #Alias version 

# View data type
$var.GetType()

# Save an integer (Int32)
$num10 = 10
$num10
$num10.GetType()

# Save a double
$dub3 = 3.0
$dub3
$dub3.GetType()

# Math
$sum1 = $num10 + $num10 # addition
$sum1
$sum1.GetType() # stays as Int32

$sum2 = $num10 - $dub3 # subtraction
$sum2
$sum2.GetType() # Turns to double

$sum3 = $num10 * $dub3 # multiplication
$sum3
$sum3.GetType() # Turns to double

$sum4 = $num10 / $num10 # division
$sum4
$sum4.GetType() # Stays Int32

$sum5 = $num10 / $dub3
$sum5
$sum5.GetType() # turns to double

$sum6 = $num10 % $num10 # modulo
$sum6
$sum6.GetType() # Stays Int32

$sum7 = $num10 % $dub3 # modulo
$sum7
$sum7.GetType() # turns to double!...?

# Boolean
$bool=$true # true and false are privilaged words, not allowed for keyword usage
$bool
$bool.GetType()

# Compare  #~~~~~~~~~~~~~~~ RETURN TO THIS
$bool -eq $false
$bool -eq 'false' # This output doesnt make sense
$bool -ceq 'false' # Strict comparison
$bool -eq 'NOT TRUE!!!' # WTF!!!!


$bool -eq $true
$bool -eq 'true'

# Use funciton to save variables
$today = Get-Date
$today


######################################### Arrays & Array-Lists (the latter scales better for larger data)
$arr=@("t1", "t2", "t3")
$arr.GetType()  # Properties dont need () , methods do
$arr.IsFixedSize # Arrays have fixed size, and need recreation when appending. Hense the computational cost
$arr.Count
$arr.Length
$arr

# To index an array (zero based, like Python)
$arr[0] # is element 1
$arr[1] # is element 2
$arr[2] # is element 3

# To append
$arr.Add("t4") # Doesnt work with collections of fixed size

$arr = $arr + "t4"
$arr

$arr += 't5'
$arr

# To remove
$arr = $arr -ne 't5'
$arr

##### Array Lists
# Non-Ideal way
$arrL2 = [System.Collections.ArrayList]@()
$arrL2.GetType()

# Peffered way
$arrL = New-Object -TypeName System.Collections.ArrayList
$arrL.GetType()
$arrL.IsFixedSize # Not fixed size, easier to change
$arrL

$arrL.Add("t1") # Index value is printed as output
[void]$arrL.Add("t2") # to mute the output
$arrL
$arrL[1]


$arrL.AddRange(@("t3", "t4", "t5"))
$arrL
$arrL.Length # Doesnt work correctly for Array lists
$arrL.Count

$arrL.Remove("t")
[void]$arrL.Add("t3")
$arrL
$arrL.Remove("t3") # Removes first instance of exact match
$arrL

$arrL.RemoveAt(0)
$arrL

$arrL.RemoveRange(0, 2) # Start index, and range of values
$arrL









