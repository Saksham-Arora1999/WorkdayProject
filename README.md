<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p>

<h3 align="center">Workday Project</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/kylelobo/The-Documentation-Compendium.svg)](https://github.com/kylelobo/The-Documentation-Compendium/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/kylelobo/The-Documentation-Compendium.svg)](https://github.com/kylelobo/The-Documentation-Compendium/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Few lines describing your project.
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Structure](#structure)
- [TestCoverage](#test_coverage)

## 🧐 About <a name = "about"></a>

It is a basic search application where users can search over the nasa images API.
Some features implemented:
1) Image caching
2) Lazy Navigation Links
3) Debouncing

## 🏁 Structure <a name = "structure"></a>

The Application is built using MVVM architectecture. Several data services, and utilities are defined to have loose coupling between the components, also it make sures that any component can be modified without modifying othercomponents of the application.

### Third Party Libraries

Third party libraries used are:

```
1) Swift-async-algorithms: https://github.com/apple/swift-async-algorithms
```

This library gives us valuable functions such as debouncing, throttling and many others while working with swift-concurrency.

### Installing

To add the third-part library into your project, you can use lightweight SPM to add it as a dependency. 

## 🔧 Test Coverage <a name = "test_coverage"></a>

By implementing unit-tests for the components and UI tests for the views, we have achieved the test-coverage of 86%
