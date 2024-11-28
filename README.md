
## Instructions to Install Asdf, Erlang, and Elixir

**Live Demo** is available at [Live Demo](https://chart.syyid.club)

**Asdf Installation Guide:** [Guide](https://asdf-vm.com/guide/getting-started.html)

Kindly follow the steps mentioned in installation guide to install asdf for the targeted machine.

**Note:** Following steps until step 3 are sufficient to install Asdf.

**Steps to Install Erlang:**  
**1.** Erlang version used for development ``` 26.0```  
**2.** Run the following command to get erlang plugin ``` asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git```  
**3.** Run the following command to install erlang version 26.0 ```asdf install erlang 26.0 ```

**Steps to Install Elixir:**  
**1.** Elixir version used for development ``` 1.17.0-otp-26 ```  
**2.** Run the following command to get elixir plugin ``` asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git ```  
**3.** Run the following command to install elixir version 1.17.0-otp-26 ```asdf install elixir 1.17.0-otp-26 ```

**Steps to compile and run:**  
**1.** Navigate to the project directory and run ``` mix deps.get ```  
**2.** To compile project dependencies run ```mix deps.compile```  
**3.** Insall NodeJs Version ```v20.14.0``` and navigate to ```assets``` folder inside of project directory and run ```npm i``` to install charting library and other JavaScript based dependencies.  
**4.** After installation of all the dependencies, run ```./start.sh``` to start the server at ```localhost:4000```


**Instructions to fetch data on chart**  
**1.** Select symbol from dropdown.   
**2.** Select from and to date.  
**3.** Click on Fetch button to get the chart data.