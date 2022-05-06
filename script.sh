for i in {1..10..1}
#####for i in 13 14 15 16

do

##     mkdir -p $i

       cd $i

        cp ../main.cpp .
        cp ../run.sh .
        sed -i -e 's/lectin/sTNF12/' run.sh

        g++ main.cpp -o out.o
        sbatch run.sh

cd ..
done

