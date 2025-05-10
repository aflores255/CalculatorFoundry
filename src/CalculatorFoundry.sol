// 1. License
// SPDX-License-Identifier: MIT

//2. Solidity version
pragma solidity 0.8.28;

//3. Contract

contract CalculatorFoundry {
    // Variables

    uint256 public result;
    address public admin;

    // Events

    event Addition(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);
    event Substraction(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);
    event Multiplier(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);
    event Division(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);

    // Modifier

    modifier onlyAdmin() {
        require(msg.sender == admin, "Unauthorized");
        _;
    }

    /**
     * @notice Constructor of smart contract
     * @param result_ result of the last operation
     * @param admin_ administrator of the smart contract
     */
    constructor(uint256 result_, address admin_) {
        result = result_;
        admin = admin_;
    }

    // Functions

    /**
     * @notice Function to sum two numbers
     * @param firstNumber_ first number for the addition
     * @param secondNumber_ second number for the addition
     * @return result_ result of the sum
     */
    function addition(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 result_) {
        result_ = firstNumber_ + secondNumber_;
        result = result_;

        emit Addition(firstNumber_, secondNumber_, result_);
    }

    /**
     * @notice Function to substract two numbers
     * @param firstNumber_ first number for the substraction
     * @param secondNumber_ second number for the substraction
     * @return result_ result of the substraction
     */
    function substraction(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 result_) {
        result_ = firstNumber_ - secondNumber_;
        result = result_;

        emit Substraction(firstNumber_, secondNumber_, result_);
    }

    /**
     * @notice Function to multiply two numbers
     * @param firstNumber_ first number for the multiplication
     * @param secondNumber_ second number for the multiplication
     * @return result_ result of the substraction
     */
    function multiplier(uint256 firstNumber_, uint256 secondNumber_) external onlyAdmin returns (uint256 result_) {
        result_ = firstNumber_ * secondNumber_;
        result = result_;

        emit Multiplier(firstNumber_, secondNumber_, result_);
    }

    /**
     * @notice Function to divide two numbers
     * @param firstNumber_ first number for the division
     * @param secondNumber_ second number for the division
     * @return result_ result of the division
     */
    function division(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 result_) {
        require(secondNumber_ != 0, "Cannot divide by zero");
        result_ = firstNumber_ / secondNumber_;
        result = result_;

        emit Division(firstNumber_, secondNumber_, result_);
    }
}
