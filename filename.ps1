
Get-ChildItem -path "D:\Desktop\PDF"  -Recurse -Filter *.PDF | #dir where all PDF's are visible
Foreach-Object { #loop through each file

$filename =  $_.FullName
$seperator1 = '-1 .PDF'
$seperator2 = 'Page'
$dash = '-'


$split1 = ($filename -split $seperator2)[1]
$split2 = ($split1 -split $seperator1)[0]

$digit1 = ($split2 -split $dash)[1] #second number
$digit2 = ($split2 -split $dash)[0] #first number


#minuend 
$number = $digit2 -as [int]
#subtrahend 
$number2 = $digit1 -as [int]


$difference = $number2 - $number
$differenceString =  $difference -as [string]

Get-ChildItem -Path "D:\Desktop\PDF\" -Filter "*.pdf" | Rename-Item -NewName { $_.BaseName.Replace($split2,'0-' + $differenceString) + $_.Extension }

}

