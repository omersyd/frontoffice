# **Instructions to Install Asdf, Erlang, and Elixir**

A **Live Demo** is available at [Live Demo](https://chart.syyid.club).  

Refer to the **Asdf Installation Guide**: [Guide](https://asdf-vm.com/guide/getting-started.html).  
Follow the steps in the guide to install Asdf for your target machine.  

> **Note**: Steps 1 through 3 in the installation guide are sufficient to install Asdf.

---

### **Installing Erlang**  
1. **Erlang version used for development**: `26.0`  
2. Add the Erlang plugin:  
   ```bash
   asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
   ```  
3. Install Erlang version `26.0`:  
   ```bash
   asdf install erlang 26.0
   ```  
4. Set Erlang as the global version:  
   ```bash
   asdf global erlang 26.0
   ```

---

### **Installing Elixir**  
1. **Elixir version used for development**: `1.17.0-otp-26`  
2. Add the Elixir plugin:  
   ```bash
   asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
   ```  
3. Install Elixir version `1.17.0-otp-26`:  
   ```bash
   asdf install elixir 1.17.0-otp-26
   ```  
4. Set Elixir as the global version:  
   ```bash
   asdf global elixir 1.17.0-otp-26
   ```

---

# **Instructions to Compile and Start the Application**


### **Compiling and Running the Project**  
1. Navigate to the project directory and fetch dependencies:  
   ```bash
   mix deps.get
   ```  
2. Compile project dependencies:  
   ```bash
   mix deps.compile
   ```  
3. Install Node.js version `v20.14.0`:  
   Navigate to the `assets` folder inside the project directory and install JavaScript-based dependencies:  
   ```bash
   npm install
   ```  
4. Start the server:  
   ```bash
   ./start.sh
   ```  
   The server will be available at: `http://localhost:4000`

---

### **Fetching Data on the Chart**  
1. Select a symbol from the dropdown menu.  
2. Choose the "From" and "To" dates.  
3. Click the **Fetch** button to retrieve and display chart data.
