
param(
    [string]$path=$(throw "Parameter missing: -path Path") ,
    [int]$xDaysBefore=30
)


$date = (Get-Date).AddDays(-1*$xDaysBefore)

Get-ChildItem -path $path | where { $_.CreationTime -lt $date } | Remove-Item -Recurse -Confirm:$false