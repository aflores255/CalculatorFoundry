# 🧮 CalculatorFoundry Smart Contract

## 📌 **Description**
The **CalculatorFoundry** is a smart contract written in Solidity that provides basic arithmetic functions: addition, subtraction, multiplication, and division. Additionally, it includes access control on multiplication, allowing only the admin to execute this operation.

This contract was developed and tested using **Foundry**, a powerful tool for testing smart contracts in Solidity.

---

## 🚀 **Features**
| **Feature** | **Description** |
|------------------|---------------|
| ➕ **Addition** | Adds two numbers and emits an event with the result. |
| ➖ **Subtraction** | Subtracts two numbers and emits an event with the result. |
| ✖️ **Multiplication** | Multiplies two numbers, restricted to admin only. |
| ➗ **Division** | Divides two numbers and emits an event with the result. |
| 🔐 **Access Control** | Only the admin can perform multiplication. |

---

## 📜 **Contract Details**

### 🔑 **Modifiers**
| **Modifier** | **Description** |
|-------------|----------------|
| **`onlyAdmin`** | Restricts access to multiplication to the admin only. |

### 📡 **Events**
| **Event** | **Description** |
|-----------|----------------|
| **`Addition`** | Emitted when an addition is performed. |
| **`Subtraction`** | Emitted when a subtraction is performed. |
| **`Multiplier`** | Emitted when a multiplication is performed. |
| **`Division`** | Emitted when a division is performed. |

### 🔧 **Contract Functions**

| **Function** | **Description** |
|------------|----------------|
| **`addition(uint256 firstNumber_, uint256 secondNumber_)`** | Adds two numbers and emits the `Addition` event. |
| **`subtraction(uint256 firstNumber_, uint256 secondNumber_)`** | Subtracts two numbers and emits the `Subtraction` event. |
| **`multiplier(uint256 firstNumber_, uint256 secondNumber_)`** | Multiplies two numbers and emits the `Multiplier` event. Only the admin can execute it. |
| **`division(uint256 firstNumber_, uint256 secondNumber_)`** | Divides two numbers and emits the `Division` event. |

---

## 🧪 **Testing with Foundry**
The contract has been tested using Foundry. The **CalculatorTest.t.sol** file includes unit tests to verify the contract's functionality.

### ✅ **Implemented Tests**
| **Test** | **Description** |
|-----------|----------------|
| **`testCheckNumber`** | Verifies that the initial result value is as expected. |
| **`testAdd`** | Tests the addition function. |
| **`testSubtract`** | Tests the subtraction function. |
| **`testAdminNotAllowedMultiply`** | Ensures that a non-admin user cannot multiply. |
| **`testAdminAllowedMultiply`** | Ensures that the admin can execute multiplication. |
| **`testCorrectMultiply`** | Verifies that the multiplication result is correct. |
| **`testDivision`** | Tests the division function. |
| **`testZeroDivision`** | Tests division by zero and expects a revert. |

---

## 🛠️ **How to Use**

### 🔧 **Prerequisites**
- Install **Foundry**: [Installation Guide](https://book.getfoundry.sh/)

### 🚀 **Deployment Steps**
1. Clone the project repository from GitHub.
   ```sh
   git clone https://github.com/aflores255/CalculatorFoundry.git
   ```
2. Navigate to the project folder.
   ```sh
   cd your_repository
   ```
3. Install dependencies.
   ```sh
   forge install
   ```
4. Run the tests.
   ```sh
   forge test
   ```
5. Deploy the contract on an Ethereum-compatible blockchain.

---

## 📄 **License**
This project is licensed under the **MIT License**. Feel free to use and improve it! 🚀
