#!/bin/bash

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "Installation error"
}