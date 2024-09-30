##############################################
# Methods / Functions
##############################################

# Doing it once
# New-Item -Path $ConfigPath -Name "TestConfig1.cfg" -ItemType file


# Doing it more than once

$ConfigPath="C:\Users\Owner\Documents\GitHub\Powershell\Configs"

# Creating a function to make config files
function Create-Configuration{
    [CmdletBinding()]
    # Here we define the parameters to accept
    param(
        [Parameter(Mandatory, ValueFromPipeline)] # Explicitly allow pipelines
        [string]$Name,
        [Parameter()]
        [string]$Version='1.0.0', 
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
        [ValidateSet("Linux", "Windows")]
        [string]$OperatingSystem="Windows"
    )
    # To set up counter variables or create connections to database etc
    begin{
        Write-Verbose "Begin Block"
        $CounterPassed=0
        $CounterFailed=0
    }
    # This is where the main function occures
    process{
        try{
            Write-Verbose "Creating configeration for $Name with version $Version"
            New-Item -Path $Path -Name "$($Name).cfg" -ItemType file -ErrorAction Stop
            $Version | Out-File -filePath "$Path\$($Name).cfg" -Force
            $OperatingSystem | Out-File -filePath "$Path\$($Name).cfg" -Append -Force
            $CounterPassed++
        }catch{
            Write-Verbose $_.Exception.Message
            $CounterFailed++
        }  
        Write-Debug "Configerations created: $Counterpassed" 
        Write-Debug "Configeration failed: $CounterFailed"
    }
    # This is where we close out what we opened in Begin block (This runs even in the case of errors)
    end{
        Write-Verbose "End Block"
        Write-Output "Configerations created: $CounterPassed" 
        Write-Output "Configeration failed: $CounterFailed"
    }
}


# Calling the funciton once
# Create-Configuration -Name "TestConfig1" -Version "1.0.2" -OperatingSystem "Linux" -Path $ConfigPath


# Using function with high throughput
$Names=$("TestConfig1", "TestConfig2", "TestConfig3") 

$Names | Create-Configuration -Path $ConfigPath -Verbose -Debug










































