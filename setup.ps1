$gitBinPath = "C:\Program Files\Git\bin"

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
    [System.Environment]::SetEnvironmentVariable('HOME', 'C:\users\ronan.moriarty', [System.EnvironmentVariableTarget]::User)
} else {
    Write-Host "HOME environment variable already set."
}