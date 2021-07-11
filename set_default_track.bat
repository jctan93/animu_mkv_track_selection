@echo on

set /p default_sub_track="Enter subtitle track to use as default (defaults to track 1): " ^
							|| SET "default_sub_track=1" & echo.

set /p default_audio_track="Enter audio track to use as default (defaults to track 1): " ^
							|| SET "default_audio_track=1" & echo.

FOR %%I in (*.mkv) DO (
	echo %%I
	mkvpropedit "%%I" ^
	--edit track:s1 --set flag-default=0 ^
	--edit track:a1 --set flag-default=0 ^
	--edit track:s%default_sub_track% --set flag-default=1 ^
	--edit track:a%default_audio_track% --set flag-default=1
)
