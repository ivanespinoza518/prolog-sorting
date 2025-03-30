# Sorting Algorithms in Prolog

This project contains Prolog implementations for various **sorting algorithms** including **Selection Sort**, **Merge Sort**, and generating random lists of numbers for testing. The following features are provided:

## Features
1. **Random List Generator (rl/3)**
    - **rl(N, R, L)**: Generates a random list `L` of `N` numbers within a given range `[0, R)`.

2. **Selection Sort (selection_sort/2)**
    - **selection_sort(L, M)**: Implements the selection sort algorithm to sort a list `L` of numbers and store the result in `M`.

3. **Merge Sort (merge_sort/2)**
    - **merge_sort(L, M)**: Implements the merge sort algorithm to sort a list of numbers `L` and store the result in `M`.

4. **Sorted List Checker (is_sorted/1)**
    - **is_sorted(L)**: Checks whether a list `L` is sorted in ascending order.

## Usage

1. **Random List Generation**
    ```prolog
    ?- rl(10, 100, L).
  - This will generate a list L of 10 random numbers between 0 and 100.

2. **Check if a List is Sorted**
    ```prolog
    ?- is_sorted(L).
  - Where L is the list you want to check.

3. **Selection Sort**
    ```prolog
    ?- selection_sort(L, M).
  - Where L is the list to be sorted and M will be the sorted list.

4. **Merge Sort**
    ```prolog
    ?- merge_sort(L, M).
  - Where L is the list to be sorted and M will be the sorted list.

## Example
- Below is an example of the program being run:
    ```prolog
    ?- rl(10, 100, L), writeln(L), selection_sort(L, Sorted), writeln(Sorted).
    [29,51,51,81,88,99,57,92,42,98]
    [29,42,51,51,57,81,88,92,98,99]
- This will generate a random list of 10 numbers, print the unsorted list, sort it using selection sort, and print the sorted list.

## Requirements
- SWI-Prolog (or any other Prolog environment that supports standard Prolog predicates).
