@echo off
setlocal enabledelayedexpansion
REM Script : Suppression propre du compte "Formation" et configuration de Windows 11
REM Nécessite les droits administrateur
 
REM 1. Vérifier l'existence du compte "Formation"
net user Formation >nul 2>&1
if !errorlevel! neq 0 (
    echo Le compte "Formation" n'existe pas. Création du compte...
    REM 1a. Création du compte s’il n’existe pas
    net user "Formation" /add /active:yes
    REM Désactiver l'expiration du mot de passe
    WMIC USERACCOUNT WHERE Name='Formation' SET PasswordExpires=False
    REM Ajouter au groupe Utilisateurs
    net localgroup "Utilisateurs" "Formation" /add
) else (
    echo Suppression du compte "Formation"...
    REM 2. Déconnexion éventuelle de l'utilisateur
    quser | find /i "Formation" >nul 2>&1
    if !errorlevel! equ 0 (
        echo Veuillez fermer toutes les sessions du compte "Formation" avant de continuer.
        pause
        exit /b
    )
    REM 3. Suppression du compte
    net user "Formation" /delete
 
    REM 4. Suppression du profil utilisateur (nettoyage complet)
    echo Suppression du profil utilisateur "Formation"...
    wmic path win32_userprofile where "localpath='C:\\Users\\Formation'" delete
 
    REM 5. Suppression manuelle si besoin (en cas d'échec)
    if exist "C:\Users\Formation" (
        echo Echec de suppression automatique du profil. Veuillez supprimer manuellement le dossier C:\Users\Formation (Shift + Suppr).
        pause
        exit /b
    )
 
    REM 6. Création du compte "Formation"
    echo Creation du compte "Formation"...
    net user "Formation" /add /active:yes
    REM Désactiver l'expiration du mot de passe
    WMIC USERACCOUNT WHERE Name='Formation' SET PasswordExpires=False
    REM 7. Ajouter le compte au groupe "Utilisateurs" (optionnel)
    net localgroup "Utilisateurs" "Formation" /add
 
)
 
 
REM 8. Configuration Windows 11 (exemple : afficher extensions, désactiver suggestions, etc.)
echo Configuration de Windows 11...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d "0"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /f /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /f /v "NoTileApplicationNotification" /t REG_DWORD /d "1"
 
REM 9. Copier les raccourcis Office sur le bureau public
copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word.lnk" "C:\Users\Public\Desktop" /Y
copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk" "C:\Users\Public\Desktop" /Y
copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" "C:\Users\Public\Desktop" /Y
 
echo Script termine. Veuillez ouvrir une session avec "Formation" pour finaliser la personnalisation.
pause
