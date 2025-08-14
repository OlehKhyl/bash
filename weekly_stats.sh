#! /usr/bin/bash

values=($(tail -7 ./synthetic_historical_fc_accuracy.tsv | cut -d$'\t' -f6))

min_val=${values[0]}
max_val=${values[0]}

for i in ${values[@]};do
    if (( $i < $min_val ));then
        min_val=$i
    fi

    if (( $i > $max_val ));then
        max_val=$i
    fi
done

echo "min acc = $min_val"
echo "max acc = $max_val"
