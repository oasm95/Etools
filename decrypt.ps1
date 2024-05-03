function decryptfile{
    param(
        [string]$encryptedfile,
        [byte[]]$keyb
    )

    $fullenc = Get-Content $encryptedfile
    $s = $fullenc -split ':'
    $plaintextfull = ''
    foreach($part in $s)
    {
        Write-Host $part.Length
        $SecureString =  $part | ConvertTo-SecureString -Key $keyb
        $PlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString))
        $plaintextfull = $plaintextfull + $PlainText
    }
    return $plaintextfull
}