## CPCantalapiedra 2019

indir="$1";
prefix="$2";

if [ ! "$prefix" ]; then
        prefix="spf";
fi;

outdir="$indir";

for spf in $(ls "$indir"/"$prefix"*); do 
	printf "$spf" 1>&2;
	spbase=$(basename "$spf");
	outfile="$outdir/$spbase.faa";
	printf " --> " 1>&2;
	cat "$spf" | awk '{printf $1"\n"$2"\n"}' > "$outfile";
	printf "$outfile\n" 1>&2;
	printf "$outfile\n";
	rm "$spf";
done

printf "Finished.\n" 1>&2;

## END
