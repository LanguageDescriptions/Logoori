/*

Pre-processing: copy button column, parse out FN only, then sort into fn.ft set, single file. First copy column, then split at ; then re-process, split at , keep left item (store into a standard file)

Actual work: for each fid, check is exists in repository, if not then tag it. Later, do a naball on those which are missing.

how do to fexist?
stream query exists fid returns full name else empty string. Annoying glitch: must ask 'query exists' not just 'exists' under regina

*/
outlist = 'mia_out.txt'
del outlist
inlist = 'extantsound.txt'
do while lines(inlist) > 0
	fid = linein(inlist)
	haveit = STREAM(fid,'c','EXISTS')
	if haveit= 0 then call lineout outlist,fid
end


