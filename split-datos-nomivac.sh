#!/bin/bash
mkdir -p datos_nomivac
awk -F, '
FNR==1 { hdr=$0; next}
{
    filename = $7
    gsub("\"", "", filename)
    gsub(" ", "_", filename)
    out = "./datos_nomivac/datos_nomivac_covid19_" filename ".csv"
    if (!seen[out]++) {
        print hdr > out
    }
    print >> out
    close(out)
}
' datos_nomivac_covid19.csv
