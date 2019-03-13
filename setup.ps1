$gitBinPath = "C:\Program Files\Git\bin"
$userDirectory = "C:\users\ronan.moriarty"

function Install-Msi($filePath) {
    $DataStamp = get-date -Format yyyyMMddTHHmmss
    $logFile = "$filePath-$DataStamp.log"
    $MSIArguments = @(
        "/i"
        ("""$filePath""")
        "/qn"
        "/norestart"
        "/L*v"
        $logFile
    )
    Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow
}

if(!(Test-Path $gitBinPath)) {
    Write-Host "Installing chocolatey packages..."
    choco install 7zip.install -y
    choco install chromedriver -y
    choco install docker-desktop -y
    choco install erlang -y
    choco install fiddler -y
    choco install git.install -y
    choco install GoogleChrome -y
    choco install MsSqlServer2014Express -y
    choco install nodejs.install -y
    choco install nunit.install -y
    choco install nvm -y
    choco install nuget.commandline -y
    choco install poshgit -y
    choco install rabbitmq -y
    choco install ruby -y
    choco install sql-server-management-studio -y
    choco install visualstudiocode -y
} else {
    Write-Host "Chocolatey packages already installed."
}

if (!(Test-Path "$gitBinPath\mintty.exe")) {
    Write-Host "Installing mintty..."
    Invoke-WebRequest -Uri 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mintty/mintty-1.1.3-msys.zip' -Outfile mintty-1.1.3-msys.zip
    7z e -y .\mintty-1.1.3-msys.zip -o"$gitBinPath"
    Remove-Item mintty-1.1.3-msys.zip
} else {
    Write-Host "Mintty already installed."
}

if($null -eq $env:HOME) {
    Write-Host "Setting HOME environment variable"
    [System.Environment]::SetEnvironmentVariable('HOME', $userDirectory, [System.EnvironmentVariableTarget]::User)
} else {
    Write-Host "HOME environment variable already set."
}

if(!(Test-Path "C:\Program Files (x86)\AWS SDK for .NET")) {
    Write-Host "Installing AWS Tools and SDK for .NET..."
    $msiFilePath = "$userDirectory\Downloads\AWSToolsAndSDKForNet.msi"
    Invoke-WebRequest -Uri 'https://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi' -OutFile $msiFilePath
    Install-Msi $msiFilePath
} else {
    Write-Host "AWS Tools and SDK for .NET already installed."
}