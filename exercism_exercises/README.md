## Installation Instruction for Environment and Tools

---
#### MacOS through VSCode
1) Install <a href="https://elixir-lang.org/install.html"> asdf</a>
2) Install Required Plugins for package management -- Elixir & Erlang using following commands in terminal
    - asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang
    - asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir
3) Install Required versions of languages using following commands:
    - asdf install erlang 26.0.2
    - asdf install elixir 1.16.0-otp-26
4) Configure asdf global and local settings to use desired Erlang and Elixir Versions with:
    
    ** This will create a .tool-versions file within the project directory ** 
    - asdf local erlang 26.0.2
    - asdf local elixir 1.16.0-otp-26
5) Exercises will be run through the exercism CLI -- more information found <a href="https://exercism.org/cli-walkthrough">here</a>
    - brew update
    - brew install exercism
    - exercism version (Should be above 3.x)
6) Configure Exercism CLI and add your token
    - exercism configure --token= <"Your Token Here">
    
    ** If you encounter permission issues due to folder lock on MacOS, follow this <a href="https://macpaw.com/how-to/permission-denied-terminal">guide</a> **