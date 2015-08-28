#! ruby -Ks

### File-name: dna.rb ###

require './dna-res-map'
require './dna-aa'

DnaResMap::dna_map_making('link_proto.txt', 'dna-5-1.fasta', 'res_map_result.txt')

Dna2AA_make::dna_file_for_aa('dna-5-1.fasta', 'dna2aa_result.txt')