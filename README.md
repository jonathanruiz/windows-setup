# windows-setup

This script will setup the computer and terminal environment with the preferred software, themes and terminal configuration.

Here is the setup required to run the code in this repository:

1. Download the repository and extract the files.
2. Run `Terminal` as an Administrator.
3. Change the directory to where the extracted files are. Example:

```
cd ~/Downloads/windows-setup
```

4. Run the follow commands:

```powershell
Set-ExecutionPolicy RemoteSigned
./setup.ps1
```

This will then automatically install the configurations and once the script is complete, your environment is ready to go.
