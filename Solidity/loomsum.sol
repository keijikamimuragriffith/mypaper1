// SPDX-License-Identifier: GPL-3.0
 pragma solidity >=0.8.2 <0.9.0;

contract LoopSum {
    // Public array to store numbers
    uint[] public numbers;
    // Loop through each number in the input array and append it to the public array
    function addNumbers(uint[] memory _numbers) public {
        for (uint i = 0; i < _numbers.length; i++) {
            numbers.push(_numbers[i]);
        }
        // Assertion to verify that the length of numbers matches the input array length after the loop
        assert(numbers.length == _numbers.length);
    }

    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }
}
