## CPCantalapiedra 2019

infile="$1";
max_seqs="$2";

if [ ! "$max_seqs" ]; then
	max_seqs="0";
fi;

awk -v max_seqs="$max_seqs" '
BEGIN{count=0;prev="";}
$0 ~ /^>/ {
    count+=1;
    if (prev!="") { printf "\t"prev"\n"; prev=""; }
    if (max_seqs && count>max_seqs) exit 0;
    printf $0;
}
$0 !~ /^>/ {
    prev = prev""$0;
}
END{
if (prev!="") { printf "\t"prev"\n"; prev=""; }
}' < "$infile"

## END
