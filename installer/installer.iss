; Inno Setup script for Nova Chat
; Run with Inno Setup Compiler (ISCC.exe) after dotnet publish has produced dist\NovaChat-<version>-win-x64\
; The build workflow passes the project's version with /DAppVersion=X.Y.Z; the default below is
; only used when the script is compiled by hand.
#ifndef AppVersion
  #define AppVersion "1.4.2"
#endif

[Setup]
AppName=Nova Chat
AppVersion={#AppVersion}
AppPublisher=Nova Chat
AppPublisherURL=https://github.com/lester9080626/nova-chat-win-releases
AppSupportURL=https://github.com/lester9080626/nova-chat-win-releases/issues
AppUpdatesURL=https://github.com/lester9080626/nova-chat-win-releases/releases
DefaultDirName={autopf}\Nova Chat
DefaultGroupName=Nova Chat
OutputDir=installer-output
OutputBaseFilename=NovaChat-{#AppVersion}-win-x64-setup
Compression=lzma2/ultra64
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=lowest
UninstallDisplayIcon={app}\WinFormsApp1.exe
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\dist\NovaChat-{#AppVersion}-win-x64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Icons]
Name: "{group}\Nova Chat"; Filename: "{app}\WinFormsApp1.exe"
Name: "{group}\{cm:UninstallProgram,Nova Chat}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Nova Chat"; Filename: "{app}\WinFormsApp1.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\WinFormsApp1.exe"; Description: "{cm:LaunchProgram,Nova Chat}"; Flags: nowait postinstall skipifsilent
