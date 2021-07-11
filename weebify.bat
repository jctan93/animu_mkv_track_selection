@echo off

echo "Creating new_folder!" & echo.

set workspace="new_folder"

mkdir %workspace%

set /p audio_track_to_keep="Enter audio track numbers that you wish to keep (delimited by commas if you wish to keep more than one, defaults to track 2): " ^
							|| SET "audio_track_to_keep=2" & echo.

set /p sub_track_to_keep="Enter subtitle track numbers that you wish to keep (delimited by commas if you wish to keep more than one, defaults to track 4): " ^
							|| SET "sub_track_to_keep=4" & echo.

set /p default_sub_track="Enter subtitle track to use as default (defaults to track 1): " ^
							|| SET "default_sub_track=1" & echo.

set /p default_audio_track="Enter audio track to use as default (defaults to track 1): " ^
							|| SET "default_audio_track=1" & echo.

FOR %%I in (*.mkv) DO (
	echo %%I
	mkvmerge --audio-tracks %audio_track_to_keep%  ^
	--subtitle-tracks %sub_track_to_keep% ^
	-o "new_folder\%%I" "%%I"
)

echo. & echo "Setting default subtitle track next!" & echo.

FOR %%I in (%workspace%/*.mkv) DO (
	echo %%I
	mkvpropedit "new_folder\%%I" --edit track:s%default_sub_track% --set flag-default=1 ^
	--edit track:a%default_audio_track% --set flag-default=1
)

