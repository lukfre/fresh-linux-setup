#!/bin/bash -e
# Sets up the HuggingFace Dataset cache dir
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Change default HuggingFace Dataset cache dir ?"
echo -n "   [y/*]: "
read hf_flag
if [ $hf_flag = 'y' ] || [ $hf_flag = 'Y' ]; then
    echo ">> Write the path to the new cache dir (e.g. /media/$USER/DATA/hf_cache):"
    read hf_path
    echo "# huggingface cache dir on DATA" >> ~/.bashrc
    printf "export HF_DATASETS_CACHE=\"$hf_path\"\n" >> ~/.bashrc
fi
