# Url's :
grep -o "\(\(https\?://\)\|\(www.\)\)[a-zA-Z0-9-]\+\(\.[[:alnum:]]\+\)*\(/[a-zA-Z0-9_]\+\)*" ./data.txt

# ip's :
grep -o "[[:digit:]]\{1,3\}\(\.[[:digit:]]\{1,3\}\)\{3\}" ./data.txt

# phone nums :
grep -o "\(+[[:digit:]]\)\?[[:digit:]]\{11,12\}" ./data.txt