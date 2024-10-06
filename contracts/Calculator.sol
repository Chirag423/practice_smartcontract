//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.2;

contract Calculator{
    int256 result = 0;

    function add(int256 num) public {
        result += num;
    }

    function sub(int256 num) public {
        result -= num;
    }

    function mul(int256 num) public {
        result *= num;
    }

    function div(int256 num) public {
        result /= num;
    }

    function get() public view returns(int){
        return result;
    }
}