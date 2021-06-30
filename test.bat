mkdir new_folder

FOR %%I in (*.mkv) DO (
	echo %%I
	mkvmerge --audio-tracks 2  ^
	--subtitle-tracks 4 ^
	-o "new_folder\%%I" "%%I"
)

