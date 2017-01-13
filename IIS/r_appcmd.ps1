param(
  [string] $servers,#split with '::'
  [string] $parameter
)

$appcmd="C:\Windows\System32\inetsrv\appcmd.exe"
$script = $appcmd + " " + $parameter

$scriptBlock = [Scriptblock]::Create($script)


ForEach($server in $servers.Split("::", [System.StringSplitOptions]::RemoveEmptyEntries))
{
    Write-Host
    Write-Host "[$server]  $script"
	Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock
}
