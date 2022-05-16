echo "*******************************************************"
echo "Welcome!"
echo "Authors: Eashan & Chaitanya"
echo "Towards an Efficient Knowledge Graph Embedding Harness"
echo "*******************************************************"
echo ""
echo "[Model Training]"
echo "Choose an option:"
echo "1. TransE"
echo "2. TransR"
echo "3. TransH"
echo "4. Distmult"
echo "5. ComplEx"
echo "6. SimplE"
echo ""
echo ""
read option
echo "You have selected Option: $option"
echo ""
echo ""
echo "Enter the dataset for training: {FB15k/WN18}"
read d
echo "Enter the Epochs for training {recomended 300}"
read n
echo ""
echo ""

cd main

echo $(pwd)
curr_pth=$(pwd)
echo ${curr_pth::-3}

echo " "

if [[ "$option" == 1 ]]; then
	echo "Training TransE model, hang-tight ..."
	python3.6 transE.py -d $d -n $n

elif [[ "$option" == 2 ]]; then
	echo "Training TransR model, hang-tight ..."
	python3.6 transR.py -d $d -n $n

elif [[ "$option" == 3 ]]; then
	echo "Training TransH model, hang-tight ..."
	python3.6 transH.py -d $d -n $n

elif [[ "$option" == 4 ]]; then
	echo "Training distmult model, hang-tight ..."
	cd src
	python3.6 train.py --ent ${curr_pth::-3}/dat/wordnet-mlj12/train.entlist --rel ${curr_pth::-3}/dat/wordnet-mlj12/train.rellist --train ${curr_pth::-3}/dat/wordnet-mlj12/wordnet-mlj12-train.txt --valid ${curr_pth::-3}/dat/wordnet-mlj12/wordnet-mlj12-valid.txt --mode pairwise --method distmult
	cd ..

elif [[ "$option" == 5 ]]; then
	echo "Training complex model, hang-tight ..."
	# curr_pth=$(pwd)
	cd src
	python3.6 src/train.py --ent $curr_pth/dat/wordnet-mlj12/train.entlist --rel $curr_pth/dat/wordnet-mlj12/train.rellist --train $curr_pth/dat/wordnet-mlj12/wordnet-mlj12-train.txt --valid $curr_pth/dat/wordnet-mlj12/wordnet-mlj12-valid.txt --mode pairwise --method complex
	cd ..

elif [[ "$option" == 6 ]]; then
	echo "NotImplementedError" 

fi

cd ..




