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
echo "7. Exit"
echo ""
echo ""
read option
echo "You have selected Option: $option"
# read -s -p 'You have selected Option: '
echo ""
echo ""

while ["$option" != 7]
do
	echo "Enter the dataset for training {1. FB15k / 2. WN18}: "
	read nd
	if [["$nd" == 1]]; then
		d="FB15k"
	elif [["$nd == 2"]]; then
		d="WN18"
	fi
	
	echo "Enter the Epochs for training {recommended: 300}: "
	read n
	echo ""
	echo ""

	cd main

	echo $(pwd)
	curr_pth=$(echo $(pwd) | sed -e "s/\/[^\/]*$//")
	echo $curr_pth

	if [[ "$option" == 1 ]]; then
		echo "Training TransE model, hang-tight ..."
		# if [[ ! -e $dir ]]; then
		# 	mkdir $dir
		# elif [[ ! -d $dir ]]; then
		# 	echo "$dir already exists but is not a directory" 1>&2
		# fi
		mkdir -p result
		mkdir -p result/$d
		mkdir -p model
		mkdir -p model/$d
		python3 transE.py -d $d -n $n
		echo "TransE Training completed!"

	elif [[ "$option" == 2 ]]; then
		echo "Training TransR model, hang-tight ..."
		# if [[ ! -e $dir ]]; then
		# 	mkdir $dir
		# elif [[ ! -d $dir ]]; then
		# 	echo "$dir already exists but is not a directory" 1>&2
		# fi
		mkdir -p result
		mkdir -p result/$d
		mkdir -p model
		mkdir -p model/$d
		python3 transR.py -d $d -n $n
		echo "TransR Training completed!"

	elif [[ "$option" == 3 ]]; then
		echo "Training TransH model, hang-tight ..."
		# if [[ ! -e $dir ]]; then
		# 	mkdir $dir
		# elif [[ ! -d $dir ]]; then
		# 	echo "$dir already exists but is not a directory" 1>&2
		# fi
		mkdir -p result
		mkdir -p result/$d
		mkdir -p model
		mkdir -p model/$d
		python3 transH.py -d $d -n $n
		echo "TransH Training completed!"

	elif [[ "$option" == 4 ]]; then
		echo "Training distmult model, hang-tight ..."
		cd src

		if  [["$d" == "FB15k"]]; then
		python3 train.py --ent ${curr_pth}/main/dat/FB15k/train.entlist --rel ${curr_pth}/main/dat/FB15k/train.rellist --train ${curr_pth}/main/dat/FB15k/freebase_mtr100_mte100-train.txt --valid ${curr_pth}/main/dat/FB15k/freebase_mtr100_mte100-valid.txt --mode pairwise --method distmult --epoch $n
		else
		python3 train.py --ent ${curr_pth}/main/dat/wordnet-mlj12/train.entlist --rel ${curr_pth}/main/dat/wordnet-mlj12/train.rellist --train ${curr_pth}/main/dat/wordnet-mlj12/wordnet-mlj12-train.txt --valid ${curr_pth}/main/dat/wordnet-mlj12/wordnet-mlj12-valid.txt --mode pairwise --method distmult --epoch $n
		fi
		cd ..

	elif [[ "$option" == 5 ]]; then
		echo "Training complex model, hang-tight ..."
		cd src

		if  [["$d" == "FB15k"]]; then
		python3 train.py --ent ${curr_pth}/main/dat/FB15k/train.entlist --rel ${curr_pth}/main/dat/FB15k/train.rellist --train ${curr_pth}/main/dat/FB15k/freebase_mtr100_mte100-train.txt --valid ${curr_pth}/main/dat/FB15k/freebase_mtr100_mte100-valid.txt --mode pairwise --method complex --epoch $n
		else
		python3 train.py --ent ${curr_pth}/main/dat/wordnet-mlj12/train.entlist --rel ${curr_pth}/main/dat/wordnet-mlj12/train.rellist --train ${curr_pth}/main/dat/wordnet-mlj12/wordnet-mlj12-train.txt --valid ${curr_pth}/main/dat/wordnet-mlj12/wordnet-mlj12-valid.txt --mode pairwise --method complex --epoch $n
		fi
		cd ..

	elif [[ "$option" == 6 ]]; then
		echo "NotImplementedError" 

	fi
done

# Exit
cd ..