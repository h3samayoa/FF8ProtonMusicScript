#! /bin/bash

echo "READ PREREQS IN README" 

cmdArr=("winetricks" "python3-pip" "python3-setuptools" "python3-venv")

for cmd in ${cmdArr[@]}; do 
	if [ -x "$(command -v $cmd)" ]; then
		echo "$cmd is installed yay"
	else
		read -n1 -p "Would you like to install $cmd? (it is needed)" wt
		case $wt in
			y|Y) echo -e "\n$(sudo apt-get install $cmd)" ;;
			n|N) exit 1 ;; 
			*) exit 1 ;;
		esac
	fi 	
done

read -n1 -p "would you like to install pipx and protontricks? (these are needed to install directmusic)" ppt
case $ppt in
	y|Y) echo -e "\n $(python3 -m pip install --user pipx) \n$(pip install pipx)" ;; 
	n|N) echo -e "\nok!" ;;
	*) echo exit 1 ;;
esac 

echo $(pipx install protontricks) 

echo $(protontricks 39150 directmusic)





