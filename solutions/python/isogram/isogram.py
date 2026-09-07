def is_isogram(string):
    return \
        len( { c.lower() for c in string if c.isalpha() } ) == \
        len( [ c.lower() for c in string if c.isalpha() ] )
