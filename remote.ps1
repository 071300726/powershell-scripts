param(
  [string] $servers,
  [string] $script
)


$scriptBlock = [Scriptblock]::Create($script)


ForEach($server in $servers.Split("::", [System.StringSplitOptions]::RemoveEmptyEntries))
{
    Write-Host
    Write-Host "[$server]  $script"
	Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock
}
