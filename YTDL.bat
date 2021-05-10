@ECHO OFF
:top
title Youtube Downloader

SET /P URL=Please enter the video URL that you would like to use: 
ECHO -------------------------
ECHO URL=%URL%
ECHO -------------------------

SET /P choice="is this song? y/n "
if /I "%choice%"== "y" goto audio
if /I "%choice%"== "n" goto video


:audio
@echo off
echo     _   _   _ ____ ___ ___
echo    / \ ^| ^| ^| ^|  _ \_ _/ _ \
echo   / _ \^| ^| ^| ^| ^| ^| ^| ^| ^| ^| ^|
echo  / ___ \ ^|_^| ^| ^|_^| ^| ^| ^|_^| ^|
echo /_/   \_\___/^|____/___\___/
::"D:\Youtube Download Scripts\youtube-dlc.exe" -x --audio-format mp3 --prefer-ffmpeg -o D:/Music/%%(title)s-%%(id)s-.%%(ext)s -i --ignore-config --write-thumbnail %URL%
"D:\Youtube Download Scripts\youtube-dlc.exe" -f "bestaudio[ext=m4a]/best[ext=webm]" --audio-quality 0 -o D:/Music/%%(title)s-%%(id)s-.%%(ext)s -i --download-archive D:/Music/downloaded-audio.txt --ignore-config  --add-metadata --embed-thumbnail --write-info-json %URL%
::--write-thumbnail
pause
exit

:video
@echo off
ECHO __     _____ ____  _____ ___
echo \ \   / /_ _^|  _ \^| ____/ _ \
echo  \ \ / / ^| ^|^| ^| ^| ^|  _^|^| ^| ^| ^|
echo   \ V /  ^| ^|^| ^|_^| ^| ^|__^| ^|_^| ^|
echo    \_/  ^|___^|____/^|_____\___/
::"D:\Youtube Download Scripts\youtube-dlc.exe" -o D:/Videos/%%(title)s-%%(id)s-%%(format)s.%%(ext)s -i --ignore-config --write-thumbnail --hls-prefer-native %URL%
"D:\Youtube Download Scripts\youtube-dlc.exe" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -o D:/Videos/%%(title)s-%%(id)s-%%(format)s.%%(ext)s -i --download-archive D:/Videos/downloaded-videos.txt --ignore-config --add-metadata --embed-thumbnail --write-info-json --embed-subs --all-subs --hls-prefer-native %URL% 
::Ive noticed that webm has a tiny bit higher quality but in terms of size its 2x the size hence not worth keeping
pause
exit