# vardSwap
Script to swap and reformat historical spelling variant and modern equivalent in VARD output

This script assumes the XML format described in the VARD documentation e.g.
```
<normalised orig="Raigne" auto="false">Reign</normalised>
```

Converted output will be:
```
<normalised reg="Reign" auto="false">Raigne</normalised>
```
or:
```
<w><choice><reg>Reign</reg><orig>Raigne</orig></choice></w>
```
depending on which line you comment out.

# Running instructions
To run type:
```
perl vardSwap.pl input.txt output.txt
```
