param(
  [string] $servers,
  [string] $apppool,
  [string] $action
)

$appcmd="C:\Windows\System32\inetsrv\appcmd.exe"
#C:\Windows\System32\inetsrv\appcmd.exe start apppool /apppool.name:campuscore
$script = $appcmd + " " + $action + " apppool /apppool.name:" + $apppool

$scriptBlock = [Scriptblock]::Create($script)


ForEach($server in $servers.Split("::", [System.StringSplitOptions]::RemoveEmptyEntries))
{
	$server + ": " + $script
	Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock
}

