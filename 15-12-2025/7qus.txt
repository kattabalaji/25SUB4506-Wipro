#!/bin/bash

echo "Enter first number:"
read a

echo "Enter second number:"
read b

echo "Enter expression (+ - * / %):"
read op

case $op in
    +)
        let result=a+b
        ;;
    -)
        let result=a-b
        ;;
    \*)
        let result=a*b
        ;;
    /)
        let result=a/b
        ;;
    %)
        let result=a%b
        ;;
    *)
        echo "Invalid operator"
        exit 1
        ;;
esac

echo "Result = $result"
