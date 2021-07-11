# animu_mkv_track_selection

Batch script to remove unwanted english dub tracks (YUCK), and to set the default subtitle track.
If you're unsure what track info to use, open up the video in MPCHC > right-click > properties > mediainfo.
The defaults should work fine for most cases but there might be some exceptions that require different track values

weebify.bat will create a folder called new_folder and will create the newly multiplexed files inside as the original files cannot be overwritten

set_default_track.bat does in place default audio/subtitle track modifying
