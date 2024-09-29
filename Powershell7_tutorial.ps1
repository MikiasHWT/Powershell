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


###################################################################
# Hastables
###################################################################
###################################################################
# Pipeline
###################################################################

# If Else

1 -eq 1 # Equals
1 -ne 2 # Not Equals
1 -lt 2 # Less than
1 -le 2 # Less than or equal to
2 -gt 2 # Greater than 
2 -gt 2 # Greater than or equal

@(1, 2, 3) -contains 2
@(1, 2, 3) -contains 4

@("Test", "test") -contains "TEST" # Contains is not case sensitive
@("Test", "test") -ccontains "TEST" # Added "c" makes it case sensitive
@("Test", "test", "TEST") -ccontains "TEST"

"Test" -eq "test" # Not case sensitive
"Test" -ceq "test" # Case sensitive



$filePath="C:\Users\Owner\Documents\GitHub\Powershell\test.txt"

if(Test-Path -Path $filePath){
    $Data=Get-Content -Path $filePath
    if($Data.Count -lt 2){
        Write-Output "This data has less than 2 lines"
    }elseif($Data.Count -lt 4){
        Write-Output "This file has less than 4 but more than 2 lines"
    }else{
        Write-Output "this file has 4 or more lines"
    }
    Write-Output "this is after the if statement"
    $Data | Write-Output
}else{
    Write-Output "File '$filePath' does not exist!"
}
   

$Data

######################################################
# Switch statements

$FirstNamesPath = "C:\Users\Owner\Documents\GitHub\Powershell\FirstNames"

$Data = Get-Content -Path $FirstNamesPath

$FirstName = $Data[0].Trim()

if($FirstName -eq "Tim"){
    Write-Output "My name is Tim"
}elseif($FirstName -eq "Steve"){
    Write-Output "My name is Steve"
}elseif($FirstName -eq "Mikias"){
    Write-Output "My name is Mikias"
}else{
    Write-Output "i dont know my name!"
}


switch($FirstName){
    "Tim"{
        Write-Output "My name is Tim"
        break # include breaks to prevent multiple outputs from populating
    }
    "Steve"{
        Write-Output "My name is Steve"
        break
    }
    "Mikias"{
        Write-Output "My name is Mikias"
        break
    }
    default{
        Write-Output "i dont know my name!"
    }
}


# Example when break statements are needed

switch($Data.Count){
    {$_ -lt 2}{
        Write-Output "this file has less than 2 lines"
        break
    }
    {$_ -eq 7}{
        Write-Output "this file has exactly 7 lines"
        break
    }
    {$_ -lt 10}{
        Write-Output "this file has less than 10 lines, and at least 2"
        break
    }
    default{
        Write-Output "this file has more than 10 lines"
        break
    }
}

########################################
# Loops

$FilePath = "C:\Users\Owner\Documents\GitHub\Powershell\FirstNames"

$FolderNames = Get-Content -Path $FilePath

$FoldersPath = "C:\Users\Owner\Documents\GitHub\Powershell\TempFolders"


New-Item -Path $FoldersPath -Name $FolderNames[0] -ItemType Directory

# One way
foreach($name in $FolderNames){
    New-Item -Path $FoldersPath -Name $name -ItemType Directory
}

###############
# For loops

# Count up by 1
for($i=0; $i -lt 10; $i++){

    Write-Output $i
}

# Count up by 2
for($i=0; $i -lt 10; $i+=2){

    Write-Output $i
}


$TestArr=@("Steve", "Jen", "Tim")

# Looping through the array
for($i=0; $i -lt $TestArr.Length; $i++){
    Write-Output $TestArr[$i]
}

# Edititng the names
for($i=0; $i -lt $TestArr.Length; $i++){
    $TestArr[$i] += " Doe"
}

$TestArr

$TestArr=@("Steve", "Jen", "Tim")

# USE FOR EACH to modify output without editing elements
foreach($item in $TestArr){
    $item += ' Temp'
    Write-Output $item
}

$TestArr

#############
# While loops

Get-Date

while((Get-Date).minute -eq 16){
    Get-Date
}

while($true){
    Write-Output "Welcome to the parrot application"
    Write-Output "Enter 'q' to Exit"

    $input =Read-Host -Prompt "Please enter a phare"
    if($input -eq "q"){
        Write-Output "Polly says 'Bye Bye'"
        break
    }
    Write-Output "You entered: $input"
}


#Alternatively

Write-Output "Welcome to the parrot application"
Write-Output "Enter 'q' to Exit"

$input = Read-Host -Prompt "Please enter a phrase"

while($input -ne "q"){
    Write-Output "Polly Squawks: '$input'"
    $input = Read-Host -Prompt "Polly looks expectantly: ..."
    if($input -eq "q"){
        Write-Output "Polly says: 'Squaaakk!! dont leave'"
        break
    }
}


### DO while (runs while true)
# Singel output
do{
    Write-Output "Hi"
}while($false)


# Parrot app

Write-Output "Welcome to the parrot application"
Write-Output "Enter 'q' to Exit"

do{
    $input = Read-Host -Prompt "Please enter a phrase"
    Write-Output "Polly Squawks: '$input'"
}while($input -ne "q"){
    "'Squaaakk!! dont leave'"
}


## Do until (runs while false)

do{
    Write-Output "Hi"
}until($true)

# Parrot app

Write-Output "Welcome to the parrot application"
Write-Output "Enter 'q' to Exit"

do{
     $input = Read-Host -Prompt "Please enter a phrase"
     Write-Output "Polly Squawks: '$input'"
}until($input -eq "q"){
    "'Squaaakk!! dont leave'"
}


############### 
# Error handling

try{
    $FilePath = "C:\Users\Owner\Documents\GitHub\Powershell1"
    $Files = Get-ChildItem -Path $FilePath -ErrorAction Stop
    $files.foreach({
        Write-Output $-.name
    })
    Write-Output "this is after the error"
}catch{
    Write-Output $_.Exception.Message
}


# Specify error action per sesson

$ErrorActionPreference="Stop"

try{
    $FilePath = "C:\Users\Owner\Documents\GitHub\Powershell1"
    $Files = Get-ChildItem -Path $FilePath 
    $files.foreach({
        Write-Output $-.name
    })
    Write-Output "this is after the error"
}catch{
    Write-Output "Caught Error"
}

# Lists errors that occured in this session (Error Array)
$Error

# Most recent error indexed at 0
$Error[0]

# Try Catch Finally
$ErrorActionPreference="Stop"

try{
    $FilePath = "C:\Users\Owner\Documents\GitHub\Powershell1"
    $Files = Get-ChildItem -Path $FilePath 
    $files.foreach({
        Write-Output $-.name
    })
    Write-Output "this is after the error"
}catch{
    Write-Output "Caught Error"
}finally{
    Write-Output "This is always run no matter what"
}


###########
# Modules

# List of module directories
$($env:PSModulePath).split(";")

# Modules currenly loaded in session
Get-Module

Get-Module -ListAvailable

# Import module
Import-Module -Name ScheduledTasks

Get-Module

# View scheduled modules
Get-Command -Module ScheduledTasks

Get-ScheduledTask

Remove-Module ScheduledTasks

Import-Module -Name ScheduledTasks -Force

# Installing Modules
Find-Module -Name AzureAD

Import-Module AzureAD

Get-Module

Remove-Module AzureAD

Uninstall-Module -Name AzureAD

########### Find modules on PowerShell Galary and/or GitHub





