#define MyAppName "${project.name} ${parsedVersion.majorVersion}.${parsedVersion.minorVersion}"

[Files]
Source: ${project.name}\*; DestDir: {app}; Flags: recursesubdirs createallsubdirs; MinVersion: 0,5.0.2195
[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\startplayer.bat; WorkingDir: {app}\; IconFilename: {app}\player.ico; Comment: Facilia AB {#MyAppName}; MinVersion: 0,5.0.2195; Flags: createonlyiffileexists runminimized closeonexit
Name: {group}\Uninstall {#MyAppName}; Filename: {app}\UninsHs.exe; MinVersion: 0,5.0.2195; Flags: createonlyiffileexists
Name: {userdesktop}\{#MyAppName}; Filename: {app}\startplayer.bat; WorkingDir: {app}\; IconFilename: {app}\player.ico; Comment: Facilia AB {#MyAppName}; MinVersion: 0,5.0.2195; Flags: createonlyiffileexists runminimized closeonexit

[Setup]
AppName={#MyAppName}
AppCopyright=Facilia AB
AppPublisher=Facilia AB
AppPublisherURL=http://www.facilia.se/
AppVerName=${project.name} ${project.version}
OutputBaseFilename=${installer.filename.64bits}
OutputDir=${project.build.directory}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
VersionInfoVersion=${parsedVersion.majorVersion}.${parsedVersion.minorVersion}.${parsedVersion.incrementalVersion}.

ShowLanguageDialog=no

MinVersion=0,5.0.2195
DefaultDirName={pf}\{#MyAppName}

VersionInfoCompany=Facilia AB
ExtraDiskSpaceRequired=204800
ChangesAssociations=yes
DefaultGroupName=Facilia
WizardImageFile=setupLogoBig.bmp
WizardSmallImageFile=setupLogoSmall.bmp
LicenseFile=EULA.rtf
Encryption=false
ShowTasksTreeLines=true

[Languages]
Name: en; MessagesFile: compiler:Default.isl
                                             
[UninstallDelete]
Type: filesandordirs; Name: {app}\UninsHs.dat
Type: filesandordirs; Name: {userappdata}\{#MyAppName}

[INI]
FileName: {app}\UninsHs.dat; Section: Common; Key: Software; String: {#MyAppName}
FileName: {app}\UninsHs.dat; Section: Common; Key: Install; String: {srcexe}
FileName: {app}\UninsHs.dat; Section: Common; Key: Language; String: {language}
FileName: {app}\UninsHs.dat; Section: Common; Key: Remove; String: {uninstallexe}
FileName: {app}\UninsHs.dat; Section: Common; Key: Group; String: {groupname}
FileName: {app}\UninsHs.dat; Section: Common; Key: Components; String: {code:ComponentList|x}
FileName: {app}\UninsHs.dat; Section: Common; Key: Uninstall; String: AppId
FileName: {app}\UninsHs.dat; Section: Common; Key: Dir; String: {app}

[Run]
Filename: {app}\UninsHs.exe; Parameters: /r; Flags: runminimized
Filename: {app}\startplayer.bat; Description: {cm:LaunchProgram,{#MyAppName}}; Flags: nowait postinstall skipifsilent

[CustomMessages]
LaunchProgram=Start {#MyAppName} after finishing installation

[Components]

[Registry]
Root: HKCR; Subkey: .eco; ValueType: string; ValueName: ; ValueData: Ecofile; Flags: uninsdeletevalue
Root: HKCR; Subkey: Ecofile; ValueType: string; ValueName: ; ValueData: Facilia AB Ecolego Project File; Flags: uninsdeletekey
Root: HKCR; Subkey: Ecofile\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\eco.ico,0
Root: HKCR; Subkey: Ecofile\shell\open\command; ValueType: string; ValueName: ; ValueData: "{app}\startplayer.bat -file %1"
Root: HKCR; Subkey: .eas; ValueType: string; ValueName: ; ValueData: Easfile; Flags: uninsdeletevalue
Root: HKCR; Subkey: Easfile; ValueType: string; ValueName: ; ValueData: Facilia AB Ecolego Assessment File; Flags: uninsdeletekey
Root: HKCR; Subkey: Easfile\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\eas.ico,0
Root: HKCR; Subkey: Easfile\shell\open\command; ValueType: string; ValueName: ; ValueData: "{app}\startplayer.bat -file %1"

[Code]
    function ComponentList(Default: string):string;
    begin
      Result := WizardSelectedComponents(False);
    end;

    function ShouldSkipPage(CurPage: Integer): Boolean;
    begin
      if Pos('/SP-', UpperCase(GetCmdTail)) > 0 then
        case CurPage of
          wpWelcome, wpLicense, 
          wpSelectDir, wpInfoAfter:
            Result := True;
        end;
    end;
