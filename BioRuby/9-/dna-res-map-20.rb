#! ruby -Ks
require 'strscan'
require 'gdbm'

db = GDBM.open('DB_BIONET')
lib_file = File.open("link_bionet-dos.txt")

offset = lib_file.pos

lib_file.each("\n"){|line|
	column = line.split("\s")
	id = column[0]
	
	if id == nil or id == "REBASE" or id == "REBASE," or id == "Copyright" or id == "Rich" or id =~ /=/
	else
		
		db[id] = offset.to_s
	end
	offset = lib_file.pos
	print(" DB çÏê¨íÜ\n")
}
db.close
lib_file.close
