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

    event Addition(
        uint256 firstNumber_,
        uint256 secondNumber_,
        uint256 result_
    );
    event Substraction(
        uint256 firstNumber_,
        uint256 secondNumber_,
        uint256 result_
    );
    event Multiplier(
        uint256 firstNumber_,
        uint256 secondNumber_,
        uint256 result_
    );
    event Division(
        uint256 firstNumber_,
        uint256 secondNumber_,
        uint256 result_
    );

    // Modifier

    modifier onlyAdmin() {
        require(msg.sender == admin, "Unauthorized");
        _;
    }

    // Constructor
    constructor(uint256 result_, address admin_) {
        result = result_;
        admin = admin_;
    }

    // Functions

    // 1. Addition

    function addition(
        uint256 firstNumber_,
        uint256 secondNumber_
    ) external returns (uint256 result_) {
        result_ = firstNumber_ + secondNumber_;
        result = result_;

        emit Addition(firstNumber_, secondNumber_, result_);
    }

    // 2. Substraction
    function substraction(
        uint256 firstNumber_,
        uint256 secondNumber_
    ) external returns (uint256 result_) {
        result_ = firstNumber_ - secondNumber_;
        result = result_;

        emit Substraction(firstNumber_, secondNumber_, result_);
    }

    // 3. Multiply

    function multiplier(
        uint256 firstNumber_,
        uint256 secondNumber_
    ) external onlyAdmin returns (uint256 result_) {
        result_ = firstNumber_ * secondNumber_;
        result = result_;

        emit Multiplier(firstNumber_, secondNumber_, result_);
    }

    // 4. Division

    function division(
        uint256 firstNumber_,
        uint256 secondNumber_
    ) external returns (uint256 result_) {
        result_ = firstNumber_ / secondNumber_;
        result = result_;

        emit Division(firstNumber_, secondNumber_, result_);
    }
}
