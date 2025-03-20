// 1. License
// SPDX-License-Identifier: MIT

//2. Solidity version
pragma solidity 0.8.28;

//3. Contract

import "forge-std/Test.sol";
import "../src/CalculatorFoundry.sol";

contract CalculatorTest is Test {
    CalculatorFoundry calculatorFoundry;
    uint256 public firstResult = 288;
    address public admin = vm.addr(1);
    address public randomUser = vm.addr(2);

    //Setup
    function setUp() public {
        calculatorFoundry = new CalculatorFoundry(firstResult, admin);
    }

    //Unit test

    //test Assignation
    function testCheckNumber() public view {
        uint256 firstResult_ = calculatorFoundry.result();
        assert(firstResult_ == firstResult);
    }

    //test addition

    function testAdd() public {
        uint256 firstNumber_ = 8;
        uint256 secondNumber_ = 2;

        uint256 resultado_ = calculatorFoundry.addition(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ + secondNumber_);
    }

    // test substraction
    function testSubstract() public {
        uint256 firstNumber_ = 4;
        uint256 secondNumber_ = 2;

        uint256 resultado_ = calculatorFoundry.substraction(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ - secondNumber_);
    }

    // test not admin multiplier
    function testAdminNotAllowedMultiply() public {
        vm.startPrank(randomUser);
        uint256 firstNumber_ = 10;
        uint256 secondNumber_ = 2;
        vm.expectRevert();
        calculatorFoundry.multiplier(firstNumber_, secondNumber_);

        vm.stopPrank();
    }

    // test admin multiplier

    function testAdminAllowedMultiply() public {
        vm.startPrank(admin);
        uint256 firstNumber_ = 10;
        uint256 secondNumber_ = 2;
        calculatorFoundry.multiplier(firstNumber_, secondNumber_);

        vm.stopPrank();
    }

    // test correct multiplier

    function testCorrectMultiply() public {
        vm.startPrank(admin);
        uint256 firstNumber_ = 10;
        uint256 secondNumber_ = 2;
        uint256 result_ = calculatorFoundry.multiplier(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ * secondNumber_);

        vm.stopPrank();
    }

    //test division
    function testDivision() public {
        uint256 firstNumber_ = 10;
        uint256 secondNumber_ = 2;

        uint256 resultado_ = calculatorFoundry.division(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ / secondNumber_);
    }

    //test divisionZero

    function testZeroDivision() public {
        uint256 firstNumber_ = 10;
        uint256 secondNumber_ = 0;

        vm.expectRevert();

        calculatorFoundry.division(firstNumber_, secondNumber_);
    }

    //Fuzzing tests

    // Fuzzing division

    function testFuzzingDiv(uint256 firstNumber_, uint256 secondNumber_) public {
        calculatorFoundry.division(firstNumber_, secondNumber_);
    }

    // Fuzzing Addition

    function testFuzzingAddition(uint256 firstNumber_, uint256 secondNumber_) public {
        uint256 result_ = calculatorFoundry.addition(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ + secondNumber_);
    }

    // Fuzzing Substraction

    function testFuzzingSubstraction(uint256 firstNumber_, uint256 secondNumber_) public {
        uint256 result_ = calculatorFoundry.substraction(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ - secondNumber_);
    }

    // Fuzzing Multiplier

    function testFuzzingMultiply(uint256 firstNumber_, uint256 secondNumber_) public {
        vm.startPrank(admin);

        uint256 result_ = calculatorFoundry.multiplier(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ * secondNumber_);

        vm.stopPrank();
    }

    // Fuzzing Division not by Zero

    function testFuzzingDivNotZero(uint256 firstNumber_, uint256 secondNumber_) public {
        vm.assume(secondNumber_ != 0);
        uint256 resultado_ = calculatorFoundry.division(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ / secondNumber_);
    }
}
