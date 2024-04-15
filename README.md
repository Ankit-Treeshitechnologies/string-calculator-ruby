# String Calculator

The String Calculator is a Ruby-based application designed to provide a simple utility for adding numbers provided as strings. This application can process strings containing numbers separated by commas, custom delimiters, and also correctly handles new lines as delimiters. It also enforces rules such as ignoring numbers larger than 1000 and throwing errors for negative numbers.

## Installation

To set up the String Calculator on your local machine, follow these steps:

### Prerequisites

- Ruby (Version 2.5 or later recommended)
- Bundler (Version 2.0 or later)

### Setting Up

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Ankit-Treeshitechnologies/string-calculator-ruby.git
   cd string-calculator

2. Install the required gems using Bundler:
   ```bash
   gem install rspec

### Running the Tests

To ensure the String Calculator works as expected, run the tests using RSpec:
```bash
rspec string_calculator.rb
````

### Features

**Custom Delimiters:** Supports defining custom delimiters directly within the string.

**Error Handling:** Gracefully handles errors for negative numbers and numbers larger than 1000.

**Flexible Input:** Can handle multiple types of delimiters including new lines and custom defined characters.
    