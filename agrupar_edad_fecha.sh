#!/bin/bash
# para agrupar por fecha_edad_dosis:

echo -n '"count",' > datos_nomivac_covid19_por_fecha_edad_y_dosis.csv
head -1 datos_nomivac_covid19.csv | awk -F, '{print $7","$11","$2","$14}' >> datos_nomivac_covid19_por_fecha_edad_y_dosis.csv
tail -n +2 datos_nomivac_covid19.csv | awk -F, '{print $7","$11","$2","$14}' | sort | uniq -c | sed 's/^ *//g; s/ /,/' >> datos_nomivac_covid19_por_fecha_edad_y_dosis.csv
# despues hay que poner comillas en el ultimo
sed -i -r 's/,orden_dosis/,"orden_dosis"/' datos_nomivac_covid19_por_fecha_edad_y_dosis.csv
