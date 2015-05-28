//file_write(fname , str)
//writes the string to the file
//creates the file if it doesnt exist

fid=file_text_open_write(argument0)
file_text_write_string(fid,argument1)
file_text_close(fid)

