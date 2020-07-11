"""
    check_MD5( file_path, checksum )
returns a MD5 hash from a file location.
Note: this converts Int8 representations to comma delimitted strings.
"""
get_MD5( file_path ) =  join( string.( open(md5, file_path) ), "," )

"""
    check_MD5( file_path, checksum )
Checks the result of an MD5 hash vs a stored checksum.
Note: this converts Int8 representations to comma delimitted strings.
"""
check_MD5( file_path, check_sum ) = get_MD5( file_path ) == check_sum
