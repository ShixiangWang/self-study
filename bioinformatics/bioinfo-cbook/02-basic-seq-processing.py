# Ref: https://github.com/PacktPublishing/Bioinformatics-with-Python-Cookbook-Second-Edition/blob/master/Chapter02/Basic_Sequence_Processing.ipynb

from Bio import Entrez, Seq, SeqIO

Entrez.email = "w_shixiang@163.com"

hdl = Entrez.efetch(
    db='nucleotide',
    id=['NM_002299'],
    rettype='fasta'
)

# Read seqs from handler
seq = SeqIO.read(hdl, 'fasta')

# Subset seqs
w_seq = seq[11:5795]
w_seq

# Write seqs
w_hdl = open('example.fasta', 'w')
SeqIO.write([w_seq], w_hdl, 'fasta')
w_hdl.close()

# Read seqs from file
recs = SeqIO.parse('example.fasta', 'fasta')
for rec in recs:
    seq = rec.seq
    print(rec.description)
    print(seq[:10])

seq

# Generate seq object from string
seq = Seq.Seq(str(seq))

# Operations
print((seq[:12], seq[-12:]))
rna = seq.transcribe()
rna

prot = seq.translate()
prot

