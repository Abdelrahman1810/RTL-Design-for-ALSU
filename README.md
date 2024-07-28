# RTL Design for ALSU

This repository contains the Verilog code and testbenches for the Arithmetic Logic Shift Unit (ALSU) design. The ALSU is a core component of a simple processor, and this project focuses on the RTL (Register Transfer Level) design of the ALSU.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Design](#design)
3. [Features](#features)
4. [Getting Started](#getting-started)
5. [Contributing](#contributing)
6. [Contact info](#contact-info)
7. [Eng.Kareem Waseem](#this-assignment-from-engkareem-waseem-diploma)

---

## Introduction
The Arithmetic Logic Shift Unit (ALSU) is a crucial component of a processor that performs various arithmetic, logical, and shift operations. This repository provides the RTL design and implementation of an ALSU, which can be used as a building block for a larger processor design.

---

## Design
The ALSU design is implemented in Verilog HDL and is structured as follows:
```
RTL-Design-for-ALSU
├── Documents
├── Imges
├── RTL
│   ├── ALSU.v
│   └── Register.v
├── testbench
│   └── testbench.v
├── basys_master.xdc
├── run.do
└── README.md
```

---

## Features
The ALSU in this repository supports the following operations:
- Addition
- Subtraction
- AND
- OR
- NOT
- Left Shift
- Right Shift

The main components of the ALSU design are:
- `Register.v`: The top-level module that integrates the ALSU and it's registers.
- `alsu.v`: The ALSU module.

The `testbench` directory contains the testbench file `testbench.v` for verifying the ALSU functionality.

---

## Getting Started
To get started with this repository, follow these steps:
> [!IMPORTANT]
> You need to download [QuestaSim](https://support.sw.siemens.com/en-US/) first.

1. Clone the repository to your local machine using the following command:
    ```ruby
        https://github.com/Abdelrahman1810/RTL-Design-for-ALSU.git
    ```
2. Open QuestaSim and navigate to the directory where the repository is cloned.
3. Compile the Verilog files by executing the following command in the QuestaSim transcript tap: 

    ```ruby
    do run.do
    ```
This will compile All files in Codes folder.

---

##  Contributing

If you find any issues or have suggestions for improvement, feel free to submit a pull request or open an issue in the repository. Contributions are always welcome!

<details closed>
    <summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```ruby
   https://github.com/Abdelrahman1810/RTL-Design-for-ALSU.git
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```ruby
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```ruby
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```ruby
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

## Contact info

<a href="https://linktr.ee/A_Hassanen" target="_blank">
  <img align="left" alt="Linktree" width="180px" src="https://app.ashbyhq.com/api/images/org-theme-wordmark/b3f78683-a307-4014-b236-373f18850e2c/d54b020a-ff53-455a-9d52-c90c0f4f2081.png" />
</a> 
<br>
<br>
<br>

### this Assignment from Eng.Kareem Waseem diploma
  <tbody>
    <tr>
      <td align="left" valign="top" width="14.28%">
      <a href="https://www.linkedin.com/in/kareem-waseem/"><img src="https://th.bing.com/th/id/OIP.gWfK4ytf9t3fZF2i2oE71QHaIi?rs=1&pid=ImgDetMain" width="100px;" alt="Kareem Waseem"/><br /><sub><b>Kareem Waseem</b></sub></a>
      <br /><a href="kwaseem94@gmail.com" title="Gmail">📧</a> 
      <a href="https://www.linkedin.com/in/kareem-waseem/" title="LinkedIn">🌍</a>
      <a href="https://linktr.ee/kareemw" title="Talks">📢</a>
      <a href="https://www.facebook.com/groups/319864175836046" title="Facebook grp">💻</a>
      </td>
    </tr>
  </tbody>

---
[**Return**](#table-of-contents)
---