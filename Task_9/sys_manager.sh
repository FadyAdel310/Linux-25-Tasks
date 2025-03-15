#!/bin/bash

function getPermissions {
    read -p "Enter the filename: " fileName 
    if [[ -e $fileName ]]
    then
        Permissions=$(ls -l $fileName | cut -c 1-10)
        echo "Permissions for $fileName: $Permissions  "
    else
        echo "Invalid File , This File Is NOT Exist..!"
    fi
}

function changePermissions {
    read -p "Enter the filename: " fileName 
    if [[ -e $fileName ]]
    then
        read -p "Enter new Permissions : " newPermissions
        chmod $newPermissions $fileName
        echo "Permissions changed successfully."
    else
        echo "Invalid File , This File Is NOT Exist..!"
    fi
}

function compressFiles {
    read -p "Enter the file/directory name: " file
    if [[ -e $file ]]
    then
        echo "Choose compression type:"  
        echo "1. tar.gz"
        echo "2. zip"
        read -p "Enter choice: " choiceNum
        case $choiceNum in 
        1)
            newCompressedFile="$file.tar.gz"
            tar -czf $newCompressedFile $file
            echo "Compression successful: $newCompressedFile created.  " ;;
        2)
            newCompressed="$file.zip"
            if [[ -f $file ]] then
                zip $newCompressed $file
                echo "Compression successful: $newCompressed created.  "
            elif [[ -d $file ]] then
                zip -r $newCompressed $file
                echo "Compression successful: $newCompressed created.  "
            else
                echo "Invalid , This Path Is NOT file or directory..!"
            fi ;;
        *)
            echo "Invalid choice. Please enter valid option" ;;
        esac
    else
        echo "Invalid File , This File Is NOT Exist..!"
    fi
}

function decompressFiles {
    read -p "Enter the compressed file name: " file
    if [[ -e $file ]]
    then
        suffex=$(echo $file | rev | cut -d"." -f1 | rev)
        if [[ $suffex == "gz" ]] then
            tar -xzf $file
            echo "Extracting..."
            echo "Decompression successful."
        elif [[ $suffex == "zip" ]] then
            unzip $file
            echo "Extracting..."
            echo "Decompression successful."
        else
            echo "Invalid Type Of Compressed File ..!"
        fi
    else
        echo "Invalid File , This File Is NOT Exist..!"
    fi
}

echo "========== Linux System Manager =========="
echo "1. Show System Information"
echo "2. Check File Permissions"
echo "3. Change File Permissions"
echo "4. Compress a File/Directory"
echo "5. Decompress a File"
echo "6. Exit"
echo "=========================================="

read -p "Enter your choice: " choice

case $choice in
    1)
        echo "Current User: $(whoami)  " ;;
    2)
        getPermissions ;;
    3)
        changePermissions ;;
    4)
        compressFiles ;;
    5)
        decompressFiles ;;
    6)
        echo "Exiting the system manager. Goodbye!" ;;
    *)
        echo "Invalid choice. Please enter valid option [1..6]." ;;
esac