for j in 12
####for j in 11 12 13 21 22 23 
do
cd $j

for k in mTNFaR2  sTNFaR2
do
cd $k

for i in {1..20..1}
do
cd $i

                        awk  '{print $1,  $2}' bond.dat  >  r_l.dat
                        awk  '{print $1,  $3}' bond.dat  >  mono_cis.dat
                        awk  '{print $1,  $4}' bond.dat  >  complex_cis.dat
                        awk  '{print $1,  $6}' bond.dat  >  clusterSize.dat
                        awk  '{print $1,  $7}' bond.dat  >  max_size.dat

#                       awk -v cis="$i" '{if (($1 > 33500000) && ($1 < 33700000)) {sum+=$2;n+=1;}} END{print cis, sum/n}' r_l.dat >> ../temp

cd ..
done

paste  1/clusterSize.dat 2/clusterSize.dat 3/clusterSize.dat 4/clusterSize.dat 5/clusterSize.dat 6/clusterSize.dat 7/clusterSize.dat 8/clusterSize.dat 9/clusterSize.dat 10/clusterSize.dat | awk ' { print $1, ($2+ $4+ $6+ $8+ $10+ $12+ $14+ $16+ $18+ $20)/(NF/2)  } ' > ave_cluster.dat

paste  1/max_size.dat 2/max_size.dat 3/max_size.dat 4/max_size.dat 5/max_size.dat 6/max_size.dat 7/max_size.dat 8/max_size.dat 9/max_size.dat 10/max_size.dat | awk ' { print $1, ($2+ $4+ $6+ $8+ $10+ $12+ $14+ $16+ $18+ $20)/(NF/2)  } ' > ave_max_cluster.dat

paste  1/r_l.dat 2/r_l.dat 3/r_l.dat 4/r_l.dat 5/r_l.dat 6/r_l.dat 7/r_l.dat 8/r_l.dat 9/r_l.dat 10/r_l.dat | awk ' { print $1, ($2+ $4+ $6+ $8+ $10+ $12+ $14+ $16+ $18+ $20 )/(NF/2)  } ' > ave_r_l.dat

paste  1/complex_cis.dat 2/complex_cis.dat 3/complex_cis.dat 4/complex_cis.dat 5/complex_cis.dat 6/complex_cis.dat 7/complex_cis.dat 8/complex_cis.dat 9/complex_cis.dat 10/complex_cis.dat | awk ' { print $1, ($2+ $4+ $6+ $8+ $10+ $12+ $14+ $16+ $18+ $20)/(NF/2)  } ' > ave_complex_cis.dat

paste  1/mono_cis.dat 2/mono_cis.dat 3/mono_cis.dat 4/mono_cis.dat 5/mono_cis.dat 6/mono_cis.dat 7/mono_cis.dat 8/mono_cis.dat 9/mono_cis.dat 10/mono_cis.dat | awk ' { print $1, ($2+ $4+ $6+ $8+ $10+ $12+ $14+ $16+ $18+ $20)/(NF/2)  } ' > ave_mono_cis.dat

cd ..
done

cd ..
done
