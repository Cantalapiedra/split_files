## CPCantalapiedra

infasta="$1";
#infile="$1";
num_files="$2";
outdir="$3";
prefix="$4";

# 1. #######################
# convert fasta files to tsv

infile="$infasta".tsv;

fasta_to_tsv.sh "$infasta" > "$infile"

# 2. ###############
# create split files

if [ ! "$prefix" ]; then
	prefix="spf";
fi;

if [ -d "$outdir" ]; then
	printf "$outdir already exists. Please, remove it before proceeding.\n" 1>&2;
	exit 1;
else
	mkdir "$outdir";
fi;

##

printf "Computing total lines in $infile...\n" 1>&2;

total_lines=$(wc -l <${infile});

printf "Total lines $total_lines\n" 1>&2;

##

((lines_per_file = (total_lines + num_files - 1) / num_files))

printf "Lines per file $lines_per_file\n" 1>&2;

##

printf "Splitting files...\n" 1>&2;

split -l "$lines_per_file" "$infile" "$outdir"/"$prefix"

printf "Files were splitted.\n" 1>&2;

## show num of files of each size

printf "Num_lines\tnum_files\n" 1>&2;
for spfile in $(ls "$outdir"/"$prefix"*); do
	wc -l "$spfile";
done | 
awk '{print $1}' | sort | uniq -c | awk '{print $2"\t"$1}' 1>&2

rm "$infile";

# 3. #########################
# convert split files to fasta

tsv_to_fasta.sh "$outdir" "$prefix"

## END
